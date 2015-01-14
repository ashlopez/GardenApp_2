class Garden
  include Mongoid::Document
  #field :veggie, type: String
  #field :fruit, type: String
  field :name, type: Integer
  field :location, type: String
  has_and_belongs_to_many :users

  has_many :vegetable
end



