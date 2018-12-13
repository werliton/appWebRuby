class UsersController < ApplicationController

  def index
    #@teste = 'Ruby poderoso para criacao de sistemas web'
	  @users = User.all
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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, :notice => 'Cadastro atualizado com sucesso!'
    else
      render :update
    end
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
    params.require(:user).permit(:full_name, :location, :email, :password, :bio)
  end
end