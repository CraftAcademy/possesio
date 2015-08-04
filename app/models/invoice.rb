class Invoice <  InvoicingLedgerItem
  acts_as_invoice

  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'
end
