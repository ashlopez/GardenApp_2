class Garden
  include Mongoid::Document
  
  field :name, type: String
  field :location, type: String
  
  embeds_many :vegetables
end



