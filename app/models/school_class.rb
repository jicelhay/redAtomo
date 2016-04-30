class SchoolClass < ActiveRecord::Base
has_many :parent_obligations
has_many :posts
belongs_to :school
belongs_to :user

alias_attribute :parents, :parent_obligations
alias_attribute :teacher, :user

end
