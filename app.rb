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

get('/stores/:id') do
  @store = ShoeStore.find(params[:id].to_i)
  @brands = ShoeBrand.all()
  erb(:store_edit)
end

delete('/stores/:id/edit') do
  @store = ShoeStore.find(params.fetch("id").to_i())
  @store.delete()
  @stores = ShoeStore.all()
  @brands = ShoeBrand.all()
  erb(:index)
end

patch('/stores/:id/edit') do
  @store = ShoeStore.find(params[:id].to_i)
  store_name = params[:store_name]
  brand_ids = params[:brand_ids]
  @store.update({:store_name => store_name, :shoe_brand_ids => brand_ids})
  @brands = ShoeBrand.all()
  @stores = ShoeStore.all()
  erb(:index)
end

get('/brands/:id') do
  @brand = ShoeBrand.find(params[:id].to_i)
  erb(:brand_edit)
end

delete('/brands/:id/edit') do
  @brand = ShoeBrand.find(params.fetch("id").to_i())
  @brand.delete()
  @brands = ShoeBrand.all()
  @stores = ShoeStore.all()
  erb(:index)
end

post('/brands/:id/edit') do
  name = params.fetch("brand_name")
  price = params.fetch("brand_price")
  @brand = ShoeBrand.find(params.fetch("id").to_i())
  @brand.update({:brand_name => name, :brand_price => price})
  @brands = ShoeBrand.all()
  @stores = ShoeStore.all()
  erb(:index)
end

get ('/stores_list') do
  @stores = ShoeStore.all()
  erb(:stores_list)
end

get '/stores_brands/:id' do
  @store = ShoeStore.find(params.fetch("id").to_i())
  erb(:stores_brands)
end
