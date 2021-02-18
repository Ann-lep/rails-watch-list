class SavedMoviesController < ApplicationController
  before_action :set_saved_movie, only: :destroy
  before_action :set_list, only: [:new, :create]

  def new
    @saved_movie = SavedMovie.new
  end

  def create
    @saved_movie = SavedMovie.new(saved_movie_params)
    @saved_movie.list = @list
    if @saved_movie.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @saved_movie.destroy
    redirect_to list_path(@saved_movie.list)
  end

  private

  def saved_movie_params
    params.require(:saved_movie).permit(:comment, :movie_id)
  end

  def set_saved_movie
    @saved_movie = SavedMovie.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
