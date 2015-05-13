require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  @@game = Game.new Player, Board
  @@ship = Ship.new :ship
  @@player_1 = Player.new

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
    @board = @@game.own_board_view(@@game.player_1)
    erb :Board
  end


  post '/board' do
    @coordinate=params[:coordinate]
    @orientation=params[:orientation]
    @@game.player_1.place_ship(Ship.battleship, @coordinate, @orientation)

  end






  # start the server if ruby file executed directly
  run! if app_file == $0
end