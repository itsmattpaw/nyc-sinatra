class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect "/figures/#{@figure.id}"
  end

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id].to_i)
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id].to_i)
    erb :'figures/show'
  end

  patch '/figures/:id' do 
    @figure = Figure.find(params[:id].to_i)
    @figure.update(params[:figure])
    if !params[:figure].keys.include?("title_ids")
      params[:figure][:title_ids] = []
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
      @figure.save
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
      @figure.save
    end
    redirect "/figures/#{@figure.id}"
  end

end
