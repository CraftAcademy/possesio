class Invoice <  InvoicingLedgerItem
  acts_as_invoice

  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  def create_pdf
    pdf_creator = Invoicing::LedgerItem::PdfGenerator.new(self)
    pdf_creator.render_custom Rails.root.join("pdfs/#{self.recipient.id}.pdf")
  end
end
