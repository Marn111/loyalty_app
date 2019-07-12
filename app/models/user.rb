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
#  rewards        :jsonb            not null
#

class User < ApplicationRecord
  enum origin_country: %w(Japan Singapore Thiland Cambodia Laos Malaysia)

  validates :origin_country, presence: true
  has_many :purchases

  scope :monthly, -> { joins(:purchases).where('EXTRACT(month FROM purchases.created_at) = ?', Time.now.month).uniq }

  def monthly_collected_points(month)
    date = Date.parse(date) if date.is_a?(String)
    self.purchases.where('EXTRACT(month FROM purchases.created_at) = ?', month).sum(:collected_points)
  end

end
