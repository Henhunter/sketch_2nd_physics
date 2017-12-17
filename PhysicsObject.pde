
//This class is the groundelement for every object with physics capabilities. Has the needed attributes every object needs and contains the booleans for custom behaviour
class PhysicsObject {
  public PVector pos = new PVector();
  PVector velocity = new PVector();
  boolean vanishOnImpact = false;
  boolean bounceOnImpact = true;
  boolean constrainedInFrame = true;
  float mass;
  float oldMouseX;
  float oldMouseY;
  boolean mouseUse = false;
  boolean keepXConstant = false;
  boolean keepYConstant = false;
  boolean gotHit = true;
  PhysicsObject gotHitBy;
  String type; 

  //moves the object after calculations
  void moveObject()
  {
    if (mouseUse)
      mouseUpdate();
    else
      pos = pos.add(velocity);
  }
  //makes it so that is possible to update velocity without hacking the code.
  void setVelocity(PVector velocity) {
    this.velocity = velocity;
  }
  PVector getVelocity() {
    return velocity;
  }
  void setVelocity(float velX, float velY) {
    velocity.x = velX;
    velocity.y = velY;
  }
  PVector getPos() {
    return pos;
  }
  void setPos(float posX, float posY)
  {
    pos.x = posX;
    pos.y = posY;
  }
  void setPos(PVector pos) {
    this.pos = pos;
  }


  //makes it so that is possible to add a velocity without hacking the code.
  void addVelocity(PVector velocity) {
    this.velocity = this.velocity.add(velocity);
  }
  void addVelocity(float velX, float velY) {
    velocity.x += velX;
    velocity.y += velY;
  }

  //calculates velocity by the difference betweeen the mouse pos and the mouse pos in the last frame.
  void mouseUpdate()
  {
    setVelocity(new PVector(mouseX-oldMouseX, mouseY-oldMouseY));
    oldMouseX=mouseX;
    oldMouseY=mouseY;
    if (!keepXConstant)
      pos.x = mouseX;
    pos.y = mouseY;
  }

  void draw()
  {
  }
}