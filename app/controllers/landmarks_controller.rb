class LandmarksController < ApplicationController
  get '/landmarks' do 
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks/new' do
    @landmark = Landmark.create(params[:landmark])
    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id].to_i)
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id].to_i)
    @landmark.update(params[:landmark])
    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id].to_i)
    erb :'landmarks/show'
  end
end
