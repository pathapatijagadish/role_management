require "picasa"
class PhotosController < ApplicationController
	before_filter :establish_connection
  def index
  	begin
		  albums = @client.album.list.entries
		  album = albums.first#find { |album| album.title == "New Album" }

		  @photos = @client.album.show(album.id).entries		  
		rescue Exception => e
		  flash[:error] = "Some thing goes wrong from Picasa. Please try later."
	  	redirect_to root_url
		end		
  end  

  def create
  	begin
  	file_data = params[:image]		
	  photo_bin = file_data.read
	  albums = @client.album.list.entries
	  album = albums.first#find { |album| album.title == "New Album" }

	  @client.photo.create(album.id,
	    {
	      :binary => photo_bin,
	      :content_type => "image/jpeg",
	      :title => params[:title].present? ? params[:title] : "Test Photo",
	      :summary => params[:summary].present? ? params[:summary] : "Test Summary"
	    }
	  )
	  redirect_to photos_url
	rescue Picasa::ForbiddenError
	  flash[:error] = "Some thing goes wrong from Picasa. Please try later."
	  redirect_to root_url
	end
  end

  private

  def establish_connection
  	@client = Picasa::Client.new(:user_id => "hellofriends789@gmail.com", :password => "hellofriends789")
  end
end
