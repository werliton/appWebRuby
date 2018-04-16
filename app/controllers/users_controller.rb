class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user,
                  :notice => 'Cadastro criado com sucesso!'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user,
                  :notice => 'Cadastro atualizado com sucesso!'
    else
      render :update
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
   params.require(:user).permit(:email, :full_name, :location, :description, :bio)
  end

end