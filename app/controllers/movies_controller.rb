class MoviesController < ApplicationController
    def index
      @movies = Movie.all.order('title ASC')
    end

    def show
      sum = 0.0
      count = 0.0
      id = params[:id] # retrieve movie ID from URI route
      @movie = Movie.find(id) # look up movie by unique ID
      @movie.reviews.each do |review|
        sum += review.potatoes
        count += 1
      end
      @avg = (sum / count).round(2)
      # will render app/views/movies/show.html.haml by default
      rescue ActiveRecord::RecordNotFound
        flash[:warning] = "Movie not found."
        redirect_to movies_path
    end

    def new

    end

    def create
      @movie = Movie.create!(movie_params)
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movie_path(@movie.id)
    end

    def edit
      @movie = Movie.find params[:id]
    end
    
    def update
      @movie = Movie.find params[:id]
      @movie.update!(movie_params)
      respond_to do |client_wants|
        client_wants.html {  redirect_to movie_path(@movie)  } # as before
        client_wants.xml  {  render :xml => @movie.to_xml    }
      end
    end

    def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy
      flash[:notice] = "Movie '#{@movie.title}' deleted."
      redirect_to movies_path
    end

    def search_tmdb
      Tmdb::Api.key("9e136fb4229626aa05f87796a4984291")
      @search_params = params[:search_terms]
      @search_params = " " if @search_params  == ""
      @search = Tmdb::Search.new
      @search.resource('movie')
      @search.query(@search_params)
      @result = @search.fetch
      if @result != []
        render "search"
      else
        flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb."
        redirect_to movies_path
      end
    end

    private
      def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date)
      end
  end