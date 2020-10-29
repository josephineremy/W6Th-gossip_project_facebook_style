class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Utilisateur connecté !"
      redirect_to welcome_index_path
    else
      flash[:danger] = "Mmmmh c'est pas les bons identifiants, t'es sur d'avoir déjà créé un compte?"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Vous êtes bien déconnecté."
  end

end
