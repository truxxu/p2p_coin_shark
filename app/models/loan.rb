class Loan < ApplicationRecord
  belongs_to :user
  has_many :requests

  PAYMENT_FREQUENCY = ['daily', 'weekly', 'every two weeks', 'monthly',
                        'every two months', 'every six months', 'yearly']

  validates :title, presence: true
  validates :description, presence: true
  validates :min_amount, presence: true, numericality: true
  validates :max_amount, presence: true, numericality: true
  validates :interest_rate, presence: true, numericality: true
  validates :payment_frequency, presence: true
  validates :payment_period, presence: true, numericality: true
end
