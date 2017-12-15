require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get ("/") do
  @stores = ShoeStore.all()
  @brands = ShoeBrand.all()
  erb(:index)
end

get ("/brand_form") do
  erb(:brand_form)
end

get ("/store_form") do
  @brands = ShoeBrand.all()
  erb(:store_form)
end

post("/brand_form") do
  brand_name = params[:brand_name]
  brand_price = params[:brand_price]
  @brand = ShoeBrand.create({:brand_name => brand_name, :brand_price => brand_price, :id => nil})
  if @brand.save()
    @stores = ShoeStore.all()
    @brands = ShoeBrand.all()
    erb(:index)
  else
    erb(:error)
  end
end

patch("/store_form") do
  store_name = params[:store_name]
  brand_ids = params[:brand_ids]
  @store = ShoeStore.create({:store_name => store_name, :shoe_brand_ids => brand_ids, :id => nil})
  if @store.save()
    @stores = ShoeStore.all()
    @brands = ShoeBrand.all()
    erb(:index)
  else
    erb(:error)
  end
end

# get('/stores/:id') do
#   @store = ShoeStore.find(params[:id].to_i)
#   @brands = ShoeBrand.all()
#   erb(:store_edit)
# end
