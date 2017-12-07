public class rect extends PhysicsObject{
  boolean hit = false;
float w;
float h;

public rect(float posX, float posY, float w, float h, float xVelocity, float yVelocity)
{
  pos.x = posX;
  pos.y = posY;
  this.w = w;
  this.h=h;
  velocity.x=xVelocity;
  velocity.y=yVelocity;
}

void draw(){
  pos = pos.add(velocity);
 rect(pos.x,pos.y,w,h); 
}

}