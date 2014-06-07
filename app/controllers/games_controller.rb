class GamesController < ApplicationController
	def new
		@game = Game.new
	end

	def statistics
		@kills = Kill.all
	end

	def create
	    @game = Game.new
	    @game.name = params[:game][:name]
	    @game.code = params[:game][:code]
	    @game.created_at = DateTime.now
	    @game.updated_at = DateTime.now
	    @game.is_started = false
	    @game.has_ended = false
	    @game.num_alive = 0
	    if @game.save then
	      redirect_to controller: :users, action: :index
	    else
	      render "new"
	    end
	end

	def index
		@games = Game.all
	end

	def join
		@game = Game.new
	end

	def post_join
		@game = Game.new
		if !session[:current_user_id].nil?
			@current_user = User.find(session[:current_user_id])
			@game = Game.find_by(code: params[:game][:code])
			if (params[:game][:code].blank?)
		      	@game = Game.new
		      	@game.errors.add(:code, ": You need to enter a code to join a game! Please try again!")
		      	render "join"
		  	elsif !@game.nil?
		  		@current_user.update(game: @game)
		  		if @current_user.save(:validate => false) then
		  			i = 4
		  			kill_str = ""
		  			while i > 0
		  				kill_int = Random.new.rand(0..9)
		  				kill_str = kill_str + kill_int.to_s
		  				i = i -1;
		  			end
		  			@current_user.kill_code = kill_str
		  			curr_num_alive = @game.num_alive
		  			@game.num_alive = curr_num_alive + 1
		  			@game.save(:validate => false)
		  			@current_user.save(:validate => false)
		  			UserMailer.game_welcome(@game, @current_user).deliver
			  		redirect_to controller: :users, action: :index

			  	else
			  		render "join"
			  	end
		  	else
		      	@game = Game.new
		      	@game.errors.add(:code, ": A game with this code does not exist! Please try again!")
		  		render "join"
		  	end
		end
	end

	def start
		@games = Game.all
		@game = Game.find(params[:id])
		users = Array.new(@game.players)
		num_users = users.length
		if (num_users > 1)
			first_index = Random.new.rand(0..num_users-1)
			first_user = users[first_index]	
			users.delete_at(first_index)
			num_users = num_users-1
			prev_user = first_user

			while num_users > 0
				curr_index = Random.new.rand(0..num_users-1)
				curr_user = users[curr_index]	
				users.delete_at(curr_index)
				curr_user.update(assassin: prev_user)
				prev_user.update(target: curr_user)
				curr_user.save(:validate => false)
				prev_user.save(:validate => false)
				num_users = num_users-1
				prev_user = curr_user
			end
			
			curr_user.update(target: first_user)
			first_user.update(assassin: curr_user)
			curr_user.save(:validate => false)
			first_user.save(:validate => false)

			users = Array.new(@game.players)
			num_users = users.length
			while num_users > 0
				@curr_user = users[num_users - 1]
				UserMailer.game_start(@game, @curr_user).deliver
				#Number of seconds editted for testing.
				@curr_user.term_date = DateTime.now.in(10) #86400
				@curr_user.save(:validate => false)
				num_users = num_users - 1
			end
			@game.is_started = true;
			@game.save(:validate => false)
		else
			redirect_to :back, :flash => { :error => "You need to have at least two players to start a game!" }
		end
	end
end
