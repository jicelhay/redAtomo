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

require 'test_helper'

class SchoolClassTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
