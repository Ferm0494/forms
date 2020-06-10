class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
  if @user.save
    flash[:notice]= "User created!"
    redirect_to new_user_path
  else
    flash[:notice]= "Please fix the errors : "
    render 'new'
  end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params) 
        flash[:notice]= "User updated correctly!"
        redirect_to edit_user_path
    else
        flash[:notice]= "Fix the errors"
        render 'edit'
    end

  end

  def edit
    @user = User.find(params[:id]);
  end

  private
  
  def user_params	
    params.require(:user).permit(:username, :password, :email)
  end

end
