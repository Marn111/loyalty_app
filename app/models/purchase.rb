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

class Purchase < ApplicationRecord
  STANDARD_POINT = 10
  enum ordered_from: %w(Japan Singapore Thiland Cambodia Laos Malaysia India)
  enum currency: %w(JYP SGD THB KHR LAK MYR INR)

  validates :user_id, presence: true
  validates :amount, presence: true
  validates :currency, presence: true
  validates :ordered_from, presence: true

  belongs_to :user

  after_create :increase_points

  def increase_points
    if self.user
      user = self.user
      points = amount/Purchase::STANDARD_POINT
      points = points*2 if ordered_from != user.origin_country
      user.points += points
      user.save
    end
  end
end
