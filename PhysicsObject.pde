class PhysicsObject {
  public PVector pos = new PVector();
  PVector velocity = new PVector();
  boolean vanishOnImpact = false;
  boolean bounceOnImpact = true;
  boolean constrainedInFrame = true;
  color c = color(255, 255, 255);
  float mass;


  void moveObject()
  {
    pos = pos.add(velocity);
  }
  void draw()
  {
  }
}