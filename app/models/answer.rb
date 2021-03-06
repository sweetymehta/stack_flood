class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :comments
end

# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  question_id :integer
#  desc        :text
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
