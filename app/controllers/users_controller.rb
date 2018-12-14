class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    if User.destroy(params[:id])
      redirect_to users_url
    else
      redirect_to @user, :notice => 'Não foi possivel deletar usuário'
    end
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
      SignupMailer.confirm_email(@user).deliver
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
    params.require(:user).permit(:full_name, :location, :email, :password, :bio)
  end

end