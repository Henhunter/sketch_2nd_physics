//this class represents circle physicsobjects, can be used on its own but also with an extension to give custom classes a rigidbody.
public class Circle extends PhysicsObject {
  float radius;
  boolean gotHitX;
  boolean gotHitY; 
  boolean player;

  //needed parameters for a circle velocity are here given a standard velocity of 1.
  public Circle(float posX, float posY, float radius)
  {
    pos.x = posX;
    pos.y = posY;
    this.radius = radius/2;
    calculateMass();
    velocity.x = 1;
    velocity.y = 1;
  }

  //needed parameters for a circle.
  public Circle(float posX, float posY, float diameter, float xVelocity, float yVelocity)
  {
    if (posX == mouseX) player=true;
    pos.x = posX;
    pos.y= posY;
    this.radius = diameter/2;
    velocity.x = xVelocity;
    velocity.y = yVelocity;
    calculateMass();
    type = "Circle";
  }
  void setDiameter(float diameter){
   radius = diameter/2; 
  }
  
  void calculateMass() {
    mass=PI*(this.radius*this.radius);
  }
  
  //draws the circle, draws it on the mouse pos if chosen.
  public void draw()
  {

    ellipse(pos.x, pos.y, radius*2, radius*2);
  }
}