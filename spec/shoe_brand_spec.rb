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

  it("converts the brand name to uppercase") do
    shoe_brand = ShoeBrand.create({:brand_name => "Nike", :brand_price => "50"})
    expect(shoe_brand.brand_name()).to(eq("NIKE"))
  end

  it("change the brand price by adding dolar symbol") do
    shoe_brand = ShoeBrand.create({:brand_name => "Nike", :brand_price => "50"})
    expect(shoe_brand.brand_price()).to(eq("50$"))
  end

  it("has many shoe stores") do
    shoe_store1 = ShoeStore.create({:store_name => "Downtown Shoes"})
    shoe_store2 = ShoeStore.create({:store_name => "Ballard Store"})
    shoe_brand = ShoeBrand.create({:brand_name => "Reebok", :brand_price => "50", :shoe_store_ids => [shoe_store1.id, shoe_store2.id]})
    expect(shoe_brand.shoe_stores).to(eq([shoe_store1, shoe_store2]))
  end


end
