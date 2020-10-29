class LikesController < ApplicationController
  include SessionsHelper

  def new
    like = Like.new
  end

  def create
    gossip=Gossip.find(params[:gossip_id])
    comment=Comment.find(params[:comment_id])
    like=Like.create(user_id: current_user.id, comment_id: params[:comment_id], gossip_id: params[:gossip_id])
    like.save
    redirect_to gossip_path(params[:gossip_id])
  end
end
