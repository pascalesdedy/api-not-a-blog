class UsersController < ApplicationController
before_action :authenticate_user, only: [ :show, :update, :destroy, :index ]
before_action :set_user, only: [ :show, :update, :destroy] 

def index
	@users = User.all
	render json: { result: true, user: @users }, status: :ok		
end
 	
def create
	@user = User.create(create_param)
	if @user.save
		render json: { result: true, user: @user }, status: :created
	else
		render json: { result: false, user: @user.errors }, status: :unprocessable_entity
	end
end

def show
	render json: { result: true, user: @user }, status: :ok
end

def update	
	if @user.update(update_param)
		render json: { result: true, user: @user  }, status: :created
	else
		render json: { result: false, user: @user.errors }, status: :unprocessable_entity
	end
end

def destroy
	@user.destroy
	head 204
end

private
def create_param
	params.require(:user).permit(:email, :password, :password_confirmation)
end


end
