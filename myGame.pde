public class myGame extends PhysicsEngine
{

  public myGame()
  {
    for (int i = 0; i<100; i++)
    {
      float size = random(20, 50);

      objectArray.add(new Circle(random(size+1, width-1)-size/2, random(size+1, height-1)-size/2, size, random(-5, 5), random(-5, 5)));
      size = random(20, 50);
      Rect rect = new Rect(random(0+1, width-size-1), random(0+1, height-size-1), size, size, random(-5, 5), random(-5, 5));
      objectArray.add(rect);
      //objectArray.add(new Rect(random(0+1, width-size-1), random(0+1, height-size-1), size, size, random(-5, 5), random(-5, 5)));
      
    }
    //objectArray.add(new Player(random(0+1, width-20-1), random(0+1, height-20-1), 20, 20, random(-5, 5), random(-5, 5)));
    //objectArray.add(new myCircle(mouseX, mouseY, 50,0,0));
  }

  void draw()
  {    
    background(255); 
    for (int i=0; i<objectArray.size(); i++) 
    {
      PhysicsObject tempObject = objectArray.get(i);
      tempObject.moveObject();
      tempObject.draw();
    } 
    collisionDetection();
    borderCollision();
  }
}
void printtest()
{
  println("--------------new rotation -----------------");
  for (int i=0; i<game2.objectArray.size(); i++) 
  {
    PhysicsObject tempObject = game2.objectArray.get(i);
    if (tempObject.pos.x > 810 || tempObject.pos.x < -10 || tempObject.pos.y > 610 || tempObject.pos.y < -10) 
      println(tempObject.pos + " " + tempObject.type );
  }
  println("NumberOfCollisions: " + game2.NumberOfCollisions);
}


boolean gameStart = false;
public class Pong {

  float x = 150;
  float y = 150;
  float diam = 20; 
  int rectSize = 150;
  PhysicsEngine PE = new PhysicsEngine();
  Player p;  
  Circle c;

  void setup() {
    size(500, 500);
    noStroke();
    smooth();
  }

  public Pong() {
    p = new Player(width-30, mouseY, 10, rectSize, 0, 0);
    c = new Circle(x, y, diam, 5, 5);
    PE.add(p);
    PE.add(c);
  }

  void draw() { 
    background(255);

    p.moveObject();
    if (gameStart)
      c.moveObject();
    PE.collisionDetection();
    PE.borderCollision();
    p.draw();
    c.draw();
  }
}

void mousePressed() {
  gameStart = !gameStart;
  if (!gameStart)
    printtest();
}