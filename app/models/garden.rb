class Garden
  include Mongoid::Document
  #field :veggie, type: String
  #field :fruit, type: String
  field :name, type: String
  field :location, type: String
  #has_and_belongs_to_many :users
  

  embeds_many :vegetables
end



