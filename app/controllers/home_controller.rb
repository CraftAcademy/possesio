class HomeController < ApplicationController
  def index
    @user = current_user
    @invoices = current_user.invoices
  end


end