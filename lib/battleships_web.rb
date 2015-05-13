require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views")}

  get '/' do
    erb :index
  end

  get '/game/new' do
    erb :New_Game
  end

  post '/game/new' do
    @visitor = params[:name]
    if @visitor && !@visitor.empty?
      redirect '/board'
    else
      redirect '/game/new'
    end
  end

  get '/board' do
    erb :Board
  end





  # start the server if ruby file executed directly
  run! if app_file == $0
end