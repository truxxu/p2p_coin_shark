class LoansController < ApplicationController
  def index
    @loans = Loan.all
  end

  def show
    @loan = Loan.find(params[:id])
    @user = User.find(@loan.user_id)
  end
end
