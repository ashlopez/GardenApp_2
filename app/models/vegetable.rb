class Vegetable
  include Mongoid::Document
  field :name, type: String
  field :quantity, type: Integer
  belongs_to :garden
end
