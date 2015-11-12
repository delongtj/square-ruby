module Square
  class DataType < Hashie::Dash
    include Hashie::Extensions::Dash::Coercion
    include Hashie::Extensions::IndifferentAccess

    # This is our own enum extension.
    include Hashie::Extensions::Dash::Enum
  end
end
