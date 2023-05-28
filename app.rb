require 'gosu'

class Tutorial < Gosu::Window
  def initialize
    super 600, 330 # windowサイズ
    self.caption = "Tutorial Game" # widowタイトル
    @back_image = Gosu::Image.new("space.jpg", :tileable => true) # 画像を追加

    @player = Player.new
    @player.warp(300, 165)
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
      @player.accelarate
    end
    @player.move
  end

  def draw
    @player.draw
    @back_image.draw(0,0,0) # 画像を表示
  end

  def button_down?(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

class Player
  def initialize
    @image = Gosu::Image.new("starfighter.bmp")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left # 左に傾く
    @angle -= 4.5
  end

  def turn_right # 右に傾く
    @angle += 4.5
  end

  def accelarate # 上に進む
    @vel_x += Gosu.offset_x(@angle, 0.5)
    @vel_y += Gosu.offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 600
    @y %= 330

    # 摩擦係数みたいな
    @vel_x *= 0.9
    @vel_y *= 0.9
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end

Tutorial.new.show
