class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]


  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    # This line attaches the uploaded image to the Micropost via Active Storage.

    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render "static_pages/home", status: :unprocessable_entity
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
    #or redirect_back(fallback_location: root_url)
    # request.referrer :- A smart way is to send the user back to the same page from where he took the action.
  end


  private

  def micropost_params
    params.require(:micropost).permit(:content, :image)
  end

  def correct_user
    if current_user.admin?
      @micropost = Micropost.find_by(id: params[:id])
    else
      @micropost = current_user.microposts.find_by(id: params[:id])
    end
    redirect_to root_url if @micropost.nil?
  end
end




# Feed : microposts of current user on home screen.
