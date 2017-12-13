//this class represents circle physicsobjects, can be used on its own but also with an extension to give custom classes a rigidbody.
public class myCircle extends PhysicsObject {
  float radius;
  boolean gotHitX;
  boolean gotHitY;

  boolean player;

  //needed parameters for a circle velocity are here given a standard velocity of 1.
  public myCircle(float posX, float posY, float radius)
  {
    pos.x = posX;
    pos.y = posY;
    this.radius = radius/2;
    velocity.x = 1;
    velocity.y = 1;
  }

  //needed parameters for a circle.
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

 //draws the circle, draws it on the mouse pos if chosen.
  public void draw()
  {
    fill(c);
    ellipse(pos.x, pos.y, radius*2, radius*2);
    fill(255);
  }
}