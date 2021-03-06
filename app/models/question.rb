class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  def self.cached_find(id)
    Rails.cache.fetch([self, id]) { find(id) }
  end
end

# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  desc       :text
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_questions_on_user_id  (user_id)
#
