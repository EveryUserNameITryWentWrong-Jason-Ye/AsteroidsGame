Spaceship N49;
Asteroid[] N48;
boolean wPressed = false;
boolean sPressed = false;
boolean aPressed = false;
boolean dPressed = false;
boolean fPressed = false;
public void setup() 
{
 size(700, 700);

 N49 = new Spaceship();
 N49.setColor(255);
 N49.setX(350);
 N49.setY(640);
 N49.setPointDirection(270);
 
 N48 = new Asteroid[11];
 for(int i = 0; i < N48.length; i++){
  N48[i] = new Asteroid();
  N48[i].setColor(150);
  N48[i].setPointDirection((int)(Math.random()*360));
  N48[i].setDirectionX((Math.random()*5) - 2);
  N48[i].setDirectionY((Math.random()*5) - 2);
  N48[i].setX((int)(Math.random()*700));
  N48[i].setY((int)(Math.random()*700));
 }

}


public void draw(){

 background(33, 32, 32);

 for(int nI = 0; nI < N48.length; nI++){
   N48[nI].show();
   N48[nI].move();
 }
 
 N49.show();
 N49.move();
 
  if(mousePressed) {
  	
    frameRate(5);
  	hyperSpace();

  }
  else{
  	frameRate(120);
  }



 if(keyPressed) {
 	if(wPressed){
 		N49.accelerate(0.15);
 	}
 	if(sPressed){
 		N49.accelerate(-0.15);
 	}
 	if(aPressed){
 		N49.turn(-2);
 		//N49.setDirectionX(-3);
 	}
 	if(dPressed){
 		N49.turn(2);
 		//N49.setDirectionX(3);
 	}
 }
     
}

void hyperSpace() {

	N49.setX((int)(Math.random()*699) + 1);
	N49.setY((int)(Math.random()*699) + 1);

}

void keyPressed() {
	
	if(key == 'w'){
		wPressed = true;
	}
	if(key == 's'){
		sPressed = true;
	}
	if(key == 'a'){
		aPressed = true;
	}
	if(key == 'd'){
		dPressed = true;
	}

}

void keyReleased() {
	
	if(key == 'w'){
		wPressed = false;
	}
	if(key == 's'){
		sPressed = false;
	}
	if(key == 'a'){
		aPressed = false;
	}
	if(key == 'd'){
		dPressed = false;
	}

}
