# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  title           :string
#  body            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  school_class_id :integer
#  user_id         :integer
#

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :school_class
  alias_attribute :author, :user

end
