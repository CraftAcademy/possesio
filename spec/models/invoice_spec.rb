require 'rails_helper'
#require 'invoicing/ledger_item/pdf_generator'
require 'custom_invoice'

RSpec.describe Invoice, type: :model do
  let(:product) { double(:product, name: 'T-Shirt', price: 10) }
  let(:customer) { FactoryGirl.create(:user) }
  let(:organization) { FactoryGirl.create(:user) }
  let(:add_line_item) {
    Proc.new do
      subject.line_items.build(description: product.name,
                               net_amount: product.price,
                               tax_amount: 0)
      subject.save
    end
  }

  let(:create_pdf) {
    Proc.new do
      pdf_creator = Invoicing::LedgerItem::PdfGenerator.new(subject)
      pdf_creator.render_custom Rails.root.join("pdfs/#{customer.id}.pdf")
    end
  }

  subject { Invoice.new(sender: organization,
                        recipient: customer,
                        currency: 'kr') }

  it '#new - creates an invoice' do
    expect(subject).to be_valid
    expect { subject.save }.to change(Invoice, :count).by 1
  end

  it 'adds line item' do
    expect { add_line_item.call }.to change(subject.line_items, :count).by 1
  end

  it 'assigns total' do
    add_line_item.call
    expect(subject.total_amount.to_i).to be 10
  end

  it 'generates a pdf invoice' do
    add_line_item.call
    create_pdf.call

    pdf_file = PDF::Reader.new(Rails.root.join("pdfs/#{customer.id}.pdf"))
    expect(pdf_file.pages.first.text).to include product.name
    expect(pdf_file.pages.first.text).to include product.name
  end
end

