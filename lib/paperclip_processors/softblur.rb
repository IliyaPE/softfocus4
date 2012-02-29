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
      "-define convolve:scale=40%,60% -morphology Convolve 'Gaussian:0x9>'" if @softblur
    end
  end
end
