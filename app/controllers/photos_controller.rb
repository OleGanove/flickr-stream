class PhotosController < ApplicationController
  require 'flickraw'

  before_action :set_flickr, only: [:index]

  def index
  	if params[:search]
  	  @user = flickr.people.getInfo(:user_id => params[:search])
  	  @user_photos = flickr.photos.search(:user_id => params[:search])
   	  @user_photos_urls = []

   	  @user_photos.each do |photo|
  	    @user_photos_urls << FlickRaw.url(photo)
  	  end
    end
  end


  private

	def set_flickr
	  FlickRaw.api_key = ENV['API_KEY']
	  FlickRaw.shared_secret = ENV['SHARED_SECRET']

	  flickr.access_token = ENV['ACCESS_TOKEN']
	  flickr.access_secret = ENV['ACCESS_SECRET']
	end
end
