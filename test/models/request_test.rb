require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  def setup
    @request = Request.new(loan_start: "2019-03-15",
                          loan_end: "2019-09-15",
                          user_id: test_user.id,
                          loan_id: test_loan3.id,
                          requested_amount: 650)
  end
end
