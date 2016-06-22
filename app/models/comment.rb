class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  alias_attribute :author, :user

  validates :body, presence: true  
end
