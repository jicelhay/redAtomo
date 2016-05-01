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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
