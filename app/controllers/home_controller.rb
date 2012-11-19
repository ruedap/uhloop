class HomeController < ApplicationController
  protect_from_forgery :except => :auth # stop rails CSRF protection for this action

  def index
    @ssut = "#{Time.now.to_i}000"  # 前身Node.jsアプリのUNIXタイムが13桁だったので
    @cint = ENV['CLICK_INTERVAL_SEC'] || 1
  end

  def create
    Pusher["channel"].trigger("message-event", params[:text])
    render :text => "success"
  end
end
