class ImagesController < ApplicationController
  def new
  end
  
  def create
    image = Image.new :file => params[:file], :owner_attributes => {:ip => request.remote_ip}
    if image.save
      redirect_to root_path
    else
      render :text => 'fail'
    end
  end
end
