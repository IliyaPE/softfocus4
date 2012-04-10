class Admin::ImagesController < ApplicationController
  before_filter :fetch_image, :only => [:show, :update, :destroy]
  before_filter :authenticate
  layout 'admin'

  def show
  end

  def index
    @images = Image.order_by(:created_at => :desc).all
  end
  
protected
  def fetch_image
    if params[:id].present?
      not_found if not @image = Image.find(params[:id])
    end
  rescue
    not_found
  end
end
