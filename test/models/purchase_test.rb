# == Schema Information
#
# Table name: purchases
#
#  id           :bigint           not null, primary key
#  user_id      :integer
#  amount       :float
#  items        :jsonb            not null
#  ordered_from :integer
#  currency     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
