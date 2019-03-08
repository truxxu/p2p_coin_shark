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

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.user = current_user
    if @loan.save
      redirect_to my_loans_path(current_user.id)
    else
      render new_loan_path
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:title, :description, :min_amount,
                                 :max_amount, :interest_rate,
                                 :payment_frequency, :payment_period)
  end
end
