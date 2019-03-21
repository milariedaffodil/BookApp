class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :check_authorization, only: [:edit, :update]
  before_action :set_user



    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      #@users = User.all
      #@user = User.create(product_params)
      @user = User.new
      if @user.save
        redirect_to(@user)
      else
        render action: :new # renders views/something/new.html.erb
      end
    end

    def edit
      #@user = User.find(params[:id])
    end

    def update
      @users = User.all
      @user = User.find(params[:id])

      @user.update_attributes(user_params)

     if @user.update(user_params)
        redirect_to user_path(@user)
     else
      flash.now[:alert] = "Something went wrong. Please try again"
      render 'edit'
      end  

    end

    def delete
     # @user = User.find(params[:product_id])
    end

    def destroy
      #@users = User.all
      #@user = User.find(params[:id])
      #@user.destroy
    end

  private

    def check_authorization
        unless current_user.id == params[:id].to_i
        redirect_to root_path
      end


    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:avatar, :full_name)
    end

end  