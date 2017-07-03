class Ball
  def initialize(window, player1, player2)
    @window = window
    @player1 = player1
    @player2 = player2

    @image = Gosu::Image.new('media/Star.png')

    @x = (window.width - @image.width) / 2
    @y = (window.height - @image.height) / 2

    @angle = 45
  end

  def update
    @x += Gosu::offset_x(@angle, 3)
    @y += Gosu::offset_y(@angle, 3)

    if @y >= (@window.height - @image.height)
      @angle -= 90
    end
    if @y <= 0
      @angle += 90
    end

    if (@x + @image.width) >= @player2.x
      @angle -= 270
    end

    if @x <= @player1.x + @image.width
      @angle += 90
    end
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end
