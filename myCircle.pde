public class myCircle extends PhysicsObject {
  float radius;
  boolean gotHitX;
  boolean gotHitY;

  boolean player;
  public myCircle(float posX, float posY, float radius, float xVelocity, float yVelocity)
  {
    if (posX == mouseX) player=true;
    pos.x = posX;
    pos.y= posY;
    this.radius = radius/2;
    velocity.x = xVelocity;
    velocity.y = yVelocity;
    mass=PI*(this.radius*this.radius);
  }

  public myCircle(float posX, float posY, float radius)
  {
    pos.x = posX;
    pos.y = posY;
    this.radius = radius/2;
    velocity.x = 1;
    velocity.y = 1;
  }

  public void draw()
  {

    fill(c);

    ellipse(pos.x, pos.y, radius, radius);
    fill(255);
  }

  public void collision()
  {
  }
}