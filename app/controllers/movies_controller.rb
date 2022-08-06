class MoviesController < ApplicationController 
	before_action :require_signin, except: [:index, :show]
	before_action :require_admin, except: [:index, :show]
	before_action :set_movie, only: [:show, :edit, :update, :destroy]
	
	def index
		@movies = Movie.send(movies_filter)

		# case params[:filter]
		# when "upcoming"
		# 	@movies = Movie.upcoming
		# when "recent"
		# 	@movies = Movie.recent
		# when "hits"
		# 	@movies = Movie.hits
		# when "flops"
		# 	@movies = Movie.flops
		# else
		# 	@movies = Movie.released
		# end
	end

	def new 
		@movie = Movie.new 
	end

	def create 
		@movie = Movie.new(movie_params)
		
		if @movie.save 
			redirect_to @movie, notice: "Movie created successfully!"
		else
			render :new 
		end
	end

	def show 
		@fans = @movie.fans 
		@genres = @movie.genres.order(:name)
		if current_user 
			@fav = current_user.favorites.find_by(movie_id: @movie.id)
		end
	end

	def edit 
	end

	def update 
		if @movie.update(movie_params)
			redirect_to @movie, notice: 'Movie updated successfully.'
		else
			render :edit 
		end
	end

	def destroy 
		if @movie.destroy 
			redirect_to movies_url, alert: 'Movie deleted successfully.'
		end
	end

private 
	def set_movie 
		@movie = Movie.find_by!(slug: params[:id])
	end

	def movie_params
		params.require(:movie).permit(:title, :description, :rating, :total_gross, :released_on,
		:director, :duration, :main_image, genre_ids: [])
	end

	def movies_filter
		if params[:filter].in? %w(upcoming recent hits flops)
			params[:filter]
		else
			:released
		end
	end
end