class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      log_in @user
      flash.now[:success] = 'User has been successfully registered!'
      redirect_to @user
    else
      render 'new'
    end
    # @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    # if @user.save
    #   format.html { redirect_to @user, notice: 'User was successfully registered.' }
    #   format.json { render :show, status: :ok, location: @user }
    #   # flash.now[:success] = 'User has been successfully registered!'
    #   session[:user_id] = @user.id
    #   # redirect_to post_path
    # else
    #   redirect_to :back
    # end
  end

  def update
    respond_to do |format|
      if @user.update(params.require(:user).permit(:name, :email))
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
