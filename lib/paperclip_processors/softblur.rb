module Paperclip
  class Softblur < Thumbnail
    def initialize(file, options = {}, attachment = nil)
      @softblur = options[:softblur]
      super
    end
  
    def transformation_command
      [] + super + [softblur, quality_flag]
    end
    
    def quality_flag
      '-quality 95'
    end
    
    def softblur
      img_size = @target_geometry.larger
      blur_size = img_size / 150
      "\\( -clone 0 -morphology Convolve 'Blur:0x#{blur_size}>' \\) -compose blend -define compose:args=40,60% -brightness-contrast 0x12% -composite" if @softblur
    end
  end
end
