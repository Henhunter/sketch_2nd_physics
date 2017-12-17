//<>// //<>// //<>//

//the core class that takes care of all interactions between PhysicsObjects
public class PhysicsEngine
{
  boolean collision;
  ArrayList<PhysicsObject> objectArray = new ArrayList<PhysicsObject>();
  Border Border;
  int NumberOfCollisions;
  //Checks borderCollisions
  void borderCollision()
  {
    for (int i = 0; i<objectArray.size(); i++)
    {
      PhysicsObject PO = objectArray.get(i);
      if (PO instanceof Circle)
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
    Circle circle = (Circle)PO;
    
    if (circle.pos.x <= circle.radius)
    {
      circle.velocity.x = Math.abs(circle.velocity.x); //math.abs will make any number positive
    } else if (circle.pos.x >= width-(circle.radius))
    {
      circle.velocity.x = -Math.abs(circle.velocity.x);
    }
    if (circle.pos.y <= circle.radius)
    {
      circle.velocity.y = Math.abs(circle.velocity.y);
    } else if (circle.pos.y >= height-(circle.radius)) {
      circle.velocity.y = -Math.abs(circle.velocity.y);
    }
  }

  //Bordercollision for rectangle, also makes sure that the object is going the right way after impact by forcing the right direction. 
  void borderCollisionRect(PhysicsObject PO)
  {
    Rect rect = (Rect)PO;

    if (rect.pos.x <= 0 )
    {
      rect.velocity.x = Math.abs(rect.velocity.x);
    } else if (rect.pos.x >= width-(rect.w)) {
      rect.velocity.x = -Math.abs(rect.velocity.x);
    }
    if ( rect.pos.y <= 0 )
    {
      rect.velocity.y = Math.abs(rect.velocity.y);
    } else if (rect.pos.y >= height-(rect.h)) {
      rect.velocity.y = -Math.abs(rect.velocity.y);
    }
  }
  
  boolean collisionDetection(PhysicsObject first, PhysicsObject second)
  {
    if (first instanceof Circle && second instanceof Circle)
    {
      if (circleToCircleDetection((Circle)first, (Circle)second))
      {
        return true;
      }
    }
    if (first instanceof Rect && second instanceof Rect)
    {
      if (rectToRectDetection((Rect)first, (Rect)second))
      { 
        return true;
      }
    }
    if (first instanceof Circle && second instanceof Rect || first instanceof Rect && second instanceof Circle)
    {
      if (first instanceof Circle && CircleToRectDetection((Circle)first, (Rect)second))
        return true;
      else if (first instanceof Rect && CircleToRectDetection((Circle)second, (Rect)first))
        return true;
    }
    return false;
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
        if (collisionDetection(first, second)) {
          NumberOfCollisions++;
          if ( first instanceof Rect && second instanceof Circle)
            collisionResponse(second, first);
          else
            collisionResponse(first, second);
        }
      }
    }
  }

  //Calculates the outcome of a collision between two objects. Uses mass and velocity to calculate this. 
  void collisionResponse(PhysicsObject hitFirst, PhysicsObject hitSecond)
  {
    if (hitFirst.vanishOnImpact == true) objectArray.remove(hitFirst);
    if (hitSecond.vanishOnImpact == true) objectArray.remove(hitSecond);

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
  boolean rectToRectDetection(Rect first, Rect second) {

    float maxFirstRectX = max(first.pos.x, first.pos.x+first.w);
    float minFirstRectX = min(first.pos.x, first.pos.x+first.w);
    float maxSecondRectX = max(second.pos.x, second.pos.x+second.w);
    float minSecondRectX = min(second.pos.x, second.pos.x+second.w);
    float maxFirstRectY = max(first.pos.y, first.pos.y+first.h);
    float minFirstRectY = min(first.pos.y, first.pos.y+first.h);
    float maxSecondRectY = max(second.pos.y, second.pos.y+second.h);
    float minSecondRectY = min(second.pos.y, second.pos.y+second.h);

    if (maxFirstRectX >= minSecondRectX && minFirstRectX <= maxSecondRectX && maxFirstRectY >= minSecondRectY && minFirstRectY <= maxSecondRectY) 
    {
      if (first.gotHitBy==second || second.gotHitBy == first) 
        return false;
      trueGotHit(first, second);
      return true;
    } else {
      if (first.gotHitBy==second || second.gotHitBy == first)
        falseGotHit(first, second);
    }
    return false;
  }

  //checks if circles collides
  boolean circleToCircleDetection(Circle first, Circle second)
  { 
    float distX, distY;
    distX = first.pos.x-second.pos.x;
    distY = first.pos.y-second.pos.y;
    float distance = sqrt((distX*distX) + (distY*distY));
    if (distance<(first.radius + second.radius))
    {
      if (first.gotHitBy==second || second.gotHitBy == first)  return false;

      trueGotHit(first, second);
      return true;
    } else {
      if (first.gotHitBy==second || second.gotHitBy == first)
        falseGotHit(first, second);
    }
    return false;
  }
  //checks if circles and rectangles collides
  boolean CircleToRectDetection(Circle circle, Rect rect) {

    float distX = Math.abs(circle.pos.x - rect.pos.x-rect.w/2);
    float distY = Math.abs(circle.pos.y - rect.pos.y-rect.h/2);
    //first checks if the circle and rectangle are so far away that a fast return false can be made.
    if (distX > (rect.w/2 + circle.radius)) {
      if (circle.gotHitBy==rect || rect.gotHitBy == circle)
        falseGotHit(circle, rect);
      return false;
    }
    if (distY > (rect.h/2 + circle.radius)) {
      if (circle.gotHitBy==rect || rect.gotHitBy == circle)
        falseGotHit(circle, rect);
      return false;
    }
    //then checks if the circle and rectangle are so close that a fast return true can be made.
    if (distX <= (rect.w/2)) {
      if (circle.gotHitBy==rect || rect.gotHitBy == circle)  return false;
      trueGotHit(circle, rect);
      return true;
    } 
    if (distY <= (rect.h/2)) {
      if (circle.gotHitBy==rect || rect.gotHitBy == circle)  return false;
      trueGotHit(circle, rect);
      return true;
    }
    //then we check the area inbetween, this is mostly for the corners of the rectangle.
    float dx=distX-rect.w/2;
    float dy=distY-rect.h/2;
    boolean col = ((dx*dx+dy*dy)<(circle.radius*circle.radius)); 
    if (col)
    {
      if (circle.gotHitBy==rect || rect.gotHitBy == circle)  return false;
      trueGotHit(circle, rect);
      return true;
    } else
    {
      if (circle.gotHitBy==rect || rect.gotHitBy == circle)
        falseGotHit(circle, rect);
      return false;
    }
  }

  //Because this behaviour happens often, these methods were made.
  void falseGotHit(PhysicsObject first, PhysicsObject second)
  {
    first.gotHitBy =null;
    second.gotHitBy = null;
  }
  void trueGotHit(PhysicsObject first, PhysicsObject second)
  {
    first.gotHitBy = second;
    second.gotHitBy = first;
  }
}