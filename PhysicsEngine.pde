public class PhysicsEngine
{
  boolean collision;
  ArrayList<PhysicsObject> objectArray = new ArrayList<PhysicsObject>();

  void borderCollision()
  {
    for (int i = 0; i<objectArray.size(); i++)
    {
      PhysicsObject PO = objectArray.get(i);
      myCircle circle = null;
      if (PO instanceof myCircle) { 
        circle = (myCircle)PO;
      }  
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
    if (hitFirst.vanishOnImpact == true) objectArray.remove(hitFirst);
    if (hitSecond.vanishOnImpact == true) objectArray.remove(hitSecond);
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
       if (instanceof PhysicsObject == myCircle && instanceof physicsobject2 == circle) 
    circleToCircleDetection();
    /*    if (instanceof physicsobject == rect && instanceof physicsobject2 == rect) 
     rectToRectDetection();
     if (instanceof physicsobject == circle && instanceof physicsobject2 == rect || instanceof physicsobject == rect && instanceof physicsobject2 == circle) 
     circleToRectDetection();     */
  }

  void rectToRectDetection(float firstRectX, float firstRectWidth, float secondRectX, float secondRectWidth, float firstRectY, float firstRectHeight, float secondRectY, float secondRectHeight) {
    float maxFirstRectX = max(firstRectX, firstRectX+firstRectWidth);
    float minFirstRectX = min(firstRectX, firstRectX+firstRectWidth);
    float maxSecondRectX = max(secondRectX, secondRectX+secondRectWidth);
    float minSecondRectX = min(secondRectX, secondRectX+secondRectWidth);
    float maxFirstRectY = max(firstRectY, firstRectY+firstRectHeight);
    float minFirstRectY = min(firstRectY, firstRectY+firstRectHeight);
    float maxSecondRectY = max(secondRectY, secondRectY+secondRectHeight);
    float minSecondRectY = min(secondRectY, secondRectY+secondRectHeight);

    if (maxFirstRectX >= minSecondRectX && minFirstRectX <= maxSecondRectX && maxFirstRectY >= minSecondRectY && minFirstRectY <= maxSecondRectY) 
    {
      collision = true;
    } else 
    {
      collision = false;
    }
    println(collision);
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


  void circleToCircleDetection()
  {

    for (int i=0; i<objectArray.size(); i++)
    {
      for (int j=i+1; j<objectArray.size(); j++)
      {
        
        myCircle first = (myCircle)objectArray.get(i);
        myCircle second = (myCircle)objectArray.get(j);
        float distX, distY;
        distX = first.pos.x-second.pos.x;
        distY = first.pos.y-second.pos.y;
        float distance = sqrt((distX*distX) + (distY*distY));
        if (distance<(first.radius + second.radius)/2)
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