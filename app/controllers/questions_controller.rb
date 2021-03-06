class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @questions = Question.paginate(page: params[:page], per_page: 20)
    #respond_with(@questions)
  end

  def show
    respond_with(@question)
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.save
    AnswerWorker.perform_async(@question.id)
    respond_with(@question)
  end

  def update
    @question.update(question_params)
    respond_with(@question)
  end

  def destroy
    @question.destroy
    respond_with(@question)
  end

  private
  def set_question
    @question = Question.cached_find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :desc, :type)
  end
end
