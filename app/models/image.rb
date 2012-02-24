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
    :styles => {
      :half => ['400x267#', :jpg],
      :full => ['950x600', :jpg]
    }
end
