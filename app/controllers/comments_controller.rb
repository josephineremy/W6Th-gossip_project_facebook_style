class CommentsController < ApplicationController
  include SessionsHelper
  before_action :get_comment_id


  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create('content' => params[:content], 'gossip_id' => params[:gossip_id], user_id: current_user.id)
    @comment.save
      flash[:success] = "Comment successfully added"
      redirect_to gossip_path(params[:gossip_id])
  end

  def edit
    @comment = Comment.find(@id)
  end

  def update
    @comment = Comment.find(@id)
    @comment.update('content' => params[:content], 'gossip_id' => params[:gossip_id])
    redirect_to gossip_path(params[:gossip_id])
  end

  def destroy
    @comment = Comment.find(@id)
    @comment.destroy
    redirect_to gossip_path(params[:gossip_id])
  end

  private

  def get_comment_id
    @id = params[:id].to_i
  end

end
