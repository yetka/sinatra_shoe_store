class ShoeBrand < ActiveRecord::Base
  validates(:name, {:presence => true, :length => { :maximum => 100 }})
  has_many :brand_stores
  has_many :shoe_stores, through: :brand_stores
end
