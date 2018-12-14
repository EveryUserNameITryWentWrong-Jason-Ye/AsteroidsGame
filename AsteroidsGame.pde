Spaceship N49;
Star [] N47;
ArrayList <Asteroid> N48;
ArrayList <Bullet> N46;
ArrayList <sideBullet> N45;
ArrayList <sideBullet2> N44;
ArrayList <Missiles> N43;
ArrayList <RotShield> N42;

color asteroids;
color asteroidsHit;

boolean wPressed = false;
boolean sPressed = false;
boolean aPressed = false;
boolean dPressed = false;
boolean hPressed = false;
boolean spPressed = false;
boolean gPressed = false;
boolean rPressed = false;

float shieldCount = 0;

int rotSpin = 0; 
int highScore = 0;
int asteroidsKill = 0;
float health = 90.0;

public void setup() 
{
 
 size(1370, 700);
 
 asteroids = color(170, 161, 161);
 asteroidsHit = color(198, 190, 190);

 N49 = new Spaceship();
 N49.setColor(255);
 N49.setX(685);
 N49.setY(350);
 N49.setPointDirection(270);
 
 N46 = new ArrayList<Bullet>();
 N45 = new ArrayList<sideBullet>();
 N44 = new ArrayList<sideBullet2>();
 N43 = new ArrayList<Missiles>();
 N42 = new ArrayList<RotShield>();

 N47 = new Star[1000];
 for(int i = 0; i < N47.length; i++){
 	N47[i] = new Star();
 }
 
 N48 = new ArrayList<Asteroid>();
 for(int i = 0; i < 20; i++){
   N48.add(new Asteroid());
   N48.get(i).setX((int)(Math.random()*1370));
   N48.get(i).setY((int)(Math.random()*700));
   N48.get(i).setDirectionX((Math.random()*2.4) - 1.2);
   N48.get(i).setDirectionY((Math.random()*2.4) - 1.2);
   N48.get(i).setHealth(500);

 }
 
 
}


