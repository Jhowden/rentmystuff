class UsersController < ApplicationController
  def show

    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])


    if request.xhr?
      render :json =>  {"about" => @user.about}
    else
      redirect_to user_path
    end
  end
end
