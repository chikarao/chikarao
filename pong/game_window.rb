# Game of Pong with Two Players
# One Ball

require 'gosu'
require_relative 'player'
require_relative 'ball'

class GameWindow < Gosu::Window

  # Instance Method
  def initialize
    super(640, 480)
    self.caption = "Pong Game"

    @player1 = Player.new(self, 'left')
    @player2 = Player.new(self, 'right')
    @ball = Ball.new(self, @player1, @player2)
  end

  def update
    @player1.update
    @player2.update
    @ball.update
  end

  def draw
    @player1.draw
    @player2.draw
    @ball.draw
  end
end

# "game" is an instance of the GameWindow Class.
# "@game" would be an instance variable.
game = GameWindow.new

game.show
