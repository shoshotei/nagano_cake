class Admin::GenresController < ApplicationController
 def index
    @genres = Genre.all
    @genre = Genre.new
 end

 def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
 end

 def edit
    @genre = genre.params(params:[id])
 end

 def update
   @genre = genre.params(params:[id])
   @genre.update(genre.params)
   redirect_to admin_genres_path
 end

end
