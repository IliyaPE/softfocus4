module Paperclip
  class Softblur < Thumbnail
    def initialize(file, options = {}, attachment = nil)
      @softblur = options[:softblur]
      super
    end
  
    def transformation_command
      [] + super + [softblur]
    end
    
    def softblur
      "\\( -clone 0 -morphology Convolve 'Blur:0x5>' \\) -compose blend -define compose:args=40,60% -brightness-contrast 0x12% -composite" if @softblur
    end
  end
end
