class UserController < ApplicationController

  def show
    @user=User.find(params[:id])
  end


  def new
    @user = User.new
  end


  def create
    @user = User.create('first_name' => params[:first_name], 'last_name' => params[:last_name], 'description' => params[:description], 'age' => params[:age], 'city_id' => params[:city_id], 'email' => params[:email], 'password' => params[:password])
  	if @user.save
      session[:user_id] = @user.id
  		redirect_to welcome_index_path, notice: "Inscription réussie ! Vous êtes connecté en tant que #{@user.first_name}"
  	else
      flash[:danger] = "Echec de l'inscription ! Vous n'avez pas rempli tous les champs."
  		render "new"
  	end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :age, :city_id, :email, :password)
    user_params.includes(password: "")
  end
end
