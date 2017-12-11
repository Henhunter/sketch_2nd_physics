public class Player extends Rect {

  public Player(float posX, float posY, float w, float h, float xVelocity, float yVelocity) {
    super(posX, posY, w, h, xVelocity, yVelocity);
    mouseUse = true;
    keepXConstant = true;
  }
  void draw() {
    fill(c);
    rect(pos.x, pos.y, w, h);
    fill(255);
  }
}