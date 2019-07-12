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

class User < ApplicationRecord
  enum origin_country: %w(Jpan Singapore Thiland Cambodia Laos Malaysia)

  validates :origin_country, presence: true
  has_many :purchases
end
