class ImagesController < ApplicationController
  def show
    @image = last_image
  end

  def new
  end
  
  def create
    @image = Image.new :file => params[:file], :owner_attributes => {:ip => request.remote_ip}
    if @image.save
      session[:image_id] = @image.id
      redirect_to result_path
    else
      render :text => 'fail'
    end
  end
  
protected
  def last_image
    Image.find(session[:image_id]) if session[:image_id] rescue nil
  end
end
