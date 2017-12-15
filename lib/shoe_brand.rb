class ShoeBrand < ActiveRecord::Base
  validates(:brand_name, {:presence => true, :length => { :maximum => 100 }})
  before_save(:upcase_name)
  has_many :brand_stores
  has_many :shoe_stores, through: :brand_stores

  private

  def upcase_name
    self.brand_name=(brand_name().upcase())
  end
end
