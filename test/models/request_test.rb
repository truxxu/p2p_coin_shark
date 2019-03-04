require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  def setup
    @request = Request.new(loan_start: "2019-03-15",
                          loan_end: "2019-09-15",
                          user_id: 1,
                          loan_id: 1,
                          requested_amount: 650)
  end

  # test "should be valid" do
  #   assert @request.valid?, @request.errors.full_messages
  # end

  test "requested_amount should be present" do
    @request.requested_amount = nil
    assert_not @request.valid?, @request.errors.full_messages
  end

  test "loan_start should be present" do
    @request.loan_start = nil
    assert_not @request.valid?, @request.errors.full_messages
  end

  test "loan_end should be present" do
    @request.loan_end = nil
    assert_not @request.valid?, @request.errors.full_messages
  end

  test "requested_amount must be an integer" do
    @request.requested_amount = "10sdg45"
    assert_no_match "/\A[+-]?\d+\z/", @request.requested_amount.to_s, @request.errors.full_messages
  end
end
