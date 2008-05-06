class FitterHappierController < ActionController::Base
  session :off
  layout nil

  def index
    render :text => 'Hai!' and return
  end
  
  private
  
  def process_with_silence(*args)
    logger.silence do
      process_without_silence(*args)
    end
  end
 
  alias_method_chain :process, :silence
end