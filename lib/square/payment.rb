module Square
  # Square Connect Payments.
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-payments
  class Payment < APIResource
    endpoint_base 'payments'
    data_type Square::DataTypes::Payment
  end
end
