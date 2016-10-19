class RestaurantsController < ApplicationController

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :'/restaurants/index.html'
  end

  get '/restaurants/new' do
    erb :'/restaurants/new.html'
  end

  post '/restaurants' do
    restaurant = Restaurant.create(params[:restaurant])
    yelp_url = "https://www.yelp.com/search?find_desc=#{params[:restaurant][:name].split(" ").join("+")}&find_loc=#{params[:restaurant][:address].split(" ").join("+")}"
    google_url = "http://maps.google.com/?q=#{params[:restaurant][:address].split(/[\s,]+/).join("+")}"
    restaurant.update(yelp_url:yelp_url, google_url:google_url)
    redirect to "/restaurants/#{restaurant.id}"
  end

  get '/restaurants/:id' do
    @users = User.all
    @restaurant = Restaurant.find(params[:id])
    erb :'/restaurants/show.html'
  end

  get'/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :'/restaurants/edit.html'
  end

  patch '/restaurants/:id' do

    @restaurant = Restaurant.find(params[:id])
    if params[:restaurant] == nil
      @restaurant.users << User.find(params[:added_user])
    else
      @restaurant.update(params[:restaurant])
    end
    redirect to "/restaurants/#{@restaurant.id}"
  end

  delete '/restaurants/:id' do
    Restaurant.find(params[:id]).destroy
    redirect to '/restaurants'
  end

  post '/restaurants/yelp' do
    @yelp_results = Yelp.client.search(params[:yelp][:city], {term: params[:yelp][:cuisine] })
    erb :'restaurants/results.html'


  end

  post '/restaurants/results' do
    params[:yelp_ids].each do |id|
      restaurant = Business.find_by(yelp_id: id)

      modified_address = restaurant.formatted_address
      address_for_google = modified_address.split(/[\s,]+/).join("+")
      google_url = "http://maps.google.com/?q=#{address_for_google}"
      Restaurant.create(name:restaurant.name, rating: restaurant.rating, address: modified_address, rating_count: restaurant.review_count, phone: restaurant.phone, yelp_url: restaurant.url, google_url:google_url)
    end
    redirect to '/restaurants'

  end

end
