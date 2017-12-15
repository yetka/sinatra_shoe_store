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

  it("ensures the store name is unique") do
    shoe_store1 = ShoeStore.new({:store_name => "Downtown Shoes"})
    shoe_store1.save()
    shoe_store2 = ShoeStore.new({:store_name => "Downtown Shoes"})
    expect(shoe_store2.save()).to(eq(false))
  end


end
