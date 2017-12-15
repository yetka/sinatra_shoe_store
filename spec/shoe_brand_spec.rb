require('spec_helper')

describe(ShoeBrand) do

  it("validates presence of name") do
    shoe_brand = ShoeBrand.new({:name => ""})
    expect(shoe_brand.save()).to(eq(false))
  end

  it("ensures the length of name is at most 100 characters") do
    shoe_brand = ShoeBrand.new({:name => "a".*(101)})
    expect(shoe_brand.save()).to(eq(false))
  end

  it("has many shoe stores") do
    shoe_store1 = ShoeStore.create({:name => "Downtown Shoes"})
    shoe_store2 = ShoeStore.create({:name => "Ballard Store"})
    shoe_brand = ShoeBrand.create({:name => "Reebok", :shoe_store_ids => [shoe_store1.id, shoe_store2.id]})
    expect(shoe_brand.shoe_stores).to(eq([shoe_store1, shoe_store2]))
  end
end
