class Request < ApplicationRecord
  belongs_to :user
  belongs_to :loan

  validates :loan_start, presence: true
  validates :loan_end, presence: true
  validates :requested_amount, presence: true, numericality: true
end
