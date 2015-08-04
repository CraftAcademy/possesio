require 'rails_helper'

RSpec.describe InvoicesController, :type => :controller do
  let(:customer)   { FactoryGirl.create(:user) }
  let(:user)       { FactoryGirl.create(:user) }
  let(:invoice)    { FactoryGirl.create(:invoice, sender: user, recipient: customer, currency: 'SEK') }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  it { is_expected.to use_before_action(:authenticate_user!) }

  describe 'GET index' do
    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index' do
      expect(response).to render_template(:index)
    end

    it 'includes invoice in @invoices' do
      expect(assigns(:invoices)).to include invoice
    end
  end

  describe 'GET show' do
    before { get :show, id: invoice.id }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders show' do
      expect(response).to render_template(:show)
    end

    it 'assigns invoice to @invoice' do
      expect(assigns(:invoice)).to eql invoice
    end
  end

  describe 'GET new' do
    before { get :new }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders new' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET create' do
    before { get :create, invoice: { sender: user, recipient: customer, currency: 'NOK' } }

    it 'redirects to show' do
      expect(response).to redirect_to invoice_path(Invoice.last)
    end
  end

  describe 'GET edit' do
    before { get :edit, id: invoice.id }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders edit' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET update' do
    before { get :update, {id: invoice.id, currency: 'USD'} }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders update' do
      expect(response).to render_template(:update)
    end
  end

end
