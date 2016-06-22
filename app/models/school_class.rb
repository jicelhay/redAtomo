# == Schema Information
#
# Table name: school_classes
#
#  id           :integer          not null, primary key
#  name         :string
#  securityCode :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  school_id    :integer
#  user_id      :integer
#

class SchoolClass < ActiveRecord::Base
  has_many :parent_obligations
  has_many :users, through: :parent_obligations
  has_many :posts
  has_many :multimedia_posts
  has_many :communication_posts
  belongs_to :school
  belongs_to :user

  alias_attribute :parents, :users
  alias_attribute :teacher, :user

  validates_uniqueness_of :securityCode

end
