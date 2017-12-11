public class PhysicsEngine
{
  boolean collision;
  ArrayList<PhysicsObject> objectArray = new ArrayList<PhysicsObject>();


  void borderCollision()
  {
    borderCollisionCircle();
    borderCollisionRect();
  }


  void borderCollisionCircle()
  {
    for (int i = 0; i<objectArray.size(); i++)
    {
      PhysicsObject PO = objectArray.get(i);
      myCircle circle = null;
      if (PO instanceof myCircle) { 
        circle = (myCircle)PO;

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

  void borderCollisionRect()
  {
    for (int i = 0; i<objectArray.size(); i++)
    {
      PhysicsObject PO = objectArray.get(i);
      Rect rect = null;
      if (PO instanceof Rect) { 
        rect = (Rect)PO;

        if (rect.pos.x < 0 || rect.pos.x > width-(rect.w))
        {
          if (rect.gotHitX != true)
          {
            rect.velocity.x = -rect.velocity.x;
            rect.gotHitX = true;
          }
        } else rect.gotHitX=false;
        if ( rect.pos.y < 0 || rect.pos.y > height-(rect.h))
        {
          if (rect.gotHitY != true) 
          {
            rect.velocity.y = -rect.velocity.y;
            rect.gotHitY = true;
          }
        } else rect.gotHitY = false;
      }
    }
  }


  // OLD COL
  /* void collision(Rect hitFirst, Rect hitSecond)
   {
   if (hitFirst.vanishOnImpact == true) objectArray.remove(hitFirst);
   if (hitSecond.vanishOnImpact == true) objectArray.remove(hitSecond);
   println(hitFirst.velocity + " " + hitSecond.velocity);
   hitFirst.velocity = hitFirst.velocity.mult(-1);
   hitSecond.velocity = hitSecond.velocity.mult(-1);
   }*/


  void collision(Rect hitFirst, Rect hitSecond)
  {
    if (hitFirst.vanishOnImpact == true) objectArray.remove(hitFirst);
    if (hitSecond.vanishOnImpact == true) objectArray.remove(hitSecond);
    println(hitFirst.velocity + " " + hitSecond.velocity);

    float newV1X=0, newV1Y=0;
    float newV2X=0, newV2Y=0;
    if (hitFirst.bounceOnImpact == true)
    {
      newV1X = (hitFirst.velocity.x * (hitFirst.mass - hitSecond.mass)+(2* hitSecond.mass * hitSecond.velocity.x))/(hitSecond.mass+hitFirst.mass);
      newV1Y = (hitFirst.velocity.y * (hitFirst.mass - hitSecond.mass)+(2* hitSecond.mass * hitSecond.velocity.y))/(hitSecond.mass+hitFirst.mass);
    }
    if (hitSecond.bounceOnImpact == true)
    {
      newV2X = (hitSecond.velocity.x * (hitSecond.mass - hitFirst.mass)+(2.0f* hitFirst.mass * hitFirst.velocity.x))/(hitFirst.mass+hitSecond.mass);
      newV2Y = (hitSecond.velocity.y * (hitSecond.mass - hitFirst.mass)+(2.0f* hitFirst.mass * hitFirst.velocity.y))/(hitFirst.mass+hitSecond.mass);
      //hitSecond.velocity = hitSecond.velocity.add(hitFirst.velocity);
    }
    hitSecond.velocity.x =  newV2X;
    hitSecond.velocity.y =  newV2Y;
    hitFirst.velocity.x = newV1X;
    hitFirst.velocity.y = newV1Y;

    println(hitFirst.velocity + " " + hitSecond.velocity);
  }

  void collision(PhysicsObject hitFirst, PhysicsObject hitSecond)
  {
    if (hitFirst.vanishOnImpact == true) objectArray.remove(hitFirst);
    if (hitSecond.vanishOnImpact == true) objectArray.remove(hitSecond);
    println(hitFirst.velocity + " " + hitSecond.velocity);
    float newV1X=0, newV1Y=0;
    float newV2X=0, newV2Y=0;
    if (hitFirst.bounceOnImpact == true)
    {
      newV1X = (hitFirst.velocity.x * (hitFirst.mass - hitSecond.mass)+(2* hitSecond.mass * hitSecond.velocity.x))/(hitSecond.mass+hitFirst.mass);
      newV1Y = (hitFirst.velocity.y * (hitFirst.mass - hitSecond.mass)+(2* hitSecond.mass * hitSecond.velocity.y))/(hitSecond.mass+hitFirst.mass);
    }
    println(hitFirst.velocity + " " + hitSecond.velocity);
    if (hitSecond.bounceOnImpact == true)
    {
      newV2X = (hitSecond.velocity.x * (hitSecond.mass - hitFirst.mass)+(2.0f* hitFirst.mass * hitFirst.velocity.x))/(hitFirst.mass+hitSecond.mass);
      newV2Y = (hitSecond.velocity.y * (hitSecond.mass - hitFirst.mass)+(2.0f* hitFirst.mass * hitFirst.velocity.y))/(hitFirst.mass+hitSecond.mass);
      //hitSecond.velocity = hitSecond.velocity.add(hitFirst.velocity);
    }
    hitFirst.velocity.x = newV1X;
    hitFirst.velocity.y = newV1Y;
    hitSecond.velocity.x =  newV2X;
    hitSecond.velocity.y =  newV2Y;


    println(hitFirst.velocity + " " + hitSecond.velocity);
  }

  void collision(myCircle hitFirst, myCircle hitSecond)
  {
    if (hitFirst.vanishOnImpact == true) objectArray.remove(hitFirst);
    if (hitSecond.vanishOnImpact == true) objectArray.remove(hitSecond);
    println(hitFirst.velocity + " " + hitSecond.velocity);
    float newV1X=0, newV1Y=0;
    float newV2X=0, newV2Y=0;
    if (hitFirst.bounceOnImpact == true)
    {
      newV1X = (hitFirst.velocity.x * (hitFirst.mass - hitSecond.mass)+(2* hitSecond.mass * hitSecond.velocity.x))/(hitSecond.mass+hitFirst.mass);
      newV1Y = (hitFirst.velocity.y * (hitFirst.mass - hitSecond.mass)+(2* hitSecond.mass * hitSecond.velocity.y))/(hitSecond.mass+hitFirst.mass);
    }
    println(hitFirst.velocity + " " + hitSecond.velocity);
    if (hitSecond.bounceOnImpact == true)
    {
      newV2X = (hitSecond.velocity.x * (hitSecond.mass - hitFirst.mass)+(2.0f* hitFirst.mass * hitFirst.velocity.x))/(hitFirst.mass+hitSecond.mass);
      newV2Y = (hitSecond.velocity.y * (hitSecond.mass - hitFirst.mass)+(2.0f* hitFirst.mass * hitFirst.velocity.y))/(hitFirst.mass+hitSecond.mass);
      //hitSecond.velocity = hitSecond.velocity.add(hitFirst.velocity);
    }
    hitFirst.velocity.x = newV1X;
    hitFirst.velocity.y = newV1Y;
    hitSecond.velocity.x =  newV2X;
    hitSecond.velocity.y =  newV2Y;


    println(hitFirst.velocity + " " + hitSecond.velocity);
  }

  
void collisionDetection()
{
  PhysicsObject first;
  PhysicsObject second;

  for (int i=0; i<objectArray.size(); i++)
  {
    for (int j=i+1; j<objectArray.size(); j++)
    {
      first = objectArray.get(i);
      second = objectArray.get(j);
      if (first instanceof myCircle && second instanceof myCircle)
      {
        if (circleToCircleDetection((myCircle)first, (myCircle)second))
          collision((myCircle)first, (myCircle)second);
      }
      if (first instanceof Rect && second instanceof Rect)
      {
        if (rectToRectDetection((Rect)first, (Rect)second))
        { 
          collision((Rect)first, (Rect)second);
          first.c = color(random(255), random(255), random(255));
          second.c = color(random(255), random(255), random(255));
        }
      }
      if (first instanceof myCircle && second instanceof Rect || first instanceof Rect && second instanceof myCircle)
      {
        if (first instanceof myCircle && CircleToRectDetection((myCircle)first, (Rect)second))
          collision(first, second);
        else if(first instanceof Rect && CircleToRectDetection((myCircle)second, (Rect)first))
          collision((myCircle)second, (Rect)first);
        }
        /* if (instanceof physicsobject == circle && instanceof physicsobject2 == rect || instanceof physicsobject == rect && instanceof physicsobject2 == circle) 
         circleToRectDetection();     */
      }
    }
  }

  boolean rectToRectDetection(Rect _first, Rect _second) {
    float maxFirstRectX = max(_first.pos.x, _first.pos.x+_first.w);
    float minFirstRectX = min(_first.pos.x, _first.pos.x+_first.w);
    float maxSecondRectX = max(_second.pos.x, _second.pos.x+_second.w);
    float minSecondRectX = min(_second.pos.x, _second.pos.x+_second.w);
    float maxFirstRectY = max(_first.pos.y, _first.pos.y+_first.h);
    float minFirstRectY = min(_first.pos.y, _first.pos.y+_first.h);
    float maxSecondRectY = max(_second.pos.y, _second.pos.y+_second.h);
    float minSecondRectY = min(_second.pos.y, _second.pos.y+_second.h);

    if (maxFirstRectX >= minSecondRectX && minFirstRectX <= maxSecondRectX && maxFirstRectY >= minSecondRectY && minFirstRectY <= maxSecondRectY) 
    {
      return true;
    } 

    return false;
  }

boolean circleRect(float _circleX, float _circleY, float _radius, float _rectX, float _rectY, float _rectWidth, float _rectHeight) {

  float testX = _circleX;
  float testY = _circleY;

  if (_circleX < _rectX)         testX = _rectX;      
  else if (_circleX > _rectX+_rectWidth) testX = _rectX+_rectWidth;   
  if (_circleY < _rectY)         testY = _rectY;     
  else if (_circleY > _rectY+_rectHeight) testY = _rectY+_rectHeight;  

  float distX = _circleX-testX;
  float distY = _circleY-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );


  if (distance <= _radius) {
    return true;
  }
  return false;
}


boolean circleToCircleDetection(myCircle first, myCircle second)
{

  float distX, distY;
  distX = first.pos.x-second.pos.x;
  distY = first.pos.y-second.pos.y;
  float distance = sqrt((distX*distX) + (distY*distY));
  if (distance<(first.radius + second.radius)/2)
  {
    if (!first.gotHit || !second.gotHit) {
      first.c = color(random(255), random(255), random(255));
      second.c = color(random(255), random(255), random(255));
      println("col");
      first.gotHit =true;
      second.gotHit =true;
      return true;
    }
  } else {
    first.gotHit = false;
    second.gotHit = false;
  }
  return false;
}
boolean CircleToRectDetection(myCircle circle, Rect rect) {

    float distX = Math.abs(circle.pos.x - rect.pos.x-rect.w/2);
    float distY = Math.abs(circle.pos.y - rect.pos.y-rect.h/2);

    if (distX > (rect.w/2 + circle.radius)) { 
      return false;
    }
    if (distY > (rect.h/2 + circle.radius)) { 
      return false;
    }

    if (distX <= (rect.w/2)) { 
      return true;
    } 
    if (distY <= (rect.h/2)) { 
      return true;
    }

    float dx=distX-rect.w/2;
    float dy=distY-rect.h/2;
    return (dx*dx+dy*dy<=(circle.radius*circle.radius));
  }
}