class Post < ActiveRecord::Base
  belongs_to :user
end

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  last_edit  :datetime
#  type       :string(255)
#  parent_id  :integer
#  desc       :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
