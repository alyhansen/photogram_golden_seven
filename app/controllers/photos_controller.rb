class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def new_form
  end

  def create_row

    p = Photo.new
    p.source = params[:the_source]
    p.caption = params[:the_caption]
    p.save

    redirect_to('http://localhost:3000/photos')

  end

  def show
    @photo = Photo.find_by({ :id => params[:id]})
  end

  def edit_form
    @photo = Photo.find_by({ :id => params[:id]})
  end

  def update_row
    @photo = Photo.find_by({ :id => params[:id]})
    @photo.caption = params[:the_caption]
    @photo.source = params[:the_source]
    @photo.save
    redirect_to("http://localhost:3000/photos/#{@photo.id}")
  end

  def destroy
    p = Photo.find_by({ :id => params[:id]})
    p.destroy
    redirect_to('http://localhost:3000/photos')
  end

end
