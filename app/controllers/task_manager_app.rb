require_relative '../models/quesadilla.rb'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  attr_reader :quesadillas, :quesadilla

  get '/' do
    erb :dashboard
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

end
