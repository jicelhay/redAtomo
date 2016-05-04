# == Schema Information
#
# Table name: parent_obligations
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  school_class_id :integer
#

class ParentObligation < ActiveRecord::Base
  belongs_to :user
  belongs_to :school_class

  validates :user_id, presence: true, uniqueness: { scope: :school_class }
  validates :school_class_id, presence: true

end
