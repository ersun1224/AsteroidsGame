SpaceShip bob;
Star joe[];
ArrayList <Asteroid> rocks;
ArrayList <Bullet> bullets;
int bulletColor;
public void setup() 
{
  size(800, 800);

  bob = new SpaceShip();

  rocks = new ArrayList <Asteroid>();
  for (int i = 0; i < 100; i++) {
    rocks.add(new Asteroid());
  }

  bullets = new ArrayList <Bullet>();

  joe = new Star[700];
  for (int i = 0; i < joe.length; i++) {
    joe[i] = new Star();
  }
}



public void draw() 
{
  fill(0, 0, 0, 150);
  rect(-10, -10, 820, 820);

  for (int i = 0; i < joe.length; i++) {
    joe[i].show();
    joe[i].move();
  }

  for (int i = 0; i < rocks.size(); i++) {
    rocks.get(i).move();
    rocks.get(i).show();
  }

  if ((mousePressed == true && mouseButton == LEFT) && frameCount%6 == 0) {
    bulletColor = color(0, 255, 0);
    bullets.add(new Bullet(bob));
  }

  if ((mousePressed == true && mouseButton == RIGHT) && frameCount%6 == 0) {
    bulletColor = color(239, 69, 69);
    bullets.add(new Bullet(bob));
  }

  if ((mousePressed == true && mouseButton == CENTER) && frameCount%6 == 0) {
    bulletColor = color(130, 169, 220);
    bullets.add(new Bullet(bob));
  }

  for (int i = 0; i < bullets.size(); i++) {
    bullets.get(i).move();
    bullets.get(i).show();
  }


  for (int i = 0; i < rocks.size(); i++) {
    for (int j = 0; j < bullets.size(); j++) {
      if (dist(rocks.get(i).getX(), rocks.get(i).getY(), bullets.get(j).getX(), bullets.get(j).getY()) < 13) {
        rocks.remove(i);
        bullets.remove(j);
        break;
      }
    }
  }

  for(int i = 0; i < rocks.size(); i++) {
    if (rocks.get(i).getX() < -100){
      rocks.remove(this);
    }
    if (rocks.get(i).getX() < 900){
      rocks.remove(this);
    }
    if (rocks.get(i).getY() < -100){
      rocks.remove(this);
    }
    if (rocks.get(i).getY() < 900){
      rocks.remove(this);
    }
  }

  bob.move();
  bob.show();
}

public void keyPressed() {
  if (key == 32) {
    bob.accelerate(0.1);
  }

  if (key == 'a') {
    bob.rotate(-10);
  }

  if (key == 'd') {
    bob.rotate(10);
  }

  if (key == 'r') {
    int x1 = bob.getX();
    int y1 = bob.getY();
    bob.setX((int)(Math.random()*800));
    bob.setY((int)(Math.random()*800));
    int x2 = bob.getX();
    int y2 = bob.getY();
    bob.setPointDirection((int)(Math.random() * 360));
    fill(255);
    line(x1, y1, x2, y2);

    bob.setDirectionX(0);
    bob.setDirectionY(0);
  }

  if (key == 'p') {
    for (int i = 0; i < 100; i++) {
      rocks.add(new Asteroid());
    }
  }
}


class SpaceShip extends Floater  
{   
  SpaceShip() {
    corners = 7;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -12;
    yCorners[0] = -10;
    xCorners[1] = 0;
    yCorners[1] = -8;
    xCorners[2] = 10;
    yCorners[2] = -2;
    xCorners[3] = 24;
    yCorners[3] = 0;
    xCorners[4] = 22;
    yCorners[4] = 5;
    xCorners[5] = -12;
    yCorners[5] = 10;
    xCorners[6] = -4;
    yCorners[6] = 0;


    myColor = color(255);

    myCenterX = 400;
    myCenterY = 400;

    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }

  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }

  public void move() {
    super.move();
  }
}

class Asteroid extends Floater {
  private int rotationSpeed, moveSpeedX;
  public Asteroid() {
    rotationSpeed = (int)(Math.random()*9-4);
    while (rotationSpeed == 0) {
      rotationSpeed = (int)(Math.random()*9-4);
    }

    moveSpeedX = (int)((Math.random()*5)-2);
    while (moveSpeedX == 0) {
      moveSpeedX = (int)((Math.random()*5)-2);
    }



    corners = 7;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = 10;
    xCorners[1] = -14;
    yCorners[1] = -2;
    xCorners[2] = -8;
    yCorners[2] = -10;
    xCorners[3] = -2;
    yCorners[3] = -14;
    xCorners[4] = 6;
    yCorners[4] = -12;
    xCorners[5] = 10;
    yCorners[5] = -4;
    xCorners[6] = 8;
    yCorners[6] = 6;

    myColor = color(146, 72, 72); 

    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);

    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }

  public void move() {
    myPointDirection += rotationSpeed;

    if (frameCount % 2 == 0) {
      myCenterX += moveSpeedX; 
      myCenterY += 1;
    }


    double dRadians =myPointDirection*(Math.PI/180);  
    myDirectionX = (5 * Math.cos(dRadians));    
    myDirectionY = (5 * Math.sin(dRadians));


    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }
}

class Bullet extends Floater {
  public Bullet(SpaceShip bob) {
    myCenterX = bob.myCenterX;
    myCenterY = bob.myCenterY;
    myPointDirection = bob.myPointDirection;
    double dRadians =myPointDirection*(Math.PI/180);
    myDirectionX = 10 * Math.cos(dRadians) + bob.myDirectionX;
    myDirectionY = 10 * Math.sin(dRadians) + bob.myDirectionY;
  }

  public void show() {
    stroke(bulletColor);
    strokeWeight(2);
    point((float)myCenterX, (float)myCenterY);
    strokeWeight(1);
  }

  public void move() {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
  }

  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
} 

class Star {
  private int myX, myY, myColor;

  public Star() {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
    myColor = color(255);
  }

  public void show() {
    stroke(myColor);
    point(myX, myY);
  }

  public void move() {
    if (frameCount % 10 == 0) {
      myX = myX - 2;
      myY = myY + 1;
      if (myX < 0) {
        myX = 800;
      }

      if (myY > 800) {
        myY = 0;
      }
    }
  }
}
