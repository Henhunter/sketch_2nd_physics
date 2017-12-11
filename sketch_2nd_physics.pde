Pong game;

void setup()
{
  size(800, 600);
  game = new Pong();
}

void draw()
{
  game.draw();
}