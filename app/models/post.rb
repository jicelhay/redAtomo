class Post < ActiveRecord::Base
belongs_to :user
belongs_to :school_class
alias_attribute :author, :user

end
