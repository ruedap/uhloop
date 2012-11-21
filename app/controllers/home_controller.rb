class HomeController < ApplicationController

  def index
    @ssut = "#{Time.now.to_i}000"  # 前身Node.jsアプリのUNIXタイムが13桁だったので
    @cint = ENV['CLICK_INTERVAL_SEC'] || 1
  end

  def create
    if params[:message]
      Pusher["channel"].trigger("message-event", params[:message])
      render :text => "success"
    elsif params[:counter]
      Pusher["channel"].trigger("counter-event", params[:counter])
      render :text => "success"
    end
  end

end
