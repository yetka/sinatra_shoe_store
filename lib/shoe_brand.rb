class ShoeBrand < ActiveRecord::Base
  validates(:brand_name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})
  before_save(:upcase_brand_name)
  before_save(:brand_price_with_symbol)
  has_many :brand_stores
  has_many :shoe_stores, through: :brand_stores

  private

  def upcase_brand_name
    self.brand_name=(brand_name().upcase())
  end

  def brand_price_with_symbol
    price = self.brand_price
    price = price + "$"
    self.brand_price = price
  end
end
