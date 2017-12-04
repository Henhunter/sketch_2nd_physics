public class PhysicsEngine
{

  ArrayList<myCircle> circleArray = new ArrayList<myCircle>();

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
    println(hitFirst.velocity + " " + hitSecond.velocity);
    float newV1X=0, newV1Y=0;
    float newV2X=0, newV2Y=0;
    if (hitFirst.bounceOnImpact == true)
    {
      newV1X = (hitFirst.velocity.x * (hitFirst.radius - hitSecond.radius)+(2* hitSecond.radius * hitSecond.velocity.x))/(hitSecond.radius+hitFirst.radius);
      newV1Y = (hitFirst.velocity.y * (hitFirst.radius - hitSecond.radius)+(2* hitSecond.radius * hitSecond.velocity.y))/(hitSecond.radius+hitFirst.radius);
    }
    println(hitFirst.velocity + " " + hitSecond.velocity);
    if (hitSecond.bounceOnImpact == true)
    {
      newV2X = (hitSecond.velocity.x * (hitSecond.radius - hitFirst.radius)+(2.0f* hitFirst.radius * hitFirst.velocity.x))/(hitFirst.radius+hitSecond.radius);
      newV2Y = (hitSecond.velocity.y * (hitSecond.radius - hitFirst.radius)+(2.0f* hitFirst.radius * hitFirst.velocity.y))/(hitFirst.radius+hitSecond.radius);
      //hitSecond.velocity = hitSecond.velocity.add(hitFirst.velocity);
    }
    hitSecond.velocity.x =  newV2X;
    hitSecond.velocity.y =  newV2Y;
    hitFirst.velocity.x = newV1X;
    hitFirst.velocity.y = newV1Y;

    println(hitFirst.velocity + " " + hitSecond.velocity);
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
          if (!first.gotHit || !second.gotHit) {
            first.c = color(random(255), random(255), random(255));
            second.c = color(random(255), random(255), random(255));
            collision(first, second);
            println("col");
            first.gotHit =true;
            second.gotHit =true;
          }
        } else {
          first.gotHit = false;
          second.gotHit = false;
        }
      }
    }
  }
}