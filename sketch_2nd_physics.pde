Pong game;
myGame game2;
void setup()
{
  size(800, 600);
  //game = new Pong();
  game2 = new myGame();
}

void draw()
{
  game2.draw();
}