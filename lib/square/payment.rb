module Square
  # Square Connect Payments.
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-payments
  class Payment < APIResource
    data_type Square::DataTypes::Payment
    endpoint_base 'payments'
  end
end
