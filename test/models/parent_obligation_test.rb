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

require 'test_helper'

class ParentObligationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
