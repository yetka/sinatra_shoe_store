require('spec_helper')

describe(ShoeBrand) do

  it("validates presence of name") do
    shoe_brand = ShoeBrand.new({:brand_name => ""})
    expect(shoe_brand.save()).to(eq(false))
  end

  it("ensures the length of name is at most 100 characters") do
    shoe_brand = ShoeBrand.new({:brand_name => "a".*(101)})
    expect(shoe_brand.save()).to(eq(false))
  end

  it("ensures the brand name is unique") do
    shoe_brand1 = ShoeBrand.new({:brand_name => "Nike"})
    shoe_brand1.save()
    shoe_brand2 = ShoeBrand.new({:brand_name => "Nike"})
    expect(shoe_brand2.save()).to(eq(false))
  end

end
