class Vegetable
  include Mongoid::Document
  field :name, type: String
  field :quantity, type: Integer
  embedded_in :garden


end
