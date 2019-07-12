# == Schema Information
#
# Table name: users
#
#  id             :bigint           not null, primary key
#  name           :string
#  birthday       :datetime
#  points         :float            default(0.0)
#  origin_country :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
