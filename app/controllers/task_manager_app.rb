require_relative '../models/quesadilla.rb'
require 'pry'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true
  attr_reader :quesadillas, :quesadilla

  get '/' do
    erb :dashboard
    redirect '/quesadillas'
  end

  get '/quesadillas' do
    @quesadillas = Quesadilla.all
    erb :index
  end

  get '/quesadillas/new' do
    erb :new
  end

  get '/quesadillas/:id' do
    @quesadilla = Quesadilla.find(params[:id])
    erb :show
  end

  post '/quesadillas' do
    quesadilla = Quesadilla.new(params[:quesadilla])
    quesadilla.save
    redirect '/quesadillas'
  end

  get '/quesadillas/:id/edit' do
    @quesadilla = Quesadilla.find(params[:id])
    erb :edit
  end

  put '/quesadillas/:id' do |id|
    Quesadilla.update(id.to_i, params[:quesadilla])
    redirect "/quesadillas/#{id}"
  end

  delete '/quesadillas/:id' do |id|
    Quesadilla.delete(id.to_i)
    redirect '/quesadillas'
  end

end
