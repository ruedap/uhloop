class HomeController < ApplicationController
  def index
    @ssut = Time.now.to_i
    @cint = ENV['CLICK_INTERVAL_SEC'] || 1
  end
end
