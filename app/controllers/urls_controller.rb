class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    url = Url.where( random_id: params[:id] ).first
    if url
    	redirect_to url.original
    else
    	render "index"
    end
  end

  def new
    # https://bit.ly/3M2JvzP
    @url = Url.new

    letters = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    @url.random_id = (0...8).map{ letters[rand(letters.length)]}.join
  end

  def create
    @url = Url.new(urls_params)
    # render html: params

    if @url.save
      redirect_to urls_path
    else
      render "new"
    end
	end

  private

  def urls_params
    params.require(:url).permit(:original, :random_id)
  end
end
