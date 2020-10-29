class LikeysController < ApplicationController
  include SessionsHelper

  def new
    likey = Likey.new
  end

  def create
    gossip=Gossip.find(params[:gossip_id])
    likey=Likey.create(user_id: current_user.id, gossip_id: params[:gossip_id])
    likey.save
    redirect_back fallback_location: @gossip
  end
end
