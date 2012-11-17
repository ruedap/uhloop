class HomeController < ApplicationController
  def index
    @ssut = "#{Time.now.to_i}000"  # 前身Node.jsアプリのUNIXタイムが13桁だったので
    @cint = ENV['CLICK_INTERVAL_SEC'] || 1
  end
end
