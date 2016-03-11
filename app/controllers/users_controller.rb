class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @wikis = @user.wikis.public_wikis(@user)
    @private_wikis = Wiki.private_wikis(@user)
    @collaborated_wikis = @user.collaborated_wikis
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User account downgraded"
      redirect_to welcome_index_path
    else
      flash[:error] = "Invalid user info"
      redirect_to welcome_index_path
    end
  end
 
   private
 
   def user_params
     params.require(:user).permit(:name, :email, :role)
   end

end