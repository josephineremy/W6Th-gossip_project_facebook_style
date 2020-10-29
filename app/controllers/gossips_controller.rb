class GossipsController < ApplicationController
  include SessionsHelper
  before_action :authenticate_user, only: [:new]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params["id"])
    @gossip = Gossip.includes(:comments).find(params[:id])
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new
    @comment = Comment.new(gossip_id: params[:gossip_id])
  end


  def create
    @gossip = Gossip.create('title' => params[:title], 'content' => params[:content], user_id: 11)
    @gossip.user = current_user
    if @gossip.save
      redirect_to root_path, notice: 'Le gossip est bien ajouté !'
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params["id"])
  end

  def update
    @gossip = Gossip.find(params["id"])
    gossip_params=params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to @gossip
  end

  def destroy
    @gossip = Gossip.find(params["id"])
    @gossip.destroy
    redirect_to root_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Veuillez vous connecter pour créer un potin."
      redirect_to new_session_path
    end
  end
end
