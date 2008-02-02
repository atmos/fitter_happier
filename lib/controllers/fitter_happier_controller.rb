class FitterHappierController < ActionController::Base
  session :off
  layout nil

  def index
    logger.silence do
      render :text => 'Hai!' and return
    end
  end
end