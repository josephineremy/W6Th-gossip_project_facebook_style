class WelcomeController < ApplicationController

  def index
  	@first_name = params[:id]
  end

end
