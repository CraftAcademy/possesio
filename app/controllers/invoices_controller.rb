class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.where(sender: current_user)
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    #binding.pry
    @invoice = Invoice.new
  end

  def create
    recipient = User.find_or_create_by(first_name: invoice_params[:recipient])
    @invoice = current_user.invoices.create(recipient: recipient,
                                    currency: invoice_params[:currency] ? invoice_params[:currency] : 'SEK' )
    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      invalid_request
    end
  end

  def edit
  end

  def update
  end

  private

  def invalid_request
    flash[:alert] = 'Something went wrong'
    render :new
  end

  def invoice_params
    params.require(:invoice).permit(:recipient, :sender, :currency)
  end
end
