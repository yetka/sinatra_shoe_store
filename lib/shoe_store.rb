class ShoeStore < ActiveRecord::Base
  validates(:store_name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})
  before_save(:upcase_store_name)
  has_many :brand_stores
  has_many :shoe_brands, through: :brand_stores

  private

  def upcase_store_name
    self.store_name=(store_name().upcase())
  end

end
