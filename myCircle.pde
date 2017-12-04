public class myCircle{
public PVector pos = new PVector();
float radius;
PVector velocity = new PVector();
boolean vanishOnImpact = true;
boolean bounceOnImpact = true;
boolean constrainedInFrame = true;
boolean gotHitX;
boolean gotHitY;

public myCircle(float posX, float posY, float radius, float xVelocity, float yVelocity)
{
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

color c = color(255,255,255);
public void drawIt()
{
 pos = pos.add(velocity);
 if(gotHitX || gotHitY) c = color(random(255),random(255),random(255));
 fill(c);
 ellipse(pos.x, pos.y, radius, radius);
 fill(255);
}

public void collision()
{
  
}
}