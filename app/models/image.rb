class Image
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :blur, :type => Integer           # Blur kernel width
  field :alpha, :type => Float            # Blurred layer alpha
  field :dowloaded_at, :type => DateTime
  embeds_one :owner
  
  accepts_nested_attributes_for :owner
  
  has_mongoid_attached_file :file,
#    :url => "/system/:hash.:extension",
#    :hash_secret => "7496b767cc9a9380f086205ad3c2c0b78f355e6bdf393551e06397c7f244be4c945826b03801de27414ae5f1fb3b173cf95f24c418361d94ecdebf7b4d126a17",
    :styles => {
      :half => {:geometry => '400x400>', :format => :jpg},
      :soft => {:geometry => '400x400>', :format => :jpg, :softblur => true},
      :soft_1k => {:geometry => '1024x1024>', :format => :jpg, :softblur => true},
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
