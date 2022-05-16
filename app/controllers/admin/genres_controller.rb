class Admin::GenresController < ApplicationController
 def index
    @genres = genre.all
 end

 def create
 end

 def edit
   @genre = genre.params(params:[id])
 end

 def update
  @genre = genre.params(params:[id])
  @genre.update(genre.params)
  #redirect_to [ジャンル一覧、追加画面へ移動]
 end

end
