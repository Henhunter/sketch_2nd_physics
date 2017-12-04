public class myGame extends PhysicsEngine
{

  public myGame()
  {
    for (int i = 0; i<10; i++)
    {
      float size = random(5, 50);
      circleArray.add(new myCircle(random(size+1, width-1)-size/2, random(size+1, height-1)-size/2, size, random(-1, 1), random(-1, 1)));
    }
    /*
    myCircle circle = new myCircle(width/2, height/2, 200, 0, 0);
    circle.bounceOnImpact = false;
    circleArray.add(circle);
    */
  }

  void draw()
  {
    background(255);
    for (int i=0; i<circleArray.size(); i++) {
      myCircle tempCircle = circleArray.get(i);
      tempCircle.drawIt();
    }
    borderCollision();
    collisionDetection();
  }
  
  
}