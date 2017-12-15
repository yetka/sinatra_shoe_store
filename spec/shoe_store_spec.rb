require('spec_helper')

describe(ShoeStore) do

  it("validates presence of name") do
    shoe_store = ShoeStore.new({:name => ""})
    expect(shoe_store.save()).to(eq(false))
  end

  it("has many shoe brands") do
    shoe_brand1 = ShoeBrand.create({:name => "Reebok", :price => "50"})
    shoe_brand2 = ShoeBrand.create({:name => "NB",:price => "75"})
    shoe_store = ShoeStore.create({:name => "Downtown Shoes", :shoe_brand_ids => [shoe_brand1.id, shoe_brand2.id]})
    expect(shoe_store.shoe_brands).to(eq([shoe_brand1, shoe_brand2]))
  end
end
