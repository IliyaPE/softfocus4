class ImagesController < ApplicationController
  before_filter :fetch_image, :only => [:show, :download]

  def show
  end

  def download
    send_file @image.file.path(:soft_1k), :type=>"image/jpeg"
  end

  def new
  end
  
  def create
    @image = Image.new :file => params[:file], :owner_attributes => {:ip => request.remote_ip}
    if @image.save
#      session[:image_id] = @image.id
      respond_to do |format|
        format.json do
          render :json => @image.to_json
        end
        format.html do
          redirect_to result_path(@image)
        end
      end
    else
      render :text => 'fail'
    end
  end
  
protected
  def fetch_image
    if params[:id].present? and @image = Image.find(params[:id])
      if @image.owner.ip != request.remote_ip
        # forbidden
      end
    else
      # not found
    end
  end
end
