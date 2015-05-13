require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views")}

  get '/' do
    erb :index
  end

  get '/New_Game' do
    erb :New_Game
  end

  post '/New_Game' do
    @visitor = params[:name]
    if @visitor.nil?
      @message = "No name"
      erb :New_Game
    else
      @message = "You have a name"
      redirect '/Board'
    end
  end

  get '/Board' do
    erb :Board
  end





  # start the server if ruby file executed directly
  run! if app_file == $0
end