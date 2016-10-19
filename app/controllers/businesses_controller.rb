class BusinessesController < ApplicationController


  post '/businesses' do

    @businesses = YelpApi.search(params[:city], params[:cuisine])
    erb :'/businesses/index.html'

  end


end
