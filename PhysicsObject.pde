public enum Border{
 LEFT,RIGHT,UP,DOWN 
}

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
 
  void moveObject()
  {
    if (mouseUse)
      mouseUpdate();
    else
      pos = pos.add(velocity);
  }

  void updateVelocity(PVector velocity) {
    this.velocity = velocity;
  }

  void addVelocity(PVector velocity) {
    this.velocity = this.velocity.add(velocity);
  }

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