public void draw(){
 if(key == 'f' || hPressed){
 	fill(0,10);
 	rect(0, 0, width, height);
 }
 else{
 	background(33, 32, 32);
 }
 
 for(int nI = 0; nI < N47.length; nI++){
 	N47[nI].show();
 	N47[nI].move();
 }


//shipCollision
 for(int nI = 0; nI < N48.size(); nI++){
   N48.get(nI).setColor(asteroids);
   N48.get(nI).show();
   N48.get(nI).move();
   float ds = dist(N49.getX(), N49.getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(ds < 65 && key != 'f' && !hPressed && frameCount > 2*120){
   	health = health - 0.9;
   }
   if(health < 0){
   	N49.setX(10000);
   	N49.setY(10000);
   }
}

//Main Cannon
for(int nI = 0; nI < N48.size(); nI++)
  for(int a = 0; a < N46.size(); a++){
   float d2 = dist(N46.get(a).getX(), N46.get(a).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d2 < 70){
    N48.get(nI).setColor(asteroidsHit);
    N48.get(nI).damage(60);
   	N46.remove(a);
   	break;
   }
   else{
   	N48.get(nI).setColor(asteroids);
   }
   if(N48.get(nI).getHealth() < 0){
   	N48.remove(nI);
   	shieldCount = shieldCount + 1;
   	asteroidsKill = asteroidsKill + 50;
   	break;
   }
  }

//SideBullet
for(int nI = 0; nI < N48.size(); nI++)
   for(int o = 0; o < N45.size(); o++){
   float d = dist(N45.get(o).getX(), N45.get(o).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d < 70){
   	N48.get(nI).setColor(asteroidsHit);
   	N48.get(nI).damage(10);
   	N45.remove(o);
   	break;
   }
   else{
   	N48.get(nI).setColor(asteroids);
   }
   if(N48.get(nI).getHealth() < 0){
   	N48.remove(nI);
   	shieldCount = shieldCount + 1;
   	asteroidsKill = asteroidsKill + 50;
   	break;
   }
  }

//SideBullet 2
 for(int nI = 0; nI < N48.size(); nI++)
  for(int a = 0; a < N44.size(); a++){
   float d1 = dist(N44.get(a).getX(), N44.get(a).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d1 < 70){
   	N48.get(nI).setColor(asteroidsHit);
   	N48.get(nI).damage(10);
   	N44.remove(a);
   	break;
   }
   else{
   	N48.get(nI).setColor(asteroids);
   }
   if(N48.get(nI).getHealth() < 0){
   	N48.remove(nI);
   	shieldCount = shieldCount + 1;
   	asteroidsKill = asteroidsKill + 50;
   	break;
   }
  }

  for(int nI = 0; nI < N48.size(); nI++)
  for(int a = 0; a < N43.size(); a++){
   float d3 = dist(N43.get(a).getX(), N43.get(a).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d3 < 70){
   	N48.get(nI).setColor(asteroidsHit);
   	N48.get(nI).damage(300);
   	N43.remove(a);
   	break;
   }
   if(N48.get(nI).getHealth() < 0){
   	N48.remove(nI);
   	asteroidsKill = asteroidsKill + 50;
   	break;
   }
  }
   
 
  for(int a = 0; a < N46.size(); a++){
  	N46.get(a).show();
  	N46.get(a).move();
  	N46.get(a).accelerate(0.9);
  	 if(N46.get(a).getX() == width || N46.get(a).getY() == height || N46.get(a).getX() == 0 || N46.get(a).getY() == 0){
  	 	N46.remove(a);
  	 }
  }

  for(int b = 0; b < N45.size(); b++){
  	N45.get(b).show();
  	N45.get(b).move();
  	 if(N45.get(b).getX() == width || N45.get(b).getY() == height || N45.get(b).getX() == 0 || N45.get(b).getY() == 0){
  	 	N45.remove(b);
  	 }
  }

  for(int b = 0; b < N44.size(); b++){
  	N44.get(b).show();
  	N44.get(b).move();
  	 if(N44.get(b).getX() == width || N44.get(b).getY() == height || N44.get(b).getX() == 0 || N44.get(b).getY() == 0){
  	 	N44.remove(b);
  	 }
  }

  for(int b = 0; b < N43.size(); b++){
  	N43.get(b).show();
  	N43.get(b).move();
  	 if(N43.get(b).getX() == width || N43.get(b).getY() == height || N43.get(b).getX() == 0 || N43.get(b).getY() == 0){
  	 	N43.remove(b);
  	 }
  }
   
   rotSpin++;
   N42.add(new RotShield(N49));
   N42.get(0).show();
   N42.get(0).setPointDirection(rotSpin);

  //MegaBomb Bar
  fill(45, 126, 255);
  rect(60, 640, shieldCount, 40);

  N49.show();
  N49.move();

  //Ship Health Bar
  if(health > 45){
    fill(66, 244, 69);
 }
  if(health > 20 && health < 45){
  	fill(255, 161, 0);
  }
  if(health > 0 && health < 20){
  	fill(232, 4, 4);
  }
  rect(800, 640, health, 40);

  //High Score
  if(health > 0){
  highScore = frameCount + asteroidsKill;
 }
  fill(255, 255, 255);
  textSize(20);
  if(key != 'f' && !hPressed){
  text("High Score: " + highScore, 660, 35);
 }
 
  if(key == 'f') {
  	frameRate(30);
  	hyperSpace();
  }
  else{
  	frameRate(120);
  }

 if(keyPressed) {
 	if(wPressed){
 		N49.accelerate(0.1);
 	}
 	if(sPressed){
 		N49.accelerate(-0.1);
 	}
 	if(aPressed){
 		N49.turn(-2);
 		
 	}
 	if(dPressed){
 		N49.turn(2);
 		
 	}
 	if(hPressed){
 		hyperDrive();
 	}
 	if(spPressed){
 		shoot();
 	}
 	if(gPressed && shieldCount > 0){
 		shield();
  	    shieldCount--;
 	}
 	if(rPressed){
 		//addAsteroids();
 	}
 }

     
}

void hyperSpace() {

	N49.setX((int)(Math.random()*1369) + 1);
	N49.setY((int)(Math.random()*699) + 1);

}

void hyperDrive() {
	N49.accelerate(0.65);
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
	if(key == 'e'){
		hPressed = true;
	}
	if(key == ' '){
		spPressed = true;
	}
	if(key == 'g'){
		gPressed = true;
	}
	if(key == 'r'){
		rPressed = true;
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
	if(key == 'e'){
		hPressed = false;
	} 
	if(key == ' '){
		spPressed = false;
	}
	if(key == 'g'){
		gPressed = false;
	}
	if(key == 'r'){
		rPressed = false;
	}

}

void shoot(){
	if(frameCount % 10 == 0){
	N46.add(new Bullet(N49));
	N45.add(new sideBullet(N49));
	N44.add(new sideBullet2(N49));
 }
   
  
}

void shield() {
  for(int i = 0; i < 10; i++){
	N43.add(new Missiles(N49));
  }
}
