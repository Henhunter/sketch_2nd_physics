public class PhysicsEngine
{
  
  ArrayList<myCircle> circleArray = new ArrayList<myCircle>();

  

  // 
  //  
  
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
  
  void collision(myCircle hitFirst, myCircle hitSecond)
  {
    if (hitFirst.vanishOnImpact == true) circleArray.remove(hitFirst);
    if (hitSecond.vanishOnImpact == true) circleArray.remove(hitSecond);

    if (hitFirst.bounceOnImpact == true)
    {
      hitFirst.velocity.x = (hitFirst.velocity.x * (hitFirst.radius - hitSecond.radius)+(2* hitSecond.radius * hitSecond.velocity.x))/(hitSecond.radius+hitFirst.radius);
      hitFirst.velocity.y = (hitFirst.velocity.y * (hitFirst.radius - hitSecond.radius)+(2* hitSecond.radius * hitSecond.velocity.y))/(hitSecond.radius+hitFirst.radius);
    }
    if (hitSecond.bounceOnImpact == true)
    {
      hitSecond.velocity.x = (hitSecond.velocity.x * (hitSecond.radius - hitFirst.radius)+(2* hitFirst.radius * hitFirst.velocity.x))/(hitFirst.radius+hitSecond.radius);
      hitSecond.velocity.y = (hitSecond.velocity.y * (hitSecond.radius - hitFirst.radius)+(2* hitFirst.radius * hitFirst.velocity.y))/(hitFirst.radius+hitSecond.radius);
      //hitSecond.velocity = hitSecond.velocity.add(hitFirst.velocity);
    }
  }
  
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
          if (first.gotHit || second.gotHit) {
            collision(first, second);
            println("col");
              first.gotHit =false;
              second.gotHit =false;
          } 
        }
        else {
            first.gotHit = true;
            second.gotHit = true;
          }
      }
    }
  }

  
}