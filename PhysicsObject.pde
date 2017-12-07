class PhysicsObject {
public PVector pos = new PVector();
PVector velocity = new PVector();
boolean vanishOnImpact = false;
  boolean bounceOnImpact = true;
  boolean constrainedInFrame = true;
  
  
  void moveObject()
  {
       pos = pos.add(velocity);    
  }
  void draw()
  {
  }
  
  
  
  
}