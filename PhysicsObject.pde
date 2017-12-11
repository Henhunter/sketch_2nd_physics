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
  void moveObject()
  {
    if(mouseUse)
    {
      updateVelocity(new PVector(mouseX-oldMouseX, mouseY-oldMouseY));
      oldMouseX=mouseX;
      oldMouseY=mouseY;
      pos.x = mouseX; pos.y = mouseY;
    }
    pos = pos.add(velocity);
  }
  
  void updateVelocity(PVector velocity){
    this.velocity = velocity;
  }
  void mouseUpdate()
  {
      
  }
  
  void draw()
  {
  }
}