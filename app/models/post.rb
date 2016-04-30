class Post < ActiveRecord::Base
belongs_to :user
belongs_to :class
alias_attribute :author, :user

end
