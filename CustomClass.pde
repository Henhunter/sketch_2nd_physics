//Example on custom class that extends Rect. 
public class Player extends Rect {
  
//Constructs a Player object and sends the needed parameters to the superclass.
  public Player(float posX, float posY, float w, float h, float xVelocity, float yVelocity) {
    super(posX, posY, w, h, xVelocity, yVelocity);
    mouseUse = true;
    keepXConstant = true;
  }
  
  void draw() {
  
    rect(pos.x, pos.y, w, h);
    
  }
}