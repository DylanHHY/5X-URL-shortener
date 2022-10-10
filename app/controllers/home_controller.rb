class HomeController < ApplicationController
  def index
    @link = Link.new
    @original_url = Link.all
  end
end
  