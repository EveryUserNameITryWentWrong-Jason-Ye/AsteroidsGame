class Asteroid extends Floater{
  
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

   public void setColor(int n) {
    myColor = n;
   }
 	
   public int getColor() {
   	return myColor;
   }
   
   private int rotSpd = ((int)(Math.random()*9)) - 4;
   
   public Asteroid() {
     
     int size = (int)(Math.random()*5);
     corners = 6;
     xCorners = new float[corners];
     yCorners = new float[corners];

     xCorners[0] = 10*size;
     yCorners[0] = 0*size;

     xCorners[1] = 6*size;
     yCorners[1] = 7*size;

     xCorners[2] = 0*size;
     yCorners[2] = 12*size;

     xCorners[3] = -5*size;
     yCorners[3] = 6*size;

     xCorners[4] = -8*size;
     yCorners[4] = 2*size;

     xCorners[5] = -5*size;
     yCorners[5] = -9*size; 
   }

   public void move(){

    turn(rotSpd);
   	super.move();

   }

}