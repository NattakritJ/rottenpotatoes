class ReviewsController < ApplicationController
    before_action :has_user_and_movie, :only => [:new, :create , :edit, :update , :destroy]
    
    protected
    def has_user_and_movie
      unless current_user
        flash[:warning] = 'You must be logged in to create a review.'
      end
      unless (@movie = Movie.find_by(:id => params[:movie_id]))
        flash[:warning] = 'Review must be for an existing movie.'
        redirect_to movies_path
      end
    end

    public
    def new
      unless current_user
          redirect_to movie_path(@movie.id)
      end
      @review = @movie.reviews.build
    end

    def create
      # since user_id is a protected attribute that won't get
      # assigned by the mass-assignment from params[:review], we set it
      # by using the << method on the association.  We could also
      
      current_user.reviews << @movie.reviews.build(params[:review].permit(:potatoes,:comments))
      
      redirect_to movie_path(@movie)
    end

    def edit
      unless current_user
        redirect_to movie_path(@movie.id)
      end
        @review = @movie.reviews.find params[:id]
    end
    
    def update
        @review = @movie.reviews.find params[:id]
        permitted = params[:review].permit(:potatoes,:comments)
        @review.update!(permitted)
    
        flash[:notice] = "Your review was successfully updated."
        redirect_to movie_path(@movie)
    end

    def destroy
      @review = @movie.reviews.find(params[:id])
      @review.destroy
      flash[:notice] = "Your review deleted."
      redirect_to movie_path(@movie)
    end
    private
  end