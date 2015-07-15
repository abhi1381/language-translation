class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :set_user, only: [:edit, :show, :destroy, :update]

  def index
    if params[:q].blank?
      @users = User.accessible_by(current_ability).page(params[:page]).per(20)
    else
      @users = User.accessible_by(current_ability).user_search(params[:q]).page(params[:page]).per(20)
    end
  end

  def new
   @user = User.new
  end

  def create
   @user = User.new(user_params)

   if @user.save
    redirect_to @user
   else
    render 'new'
   end
  end

  def edit
  end

  def destroy
   @user.destroy

   redirect_to users_path
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def approve_user
    @user = User.find(params[:user_id])
    @user.login_approval_at = Time.now
    respond_to do |format|
      if @user.save
        format.json { render json: User.accessible_by(current_ability), status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def disapprove_user
    @user = User.find(params[:user_id])
    @user.login_approval_at = nil
    respond_to do |format|
      if @user.save
        format.json { render json: User.accessible_by(current_ability), status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end
 
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :location, :lang, :contact, :gender)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
