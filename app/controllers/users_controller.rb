class UsersController < ApplicationController
  def show
    # @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new( user_params )

    if @user.save
      flash[:success] = "#{@user.username} Successfully Created an Account"
      redirect_to @user
    else
      flash.now[:danger] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                  :email,
                                  :password,
                                  :password_confirmation)
  end
end
