public class Rect extends PhysicsObject {
  boolean hit = false;
  float w;
  float h;
  boolean gotHitX;
  boolean gotHitY;
  boolean gotHit;

  public Rect() {
  }

  public Rect(float posX, float posY, float w, float h, float xVelocity, float yVelocity)
  {
    pos.x = posX;
    pos.y = posY;
    this.w = w;
    this.h = h;
    velocity.x=xVelocity;
    velocity.y=yVelocity;
    mass=w*h;
  }

  void draw() {

    fill(c);
    if(mouseUse) { pos.x = mouseX; pos.y = mouseY;  }
    rect(pos.x, pos.y, w, h);
    fill(255);
  }
}