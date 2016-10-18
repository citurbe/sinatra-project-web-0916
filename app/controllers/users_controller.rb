class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'/users/index.html'
  end

  get '/users/new' do
    erb :'/users/new.html'
  end

  post '/users' do
    user = User.create(params[:user])
    redirect to "/users/#{user.id}"
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show.html'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'/users/edit.html'
  end

  patch '/users/:id' do
    @user = User.find(params[:id])
    @user.update(params[:user])
    redirect to "/users/#{@user.id}"
  end

  delete '/users/:id' do
    User.find(params[:id]).destroy
    redirect to '/users'
  end

end
