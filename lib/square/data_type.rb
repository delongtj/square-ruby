module Square
  class DataType < Hashie::Dash
    include Hashie::Extensions::Dash::Coercion
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::IgnoreUndeclared
  end
end
