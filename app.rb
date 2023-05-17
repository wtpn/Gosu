require 'gosu'

class Tutorial < Gosu::Window
  def initialize
    super 450, 340 # windowサイズ
    self.caption = "Tutorial Game" # widowタイトル
    @back_image = Gosu::Image.new("yamabit.jpeg", :tileable => true) # 画像を追加
  end

  def update
  end

  def draw
    @back_image.draw(0,0,0) # 画像を表示
  end
end

Tutorial.new.show
