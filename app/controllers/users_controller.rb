class UsersController < ApplicationController

  def index
    #@teste = 'Ruby poderoso para criacao de sistemas web'
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

  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation, :full_name, :location, :email, :bio)
  end
end