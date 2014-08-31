class PhotosController < ApplicationController
    before_filter :load_photoable, except: [:index]

  def index
    @photos = Photo.all
  end

  def show
    @photos = Photo.all
    @link = Link.find(params[:link_id])
  end

  def new
    @photoable = Link.find(params[:link_id])
    @photo = @photoable.photos.new
  end

  def create
    @photoable = Link.find(params[:link_id])
    @photo = @photoable.photos.new(photo_params)
    if @photo.save
      flash[:notice] = "Photo was added."
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:notice] = "The photo was deleted."
      redirect_to link_photos_path
    end
  end




  private



    def photo_params
      params.require(:photo).permit(:id, :name, :photo, :user_id, :link_id, :photo_id, :photoable_id)
    end

  def load_photoable
    resource, id = request.path.split('/')[1, 2]
     #@photoable = resource.singularize.classify.constantize.find(id)
  end

end
