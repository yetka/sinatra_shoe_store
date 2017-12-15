class ShoeStore < ActiveRecord::Base
  validates(:store_name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})
  has_many :brand_stores
  has_many :shoe_brands, through: :brand_stores
end
