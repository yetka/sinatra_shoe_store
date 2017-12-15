require('spec_helper')

describe(ShoeStore) do

  it("validates presence of name") do
    shoe_store = ShoeStore.new({:store_name => ""})
    expect(shoe_store.save()).to(eq(false))
  end

  it("ensures the length of name is at most 100 characters") do
    shoe_store = ShoeStore.new({:store_name => "a".*(101)})
    expect(shoe_store.save()).to(eq(false))
  end

  it("has many shoe brands") do
    shoe_brand1 = ShoeBrand.create({:brand_name => "Reebok", :brand_price => "50"})
    shoe_brand2 = ShoeBrand.create({:brand_name => "Adidas",:brand_price => "75"})
    shoe_store = ShoeStore.create({:store_name => "Downtown Shoes", :shoe_brand_ids => [shoe_brand1.id, shoe_brand2.id]})
    expect(shoe_store.shoe_brands).to(eq([shoe_brand1, shoe_brand2]))
  end

end
