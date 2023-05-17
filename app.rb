require 'gosu'

class Tutorial < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Tutorial Game"
    @bg = Gosu::Image.new("yamabit.jpeg", :tileable => true)
  end

  def update
  end

  def draw
    @bg.draw(100,100,100)
  end
end

Tutorial.new.show
