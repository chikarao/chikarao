class Player

  attr_reader :x, :y

  def initialize(window, side)
    @image = Gosu::Image.new('media/Starfighter.bmp')

    # For this method, we need to pass in a GameWindow instance

    @window = window

    # Because we're playing a game of Pong, we need a Side

    @side = side

    if side == 'left'
      @x = 50
    else
      @x = window.width - @image.width - 50
    end

    @y = (window.height - @image.height) / 2
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def update
    # if Gosu.button_down?(Gosu::KB_UP)
    if Gosu.button_down?(up_button)
      # Set First Behavior Here - Top Barrier

      @y -= 5 if @y >= 0
    elsif Gosu.button_down?(down_button)
      # Set Second Behavior Here - Bottom Barrier

      @y += 5 if @y <= (@window.height - @image.height)
    end
  end

  private

  def up_button
    # If the player side is 'left',
    @side == 'left' ? Gosu::KB_W : Gosu::KB_UP
  end

  def down_button
    @side == 'left' ? Gosu::KB_S : Gosu::KB_DOWN
  end
end
