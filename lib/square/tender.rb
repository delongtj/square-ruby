module Square
  class Tender < DataType
    # The tender's unique ID.
    property :id

    # The type of tender.
    property :type # Tender.Type

    # A human-readable description of the tender.
    property :name

    # The ID of the employee that processed the tender.
    # This field is included only if the associated merchant had employee
    # management features enabled at the time the tender was processed.
    property :employee_id

    # The URL of the receipt for the tender.
    property :receipt_url

    # The brand of credit card provided.
    # Only present if the tender's type is CREDIT_CARD.
    property :card_brand # Tender.CardBrand

    # The last four digits of the provided credit card's account number.
    # Only present if the tender's type is CREDIT_CARD.
    property :pan_suffix

    # The method with which the tender was entered.
    property :entry_method # Tender.EntryMethod

    # Notes entered by the merchant about the tender at the time of payment,
    # if any. Typically only present for tender with the type OTHER.
    property :payment_note

    # The total amount of money provided in this form of tender.
    property :total_money, coerce: Square::Money

    # The amount of total_money applied to the payment.
    property :tendered_money, coerce: Square::Money

    # The amount of total_money returned to the buyer as change.
    property :change_back_money, coerce: Square::Money

    # The total of all refunds applied to this tender.
    # This amount is always negative or zero.
    property :refunded_money, coerce: Square::Money
  end
end
