class MoviesController < ApplicationController
    def index
        @movies = Movie.all.order('title ASC')
    end

    def show
      id = params[:id] # retrieve movie ID from URI route
      @movie = Movie.find(id) # look up movie by unique ID
      # will render app/views/movies/show.html.haml by default
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


    private
      def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date)
      end
  end