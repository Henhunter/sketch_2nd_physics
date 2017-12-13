

//the core class that takes care of all interactions between PhysicsObjects
public class PhysicsEngine
{
  boolean collision;
  ArrayList<PhysicsObject> objectArray = new ArrayList<PhysicsObject>();
  Border Border;
  //Checks borderCollisions
  void borderCollision()
  {
    for (int i = 0; i<objectArray.size(); i++)
    {
      PhysicsObject PO = objectArray.get(i);
      if (PO instanceof myCircle)
        borderCollisionCircle(PO);
      if (PO instanceof Rect)
        borderCollisionRect(PO);
    }
  }
  //These two methods adds and removes PhysicsObjects that needs to be checked.
  void add(PhysicsObject PO) {
    objectArray.add(PO);
  }
  void remove(PhysicsObject PO) {
    objectArray.remove(PO);
  }


  //Bordercollision for circle, also makes sure that the object is going the right way after impact by forcing the right direction.  
  void borderCollisionCircle(PhysicsObject PO)
  {
    myCircle circle = (myCircle)PO;

    if (circle.pos.x <= circle.radius/2)
    {
      if (circle.gotHitX != true)
      {
        circle.velocity.x = Math.abs(circle.velocity.x); //math.abs will make any number positive
        circle.gotHitX = true;
      }
    } else if (circle.pos.x >= width-(circle.radius/2))
    {
      if (circle.gotHitX != true)
      {
        circle.velocity.x = -Math.abs(circle.velocity.x);
        circle.gotHitX = true;
      }
    } else circle.gotHitX=false;
    if (circle.pos.y <= circle.radius/2)
    {
      if (circle.gotHitY != true) 
      {
        circle.velocity.y = Math.abs(circle.velocity.y);
        circle.gotHitY = true;
      }
    } else if (circle.pos.y >= height-(circle.radius/2)) {
      if (circle.gotHitY != true) 
      {
        circle.velocity.y = -Math.abs(circle.velocity.y);
        circle.gotHitY = true;
      }
    } else circle.gotHitY = false;
  }

  //Bordercollision for rectangle, also makes sure that the object is going the right way after impact by forcing the right direction. 
  void borderCollisionRect(PhysicsObject PO)
  {
    Rect rect = (Rect)PO;

    if (rect.pos.x <= 0 )
    {
      if (rect.gotHitX != true)
      {
        rect.velocity.x = Math.abs(rect.velocity.x);
        rect.gotHitX = true;
      }
    } else if (rect.pos.x >= width-(rect.w)) {
      if (rect.gotHitX != true)
      {
        rect.velocity.x = -Math.abs(rect.velocity.x);
        rect.gotHitX = true;
      }
    } else rect.gotHitX=false;
    if ( rect.pos.y <= 0 )
    {
      if (rect.gotHitY != true) 
      {
        rect.velocity.y = Math.abs(rect.velocity.y);
        rect.gotHitY = true;
      }
    } else if (rect.pos.y >= height-(rect.h)) {
      if (rect.gotHitY != true) 
      {
        rect.velocity.y = -Math.abs(rect.velocity.y);
        rect.gotHitY = true;
      }
    } else rect.gotHitY = false;
  }

  //Start point for collision detection, checks what kind of an instance the objects are and calls the appropiate method to check for collisions(boolean) and then activates the response if the value is true.
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
          {
            collisionResponse(first, second);
          }
        }
        if (first instanceof Rect && second instanceof Rect)
        {
          if (rectToRectDetection((Rect)first, (Rect)second))
          { 
            collisionResponse(first, second);
            first.c = color(random(255), random(255), random(255));
            second.c = color(random(255), random(255), random(255));
          }
        }
        if (first instanceof myCircle && second instanceof Rect || first instanceof Rect && second instanceof myCircle)
        {
          if (first instanceof myCircle && CircleToRectDetection((myCircle)first, (Rect)second))
            collisionResponse(first, second);
          else if (first instanceof Rect && CircleToRectDetection((myCircle)second, (Rect)first))
            collisionResponse(second, first);
        }
      }
    }
  }
  //Calculates the outcome of a collision between two objects. Uses mass and velocity to calculate this. 
  void collisionResponse(PhysicsObject hitFirst, PhysicsObject hitSecond)
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
    if (!hitSecond.keepXConstant) 
      hitFirst.velocity.x = newV1X;
    else
      hitFirst.velocity.x = - hitFirst.velocity.x;

    if (!hitFirst.keepXConstant)
      hitSecond.velocity.x =  newV2X;
    else
      hitSecond.velocity.x = -hitSecond.velocity.x;
    if (!hitFirst.keepXConstant || hitFirst.velocity.y < 0.2)
      hitSecond.velocity.y =  newV2Y;

    if (!hitSecond.keepXConstant|| hitSecond.velocity.y < 0.2)
      hitFirst.velocity.y = newV1Y;
  }



  //checks if rectangles collides
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
      if (_first.gotHit || _second.gotHit) return false;
      trueGotHit(_first, _second);
      return true;
    } 
    falseGotHit(_first, _second);
    return false;
  }

  //checks if circles collides
  boolean circleToCircleDetection(myCircle first, myCircle second)
  { 
    float distX, distY;
    distX = first.pos.x-second.pos.x;
    distY = first.pos.y-second.pos.y;
    float distance = sqrt((distX*distX) + (distY*distY));
    if (distance<(first.radius + second.radius))
    {
      if (first.gotHit || second.gotHit) return false;
      first.c = color(random(255), random(255), random(255));
      second.c = color(random(255), random(255), random(255));
      println("col");
      trueGotHit(first, second);
      return true;
    } else {
      falseGotHit(first, second);
    }
    return false;
  }
  //checks if circles and rectangles collides
  boolean CircleToRectDetection(myCircle circle, Rect rect) {

    float distX = Math.abs(circle.pos.x - rect.pos.x-rect.w/2);
    float distY = Math.abs(circle.pos.y - rect.pos.y-rect.h/2);
    //first checks if the circle and rectangle are so far away that a fast return false can be made.
    if (distX > (rect.w/2 + circle.radius)) {
      falseGotHit(circle, rect);
      return false;
    }
    if (distY > (rect.h/2 + circle.radius)) {
      falseGotHit(circle, rect);
      return false;
    }
    //then checks if the circle and rectangle are so close that a fast return true can be made.
    if (distX <= (rect.w/2)) {
      trueGotHit(circle, rect);
      return true;
    } 
    if (distY <= (rect.h/2)) {
      trueGotHit(circle, rect);
      return true;
    }
    //then we check the area inbetween, this is mostly for the corners of the rectangle.
    float dx=distX-rect.w/2;
    float dy=distY-rect.h/2;
    boolean col = ((dx*dx+dy*dy)<(circle.radius*circle.radius)); 
    if (col)
    {
      trueGotHit(circle, rect);
      return true;
    } else
    {
      falseGotHit(circle, rect);
      return false;
    }
  }

  //Because this behaviour happens often, these methods were made.
  void falseGotHit(PhysicsObject first, PhysicsObject second)
  {
    first.gotHit =false;
    second.gotHit = false;
  }
  void trueGotHit(PhysicsObject first, PhysicsObject second)
  {
    first.gotHit =true;
    second.gotHit = true;
  }
}