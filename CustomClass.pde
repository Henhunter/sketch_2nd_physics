public class Player extends Rect{
  
  public Player(float posX, float posY, float w, float h, float xVelocity, float yVelocity){
   super(posX, posY, w, h, xVelocity, yVelocity);
    mouseUse = true;
  }
  void draw(){
    fill(c);
    ellipse(pos.x, pos.y, w, h);
    rect(pos.x, pos.y, w, h);
    fill(255);
    
  }
  
}