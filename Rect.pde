//this class represents rectangled physicsobjects, can be used on its own but also with an extension to give custom classes a rigidbody.
public class Rect extends PhysicsObject {
  boolean hit = false;
  float w;
  float h;
  boolean gotHitX;
  boolean gotHitY;
  

  public Rect() {
  }
//needed parameters for a rectangle.
  public Rect(float posX, float posY, float w, float h, float xVelocity, float yVelocity)
  {
    pos.x = posX;
    pos.y = posY;
    this.w = w;
    this.h = h;
    velocity.x=xVelocity;
    velocity.y=yVelocity;
    calculateMass();
    type = "Rectangle";
  }
 void setWidth(float w){
  this.w = w;
  calculateMass();
 }
 void setHeight(float h){
  this.h = h;
  calculateMass();
 }
 
 void calculateMass(){
  mass=w*h; 
 }
  //draws the rectangle, draws it on the mouse pos if chosen.
  void draw() {

    if (mouseUse) { 
      pos.x = mouseX; 
      pos.y = mouseY;
    }
    rect(pos.x, pos.y, w, h);

  }
}