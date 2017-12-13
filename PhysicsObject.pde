public enum Border{
 LEFT,RIGHT,UP,DOWN 
}
//This class is the groundelement for every object with physics capabilities. Has the needed attributes every object needs and contains the booleans for custom behaviour
class PhysicsObject {
  public PVector pos = new PVector();
  PVector velocity = new PVector();
  boolean vanishOnImpact = false;
  boolean bounceOnImpact = true;
  boolean constrainedInFrame = true;
  color c = color(255, 255, 255);
  float mass;
  float oldMouseX;
  float oldMouseY;
  boolean mouseUse = false;
  boolean keepXConstant = false;
  boolean gotHit;
 
   //moves the object after calculations
  void moveObject()
  {
    if (mouseUse)
      mouseUpdate();
    else
      pos = pos.add(velocity);
  }
//makes it so that is possible to update velocity without hacking the code.
  void updateVelocity(PVector velocity) {
    this.velocity = velocity;
  }
//makes it so that is possible to add a velocity without hacking the code.
  void addVelocity(PVector velocity) {
    this.velocity = this.velocity.add(velocity);
  }

//calculates velocity by the difference betweeen the mouse pos and the mouse pos in the last frame.
  void mouseUpdate()
  {
    updateVelocity(new PVector(mouseX-oldMouseX, mouseY-oldMouseY));
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