require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  @@game = Game.new Player, Board
  @@ship = Ship.new :ship
  @@player_1 = Player.new
  @@player_2 = Player.new

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
    @board = @@game.own_board_view(@@game.player_2)
    erb :Board
  end

  post '/board' do
    # @coordinate=params[:coordinate]
    @ship=params[:ship]
    x = ('A'..'J').to_a.sample
    y = (1..10).to_a.sample
    coordinate = "#{x}#{y}".to_sym
    ship = [Ship.destroyer, Ship.submarine, Ship.cruiser, Ship.battleship, Ship.aircraft_carrier].sample
       @@game.player_2.place_ship(ship, coordinate, :orientation)
       redirect '/board'
     end

     get '/fire' do
      @board = @@game.opponent_board_view(@@game.player_1)
      erb :fire
    end

    post '/fire' do
      @shoot_coordinate=params[:shoot_coordinate]
      @@game.player_1.shoot @shoot_coordinate.to_sym
      redirect '/fire'
     end






  # start the server if ruby file executed directly
  run! if app_file == $0
end