require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  def method_name
    @loan = Loan.new(title: "Professional Money Lenders",
                        description: "Need money fast? We can help you :^)",
                        user_id: 1,
                        min_amount: 100,
                        max_amount: 2000,
                        interest_rate: 20,
                        payment_frequency: "monthly",
                        payment_period: 1)
  end

  PAYMENT_FREQUENCY = ['daily', 'weekly', 'every two weeks', 'monthly',
                        'every two months', 'every six months', 'yearly']

  test "should be valid" do
    assert @loan.valid?, @loan.errors.full_messages
  end

  test "title should be present" do
    @loan.title = ""
    assert_not @loan.valid?, @loan.errors.full_messages
  end

  test "description should be present" do
    @loan.description = ""
    assert_not @loan.valid?, @loan.errors.full_messages
  end

  test "min_amount should be present" do
    @loan.min_amount = ""
    assert_not @loan.valid?, @loan.errors.full_messages
  end

  test "min_amount must be an integer" do
    @loan.min_amount = "1m45"
    assert_no_match "/\A[+-]?\d+\z/", @loan.min_amount.to_s, @loan.errors.full_messages
  end

  test "max_amount should be present" do
    @loan.max_amount = ""
    assert_not @loan.valid?, @loan.errors.full_messages
  end

  test "max_amount must be an integer" do
    @loan.max_amount = "1 45"
    assert_no_match "/\A[+-]?\d+\z/", @loan.max_amount.to_s, @loan.errors.full_messages
  end

  test "interest_rate should be present" do
    @loan.interest_rate = ""
    assert_not @loan.valid?, @loan.errors.full_messages
  end

  test "interest_rate must be an integer" do
    @loan.interest_rate = "5%"
    assert_no_match "/\A[+-]?\d+\z/", @loan.interest_rate.to_s, @loan.errors.full_messages
  end

  test "payment_frequency should be present" do
    @loan.payment_frequency = ""
    assert_not @loan.valid?, @loan.errors.full_messages
  end

  test "payment_frequency must be included" do
    assert_includes PAYMENT_FREQUENCY, @loan.payment_frequency, @loan.errors.full_messages
  end

  test "payment_period should be present" do
    @loan.payment_period = ""
    assert_not @loan.valid?, @loan.errors.full_messages
  end

  test "payment_period must be an integer" do
    @loan.payment_period = "1m45"
    assert_no_match "/\A[+-]?\d+\z/", @loan.payment_period.to_s, @loan.errors.full_messages
  end
end
