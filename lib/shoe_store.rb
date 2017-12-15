class ShoeStore < ActiveRecord::Base
  validates(:name, {:presence => true, :length => { :maximum => 100 }})
  has_many :brand_stores
  has_many :shoe_brands, through: :brand_stores
end
