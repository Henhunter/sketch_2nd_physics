public class myGame extends PhysicsEngine
{
  public myGame()
  {
    for (int i = 0; i<20; i++)
    {
      float size = random(20, 50);
      objectArray.add(new myCircle(random(size+1, width-1)-size/2, random(size+1, height-1)-size/2, size, random(-5, 5), random(-5, 5)));
    }
    objectArray.add(new myCircle(mouseX, mouseY, 50,0,0));
  }

  void draw()
  {    
    background(255); 
    for (int i=0; i<objectArray.size(); i++) 
    {
      
      PhysicsObject tempCircle = objectArray.get(i);
      tempCircle.moveObject();
      tempCircle.draw();
    }



    collisionDetection();
    borderCollision();
  }
}