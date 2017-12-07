public class myCircle extends PhysicsObject{
  float radius;
  boolean gotHitX;
  boolean gotHitY;
  boolean gotHit;
  boolean player;
  public myCircle(float posX, float posY, float radius, float xVelocity, float yVelocity)
  {
    if(posX == mouseX) player=true;
    pos.x = posX;
    pos.y= posY;
    this.radius = radius;
    velocity.x = xVelocity;
    velocity.y = yVelocity;
  }

  public myCircle(int posX, int posY, int radius)
  {
    pos.x = posX;
    pos.y = posY;
    this.radius = radius;
    velocity.x = 1;
    velocity.y = 1;
  }

  public void draw()
  {
    
    fill(c);
    //if(player) { pos.x = mouseX; pos.y = mouseY;  }
    ellipse(pos.x, pos.y, radius, radius);
    fill(255);
  }

  public void collision()
  {
  }
}