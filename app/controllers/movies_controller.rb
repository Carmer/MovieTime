class MoviesController < ApplicationController
  #only allow admins
  before_action :authorize!, only: [:new, :create]
  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.all
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :year)
  end
end
