class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @answers = Answer.includes(:comments).paginate(page: params[:page], per_page: 20)
    #respond_with(@answers)
  end

  def show
    respond_with(@answer)
  end

  def new
    @answer = answer.new
    respond_with(@answer)
  end

  def edit
  end

  def create
    @answer = answer.new(answer_params)
    @answer.save
    respond_with(@answer)
  end

  def update
    @answer.update(answer_params)
    respond_with(@answer)
  end

  def destroy
    @answer.destroy
    respond_with(@answer)
  end

  private
    def set_answer
      @answer = answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:title, :desc, :type)
    end
end
