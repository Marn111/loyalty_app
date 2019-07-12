# == Schema Information
#
# Table name: purchases
#
#  id               :bigint           not null, primary key
#  user_id          :integer
#  amount           :float
#  items            :jsonb            not null
#  ordered_from     :integer
#  currency         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  collected_points :float            default(0.0)
#

class Purchase < ApplicationRecord
  STANDARD_POINT = 10
  enum ordered_from: %w(Japan Singapore Thailand Cambodia Laos Malaysia India)
  enum currency: %w(JYP SGD THB KHR LAK MYR INR)

  validates :user_id, presence: true
  validates :amount, presence: true
  validates :currency, presence: true
  validates :ordered_from, presence: true

  belongs_to :user

  after_create :increase_points
  before_create :collect_points

  private
  def increase_points
    if user = self.user
      user.points += collected_points
      user.save
    end
  end

  def collect_points
    # level 1: standard points
    points = amount/Purchase::STANDARD_POINT
    # level 2: order from different country
    points = points*2 if ordered_from != user.origin_country
    self.collected_points = points
  end
end
