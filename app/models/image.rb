class Image
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :blur, :type => Integer, :default => 6            # Blur kernel width
  field :alpha, :type => Float, :default => 40            # Blurred layer alpha
  field :downloaded_at, :type => DateTime
  embeds_one :owner

  accepts_nested_attributes_for :owner
  
  has_mongoid_attached_file :file,
    :url => "/system/:class/:id_partition/:basename-:style.:extension",
    :styles => {
      :half => {:geometry => '400x400>', :format => :jpg},
      :halfsoft => {:geometry => '400x400>', :format => :jpg, :softblur => true},
      :softfocus => {:geometry => '1024x1024>', :format => :jpg, :softblur => true},
    },
    :processors => [:softblur]
  
  def as_json opts = {}
    {
      :id => _id,
      :blur => blur,
      :alpha => alpha
    }
  end
end
