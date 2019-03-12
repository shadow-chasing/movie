class MovieData::GenresController < ApplicationController

  def index
    if params[:gen]
      @genre_id = Genre.find_by(id: params[:gen]).name
      @genres = Genre.where(name: @genre_id).paginate(:page => params[:page], :per_page => 18)
    else
      @genres = Genre.all.paginate(:page => params[:page], :per_page => 18)
    end
  end

end
