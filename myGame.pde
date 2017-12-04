public class myGame
{


  ArrayList<myCircle> circleArray = new ArrayList<myCircle>();

  public myGame()
  {
    for (int i = 0; i<10; i++)
    {
      float size = random(50);

      circleArray.add(new myCircle(random(size+1, width-1)-size/2, random(size+1, height-1)-size/2, size, random(-1, 1), random(-1, 1)));
//       if(i%2 == 0){
      circleArray.get(i).vanishOnImpact = false; 
  //    }
    }
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
  boolean collision = false;
  void collisionDetection()
  {

    for (int i=0; i<circleArray.size(); i++)
    {
      for (int j=i+1; j<circleArray.size(); j++)
      {
        myCircle first = circleArray.get(i);
        myCircle second = circleArray.get(j);

        if (dist(first.pos.x, first.pos.y, second.pos.x, second.pos.y)<(first.radius + second.radius)/2)
        {
          //       first.velocity = new PVector(0, 0);
          //       second.velocity = new PVector(0, 0);
          collision(first, second);

          if (collision == false) {
            println("col detected");
            collision = true;
          }
        }
      }
    }
  }

  void collision(myCircle hitFirst, myCircle hitSecond)
  {
    if (hitFirst.vanishOnImpact == true) circleArray.remove(hitFirst);
    if (hitSecond.vanishOnImpact == true) circleArray.remove(hitSecond);
    if (hitFirst.bounceOnImpact == true)
    {
      hitFirst.velocity.x = hitFirst.velocity.x * (hitFirst.radius - hitSecond.radius)+(2* hitSecond.radius * hitSecond.velocity.x)/(hitSecond.radius+hitFirst.radius);
    }
    if (hitSecond.bounceOnImpact == true)
    {
      hitSecond.velocity = hitSecond.velocity.add(hitFirst.velocity);
    }
  }
  void borderCollision()
  {
    for (int i = 0; i<circleArray.size(); i++)
    {
      myCircle circle = circleArray.get(i); 
      if (circle.pos.x < circle.radius/2 || circle.pos.x > width-(circle.radius/2))
      {
        if (circle.gotHitX != true)
        {
          circle.velocity.x = -circle.velocity.x;
          circle.gotHitX = true;
        }
      } else circle.gotHitX=false;
      if (circle.pos.y < circle.radius/2 || circle.pos.y > height-(circle.radius/2))
      {
        if (circle.gotHitY != true) 
        {
          circle.velocity.y = -circle.velocity.y;
          circle.gotHitY = true;
        }
      } else circle.gotHitY = false;
    }
  }
}