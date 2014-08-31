class LinksController < ApplicationController
  before_filter :authorize, only: [:show, :update, :destroy]

  def index
    @links = Link.all
    @vote = Vote.new
    @comment = Comment.new
    @photo = Photo.new
  end

  def new
    @link = Link.new
  end

  def show
    @link = Link.find(params[:id])
    @commentable = @link
    @comments = @commentable.comments
    @comment = Comment.new
    @photoable = @link
    @photos = @photoable.photos
    @photo = Photo.new
  end

  def create
    @link = Link.new(user_params)
    @link.user_id = current_user.id
    if @link.save
      flash[:notice] = "Link was added"
      redirect_to links_path
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(user_params)
      flash[:notice] = "Link updated."
      redirect_to links_path(@link)
    else
      render 'edit'
    end
  end

  def destroy
    current_user
    @link = Link.find(params[:id])
    if @link.destroy
      flash[:notice] = "The link was deleted."
      redirect_to links_path
    end
  end

  private
    def user_params
      params.require(:link).permit(:title, :url, :user_id, :photo)
    end
end
