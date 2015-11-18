module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-inventory
  class Inventory < APIResource
    extend Square::APIOperations::List

    endpoint_base 'inventory'

    def self.adjust
    end
  end
end
