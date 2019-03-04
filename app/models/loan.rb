class Loan < ApplicationRecord
  belongs_to :user
  has_many :requests

  PAYMENT_FREQUENCY = ['daily', 'weekly', 'every two weeks', 'monthly',
                       'every two months', 'every six months', 'yearly']

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :min_amount, presence: true, numericality: true
  validates :max_amount, presence: true, numericality: true
  validates :interest_rate, presence: true, numericality: true
  validates :payment_frequency, presence: true, inclusion: { in: PAYMENT_FREQUENCY }
  validates :payment_period, presence: true, numericality: true
end
