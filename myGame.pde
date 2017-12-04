public class myGame extends PhysicsEngine
{
  public myGame()
  {
    for (int i = 0; i<20; i++)
    {
      float size = random(20, 50);
      circleArray.add(new myCircle(random(size+1, width-1)-size/2, random(size+1, height-1)-size/2, size, random(-5, 5), random(-5, 5)));
    }
  }

  void draw()
  {    
    background(255); 
    for (int i=0; i<circleArray.size(); i++) 
    {
      myCircle tempCircle = circleArray.get(i);
      tempCircle.drawIt();
    }



    collisionDetection();
    borderCollision();
  }
}