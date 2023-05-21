require 'gosu'

class Tutorial < Gosu::Window
  def initialize
    super 450, 340 # windowサイズ
    self.caption = "Tutorial Game" # widowタイトル
    @back_image = Gosu::Image.new("yamabit.jpeg", :tileable => true) # 画像を追加

    @player = Player.new
  end

  def update
  end

  def draw
    @player.draw
    @back_image.draw(0,0,0) # 画像を表示
  end
end

class Player
  def initialize
    @image = Gosu::Image.new("starfighter.bmp")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end

Tutorial.new.show
