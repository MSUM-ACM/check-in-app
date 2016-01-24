class UsersController < ApplicationController

  layout "application"

  def index
    respond_to do |format|
      format.html
       format.csv { render :csv => User.all }
     end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User successfully added"
      redirect_to :action => :new
    else
      flash[:alert] = "Failed to add user"
      render 'new'
    end
  end

  def destroy
    @post = User.find(params[:id])
    @post.destroy

    redirect_to action: :index
  end

  def remove_all
    User.delete_all
    flash[:notice] = "Succefully removed all users"
    redirect_to action: :index
  end



private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
