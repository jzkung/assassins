class UsersController < ApplicationController
  def index
    @past_games = Game.where(:has_ended => true)
    @current_games = Game.where(:has_ended => false)

    games = Game.all
    if !games.nil?
      games.each do |game|
        if game.is_started?
          count = 0;
          #players = User.all
          players = game.players
          start_player = nil
          players.each do |player|
            if player.status == "alive" #&& player.game == game
              count = count + 1
              start_player = player
            end
          end
          player = start_player
          @total = count
          while count > 0
            player.killring_degrees = count * 2 * Math::PI / @total
            player.save(:vaildate => false)
            player = player.assassin
            count = count - 1
          end
        end
      end
    end
  end
end
