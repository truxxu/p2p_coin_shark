class LoansController < ApplicationController
  def index
    @loans = Loan.all
  end

  def my_loans
    @loans = Loan.where(user_id: current_user.id)
    @requests = Request.where(loan_id: current_user.requests)
  end

  def show
    @loan = Loan.find(params[:id])
    @user = User.find(@loan.user_id)
  end
end
