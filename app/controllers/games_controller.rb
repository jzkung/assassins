class GamesController < ApplicationController
	def new
		@game = Game.new
	end

	def create
	    @game = Game.new
	    @game.name = params[:game][:name]
	    @game.code = params[:game][:code]
	    @game.created_at = DateTime.now.utc
	    @game.updated_at = DateTime.now.utc
	    @game.reg_start = params[:game][:reg_start]
	    @game.reg_end = params[:game][:reg_end]
	    @game.game_start = params[:game][:game_start]
	    if @game.save then
	      redirect_to controller: :users, action: :index
	    else
	      render "new"
	    end
	end

	def index
		@game = Game.find(params[:id])
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
		users = User.player
		num_users = users.length

		first_index = Random.new.rand(0..num_users-1)
		first_user = users[first_index]	
		users.delete_at(first_index)
		num_users = num_users-1
		prev_user = first_user

		while num_users > 0
			prev_user.update(game: @game)
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
		
		curr_user.update(game: @game)
		curr_user.update(target: first_user)
		first_user.update(assassin: curr_user)
		curr_user.save(:validate => false)
		first_user.save(:validate => false)

	end
end
