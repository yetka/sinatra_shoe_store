require('spec_helper')

describe(ShoeBrand) do
  it("has many shoe stores") do
    shoe_store1 = ShoeStore.create({:name => "Downtown Shoes"})
    shoe_store2 = ShoeStore.create({:name => "Ballard Store"})
    shoe_brand = ShoeBrand.create({:name => "Reebok", :shoe_store_ids => [shoe_store1.id, shoe_store2.id]})
    expect(shoe_brand.shoe_stores).to(eq([shoe_store1, shoe_store2]))
  end
end
