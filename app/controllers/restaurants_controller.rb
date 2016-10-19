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
    yelp_results = Yelp.client.search(params[:yelp][:city], {term: params[:yelp][:cuisine] })
    yelp_results.businesses.each do |business|
      Restaurant.create(name:business.name, rating: business.rating, address: business.location.display_address)
    end
    redirect to '/restaurants'
  end

end
