public class myGame extends PhysicsEngine
{
  public myGame()
  {
    for (int i = 0; i<5; i++)
    {
      float size = random(20, 50);
      objectArray.add(new Player(random(0+1, width-size-1), random(0+1, height-size-1), size, size, random(-5, 5), random(-5, 5)));
      objectArray.add(new myCircle(random(size+1, width-1)-size/2, random(size+1, height-1)-size/2, size, random(-5, 5), random(-5, 5)));
     // objectArray.add(new Rect(random(0+1, width-size-1), random(0+1, height-size-1), size, size, random(-5, 5), random(-5, 5)));
    }
    //objectArray.add(new myCircle(mouseX, mouseY, 50,0,0));
  }

  void draw()
  {    
    background(255); 
    for (int i=0; i<objectArray.size(); i++) 
    {
/*
      PhysicsObject tempCircle = objectArray.get(i);
      tempCircle.moveObject();
      tempCircle.draw(); 
*/
      PhysicsObject tempRect = objectArray.get(i);
       tempRect.moveObject();
       tempRect.draw(); 
    } 



    collisionDetection();
    borderCollision();
  }
}