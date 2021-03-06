Spaceship N49;
Star [] N47;
eShield N37;
ArrayList <Asteroid> N48;
ArrayList <Bossteroid> N50;
ArrayList <Bullet> N46;
ArrayList <sideBullet> N45;
ArrayList <sideBullet2> N44;
ArrayList <Missiles> N43;
ArrayList <RotShield> N42;
ArrayList <WingCannon> N41;
ArrayList <WingCannon2> N40;
ArrayList <RandomCannon> N39;
ArrayList <Laser> N38;

color asteroids;
color asteroidsHit;
color bossteroid;

boolean qPressed = false;
boolean wPressed = false;
boolean ePressed = false;

int buff = 0;
float shieldCount = 0;
float laserCharge = 0;
float eShieldCount = 0;
int difficulty = 6;
float Pct = 0.0;
int rotSpin = 0; 
int highScore = 0;
int asteroidsKill = 0;
int shieldGen = 0;
float health = 100.0;
int stage = 1;
int money = 0;


int myX, myY, myColor;
 
 float beginX = 450;  
 float beginY = 1000;  
 float endX = 0;
 float endY = 0;
 float dX;          
 float dY;          
 float x = 0.0;        
 float y = 0.0;       
 float spd = 0.05;   
 float p = 0.0;


public void setup() 
{
 
 size(900, 900);
 
 asteroids = color(170, 161, 161);
 asteroidsHit = color(198, 190, 190);
 bossteroid = color(111, 111, 102);
 
 
 N49 = new Spaceship();
 N49.setColor(255);
 N49.setX(450);
 N49.setY(450);
 N49.setPointDirection(270);
 
 N37 = new eShield(N49);
 
 N46 = new ArrayList<Bullet>();
 N45 = new ArrayList<sideBullet>();
 N44 = new ArrayList<sideBullet2>();
 N43 = new ArrayList<Missiles>();
 N42 = new ArrayList<RotShield>();
 N41 = new ArrayList<WingCannon>();
 N40 = new ArrayList<WingCannon2>();
 N39 = new ArrayList<RandomCannon>();
 N38 = new ArrayList<Laser>();


 N42.add(new RotShield(N49));

 N47 = new Star[1000];
 for(int i = 0; i < N47.length; i++){
   N47[i] = new Star();
 }
 
 N48 = new ArrayList<Asteroid>();
 for(int i = 0; i < 5; i++){
   N48.add(new Asteroid());
   N48.get(i).setX(width + 60);
   N48.get(i).setY(height + 60);
   N48.get(i).setDirectionX((Math.random()*2.4) - 1.2);
   N48.get(i).setDirectionY((Math.random()*2.4) - 1.2);
   N48.get(i).setHealth(700);

 }
 
 N50 = new ArrayList<Bossteroid>();
 for(int i = 0; i < 1; i++){
   N50.add(new Bossteroid());
   N50.get(i).setX(width + 210);
   N50.get(i).setY(height + 210);
   N50.get(i).setDirectionX((Math.random()*2.4) - 1.2);
   N50.get(i).setDirectionY((Math.random()*2.4) - 1.2);
   N50.get(i).setHealth(15000);

 }

 
 
}


public void draw(){

 frameRate(120);

 background(33, 32, 32);
  
 dX = endX - beginX;
 dY = endY - beginY;
 
  p += spd;
  if (p < 1.0) {
    x = beginX + (p * dX);
    y = beginY + (p * dY);
  }
  
  p = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  dX = endX - beginX;
  dY = endY - beginY;
  
 
 
 for(int nI = 0; nI < N47.length; nI++){
   N47[nI].show();
   N47[nI].move();
 }
 
 //Main Cannon Show
 for(int a = 0; a < N46.size(); a++){
    N46.get(a).show();
    N46.get(a).move();
    N46.get(a).accelerate(0.9);
     if(N46.get(a).getX() > width + 100 || N46.get(a).getY() > height + 100 || N46.get(a).getX() < -100 || N46.get(a).getY() < -100){
       N46.remove(a);
     }
  }
  
  //sideBullet Show
  for(int b = 0; b < N45.size(); b++){
    N45.get(b).show();
    N45.get(b).move();
     if(N45.get(b).getX() > width + 100 || N45.get(b).getY() > height + 100 || N45.get(b).getX() < -100 || N45.get(b).getY() < -100){
       N45.remove(b);
     }
  }

  //sideBullet2 Show
  for(int b = 0; b < N44.size(); b++){
    N44.get(b).show();
    N44.get(b).move();
     if(N44.get(b).getX() > width + 100 || N44.get(b).getY() > height + 100 || N44.get(b).getX() < -100 || N44.get(b).getY() < -100){
       N44.remove(b);
     }
  }
  
  //RandomCannon show
  for(int b = 0; b < N39.size(); b++){
    N39.get(b).show();
    N39.get(b).move();
     if(N39.get(b).getX() > width + 100 || N39.get(b).getY() > height + 100 || N39.get(b).getX() < -100 || N39.get(b).getY() < -100){
       N39.remove(b);
     }
  }

  //Mega Bomb Show
  for(int b = 0; b < N43.size(); b++){
    N43.get(b).show();
    N43.get(b).move();
     if(N43.get(b).getX() > width + 100 || N43.get(b).getY() > height + 100 || N43.get(b).getX() < -100 || N43.get(b).getY() < -100){
       N43.remove(b);
     }
  }
  
  //Laser Show
  for(int b = 0; b < N38.size(); b++){
    N38.get(b).show();
    N38.get(b).move();
     if(N38.get(b).getX() > width + 100 || N38.get(b).getY() > height + 100 || N38.get(b).getX() < -100 || N38.get(b).getY() < -100){
       N38.remove(b);
     }
  }
  
  //WingCannon Show
  for(int b = 0; b < N41.size(); b++){
    N41.get(b).show();
    N41.get(b).move();
    N41.get(b).accelerate(0.29);
     if(N41.get(b).getX() > width + 100 || N41.get(b).getY() > height + 100 || N41.get(b).getX() < -100 || N41.get(b).getY() < -100){
       N41.remove(b);
     }
  }
  
  //WingCannon2 Show
  for(int b = 0; b < N40.size(); b++){
    N40.get(b).show();
    N40.get(b).move();
    N40.get(b).accelerate(0.29);
     if(N40.get(b).getX() > width + 100 || N40.get(b).getY() > height + 100 || N40.get(b).getX() < -100 || N40.get(b).getY() < -100){
       N40.remove(b);
     }
  }
  
  //RotShield Regen
  if(N42.size() < 1 && shieldGen == 3){
   N42.add(new RotShield(N49)); 
   shieldGen = shieldGen - 3;
  }
  
  //RotShield Show
  for(int b = 0; b < N42.size(); b++){
    rotSpin = rotSpin + 7;
    N42.get(b).show();
    N42.get(b).setPointDirection(rotSpin);
    N42.get(b).setX(N49.getX());
    N42.get(b).setY(N49.getY());
  }
  
	if(keyPressed) {

   if(qPressed && shieldCount > 0 && health > 0){
     shield();
     shieldCount--;
   }
		
	if(wPressed && laserCharge > 0 && health > 0){
		laser();
    laserCharge--;
    fill(207 + (int)(Math.random()*61) - 30, 255 + (int)(Math.random()*61) - 30, 0);
    rect(x - 5, y, 10, -1000);
   }
   
   if(ePressed && eShieldCount > 0 && health > 0){
     N37 = new eShield(N49);
     N37.show();
     eShieldCount--;
     spd = 0.015;
   } 
  
 
 }
  
   //Ship Show
 
 spd = 0.05;
 
 if(health > 0){
   N49.Exhaust();
   N49.show();
   N49.move();

   N49.setX((int)x);
   N49.setY((int)y);
   if(!wPressed){
   shoot();
   }

  }
	

   //Asteroids Spawn
   if(N48.size() == 0){
    buff += 10;
    N48 = new ArrayList<Asteroid>();
    for(int i = 0; i < difficulty; i++){
    N48.add(new Asteroid());
    N48.get(i).setX(width + 60);
    N48.get(i).setY(height + 60);
    N48.get(i).setDirectionX((Math.random()*2.4) - 1.2);
    N48.get(i).setDirectionY((Math.random()*2.4) - 1.2);
    N48.get(i).setHealth(700 + buff);
   }
   
   difficulty++;
   stage++;

 }
 
 
 //Bossteroid Spawn
 if(N50.size() == 0){
   N50 = new ArrayList<Bossteroid>();
   for(int nI = 0; nI < 1; nI++){
   N50.add(new Bossteroid());
   N50.get(nI).setX(450 + (int)(Math.random()*601) - 300);
   N50.get(nI).setY(height + 210);
   N50.get(nI).setDirectionX((Math.random()*2.4) - 1.2);
   N50.get(nI).setDirectionY((Math.random()*2.4) - 1.2);
   N50.get(nI).setHealth(15000);
   }
 }

 
 //Bossteroid Collision
 
 //ship Collision
 for(int nI = 0; nI < N50.size(); nI++){
   N50.get(nI).setColor(bossteroid);
   N50.get(nI).show();
   N50.get(nI).move();
   float ds = dist(N49.getX(), N49.getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(ds < 195 && !ePressed){
     health = health - 10;
     N50.get(nI).setColor(asteroidsHit - 20);
     N50.get(nI).show();
     N50.get(nI).damage(10);
   }
   if(ds < 220 && ePressed){
     N50.get(nI).setColor(asteroidsHit - 20);
     N50.get(nI).show();
     N50.get(nI).damage(60);
   }
   if(health <= 0){
     N49.setX(10000);
     N49.setY(10000);
     fill(255);
     textSize(40);
     text("Game Over, Enjoy Watching the Asteroids!", 80, 500);
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     money += 90 + ((int)(Math.random()*21) - 10);
   }
}

//RotShield Collision
for(int nI = 0; nI < N50.size(); nI++)
  for(int a = 0; a < N42.size(); a++){
   float d9 = dist(N42.get(a).getX(), N42.get(a).getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(d9 < 100){
    N50.get(nI).setColor(asteroidsHit - 20);
    N50.get(nI).show();
    N50.get(nI).damage(500);
    N42.remove(a);
    break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 8;
     }
     if(laserCharge < 150){
       laserCharge += 10;
     }
     if(eShieldCount < 150){
       eShieldCount += 10;
     }
     asteroidsKill = asteroidsKill + 500;
     money += 90 + ((int)(Math.random()*21) - 10);
     break;
   }
  }

//Main Cannon Collision
for(int nI = 0; nI < N50.size(); nI++)
  for(int a = 0; a < N46.size(); a++){
   float d2 = dist(N46.get(a).getX(), N46.get(a).getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(d2 < 170){
    N50.get(nI).setColor(asteroidsHit - 20);
    N50.get(nI).show();
    N50.get(nI).damage(60);
    N46.remove(a);
    break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 8;
     }
     if(laserCharge < 150){
       laserCharge += 10;
     }
     if(eShieldCount < 150){
       eShieldCount += 10;
     }
     asteroidsKill = asteroidsKill + 500;
     money += 90 + ((int)(Math.random()*21) - 10);
     if(N42.size() < 1){
       shieldGen++;
     }
     
     break;
   }
  }

//SideBullet Collision
for(int nI = 0; nI < N50.size(); nI++)
   for(int o = 0; o < N45.size(); o++){
   float d = dist(N45.get(o).getX(), N45.get(o).getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(d < 170){
     N50.get(nI).damage(10);
     N50.get(nI).setColor(asteroidsHit - 20);
     N50.get(nI).show();
     N45.remove(o);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 8;
     }
     if(laserCharge < 150){
       laserCharge += 10;
     }
     if(eShieldCount < 150){
       eShieldCount += 10;
     }
     asteroidsKill = asteroidsKill + 500;
     money += 90 + ((int)(Math.random()*21) - 10);
     if(N42.size() < 1){
       shieldGen++;
     }
     break;
   }
  }

//SideBullet 2 Collision
 for(int nI = 0; nI < N50.size(); nI++)
  for(int a = 0; a < N44.size(); a++){
   float d1 = dist(N44.get(a).getX(), N44.get(a).getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(d1 < 170){
     N50.get(nI).damage(10);
     N50.get(nI).setColor(asteroidsHit - 20);
     N50.get(nI).show();
     N44.remove(a);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 8;
     }
     if(laserCharge < 150){
       laserCharge += 10;
     }
     if(eShieldCount < 150){
       eShieldCount += 10;
     }
     asteroidsKill = asteroidsKill + 500;
     money += 90 + ((int)(Math.random()*21) - 10);
     if(N42.size() < 1){
       shieldGen++;
     }
     break;
   }
  }
  
  //RandomCannon Collision
  for(int nI = 0; nI < N50.size(); nI++)
  for(int a = 0; a < N39.size(); a++){
   float d1 = dist(N39.get(a).getX(), N39.get(a).getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(d1 < 170){
     N50.get(nI).damage(20);
     N50.get(nI).setColor(asteroidsHit - 20);
     N50.get(nI).show();
     N39.remove(a);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 8;
     }
     if(laserCharge < 150){
       laserCharge += 10;
     }
     if(eShieldCount < 150){
       eShieldCount += 10;
     }
     asteroidsKill = asteroidsKill + 500;
     money += 90 + ((int)(Math.random()*21) - 10);
     if(N42.size() < 1){
       shieldGen++;
     }
     break;
   }
  }
  
  //WingCannon Collision
  for(int nI = 0; nI < N50.size(); nI++)
  for(int a = 0; a < N41.size(); a++){
   float d1 = dist(N41.get(a).getX(), N41.get(a).getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(d1 < 170){
     N50.get(nI).damage(75);
     N50.get(nI).setColor(asteroidsHit - 20);
     N50.get(nI).show();
     N41.remove(a);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 8;
     }
     if(laserCharge < 150){
       laserCharge += 10;
     }
     if(eShieldCount < 150){
       eShieldCount += 10;
     }
     asteroidsKill = asteroidsKill + 500;
     money += 90 + ((int)(Math.random()*21) - 10);
     if(N42.size() < 1){
       shieldGen++;
     }
     break;
   }
  }
  
  //WingCannon Collision
  for(int nI = 0; nI < N50.size(); nI++)
  for(int a = 0; a < N40.size(); a++){
   float d1 = dist(N40.get(a).getX(), N40.get(a).getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(d1 < 170){
     N50.get(nI).damage(75);
     N50.get(nI).setColor(asteroidsHit - 20);
     N50.get(nI).show();
     N40.remove(a);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 8; 
     }
     if(laserCharge < 150){
       laserCharge += 10;
     }
     if(eShieldCount < 150){
       eShieldCount += 10;
     }
     asteroidsKill = asteroidsKill + 500;
     money += 90 + ((int)(Math.random()*21) - 10);
     if(N42.size() < 1){
       shieldGen++;
     }
     break;
   }
  }
  
//MegaBomb Collision
  for(int nI = 0; nI < N50.size(); nI++)
  for(int a = 0; a < N43.size(); a++){
   float d3 = dist(N43.get(a).getX(), N43.get(a).getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(d3 < 170){
     N50.get(nI).setColor(asteroidsHit - 20);
     N50.get(nI).damage(300);
     N50.get(nI).show();
     N43.remove(a);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     asteroidsKill = asteroidsKill + 500;
     money += 90 + ((int)(Math.random()*21) - 10);
     break;
   }
  }
 
//Laser Collision
  for(int nI = 0; nI < N50.size(); nI++)
  for(int a = 0; a < N38.size(); a++){
   float d3 = dist(N38.get(a).getX(), N38.get(a).getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(d3 < 190){
     N50.get(nI).setColor(asteroidsHit - 20);
     N50.get(nI).damage(100);
     N50.get(nI).show();
     N38.remove(a);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     asteroidsKill = asteroidsKill + 500;
     money += 90 + ((int)(Math.random()*21) - 10);
     break;
   }
  }
 
  
  //Regular Asteroids Collision
   
//ship Collision
 for(int nI = 0; nI < N48.size(); nI++){
   N48.get(nI).setColor(asteroids);
   N48.get(nI).show();
   N48.get(nI).move();
   float ds = dist(N49.getX(), N49.getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(ds < 100 && !ePressed){
     health = health - 1;
     N48.get(nI).setColor(asteroidsHit);
     N48.get(nI).show();
     N48.get(nI).damage(10);
   }
   if(ds < 150 && ePressed){
     N48.get(nI).setColor(asteroidsHit);
     N48.get(nI).show();
     N48.get(nI).damage(40);
   }
   if(health <= 0){
     N49.setX(10000);
     N49.setY(10000);
     fill(255);
     textSize(40);
     text("Game Over, Enjoy Watching the Asteroids!", 80, 500);
   }
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
     money += 10 + ((int)(Math.random()*11) - 5);
   }
}

//RotShield Collision
for(int nI = 0; nI < N48.size(); nI++)
  for(int a = 0; a < N42.size(); a++){
   float d9 = dist(N42.get(a).getX(), N42.get(a).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d9 < 100){
    N48.get(nI).damage(1000);
    N42.remove(a);
    break;
   }
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 1;
     }
     if(laserCharge < 150){
       laserCharge += 2;
     }
     if(eShieldCount < 150){
       eShieldCount += 2;
     }

     asteroidsKill = asteroidsKill + 50;
     money += 10 + ((int)(Math.random()*11) - 5);
     break;
   }
  }

//Main Cannon Collision
for(int nI = 0; nI < N48.size(); nI++)
  for(int a = 0; a < N46.size(); a++){
   float d2 = dist(N46.get(a).getX(), N46.get(a).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d2 < 70){
    N48.get(nI).setColor(asteroidsHit);
    N48.get(nI).show();
    N48.get(nI).damage(60);
    N46.remove(a);
    break;
   }
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 1;
     }
     if(laserCharge < 150){
       laserCharge += 2;
     }
     if(eShieldCount < 150){
       eShieldCount += 2;
     }
     asteroidsKill = asteroidsKill + 50;
     money += 10 + ((int)(Math.random()*11) - 5);
     if(N42.size() < 1){
       shieldGen++;
     }

     break;
   }
  }

//SideBullet Collision
for(int nI = 0; nI < N48.size(); nI++)
   for(int o = 0; o < N45.size(); o++){
   float d = dist(N45.get(o).getX(), N45.get(o).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d < 70){
     N48.get(nI).damage(10);
     N48.get(nI).setColor(asteroidsHit);
     N48.get(nI).show();
     N45.remove(o);
     break;
   }
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 1;
     }
     if(laserCharge < 150){
       laserCharge += 2;
     }
     if(eShieldCount < 150){
       eShieldCount += 2;
     }
     asteroidsKill = asteroidsKill + 50;
     money += 10 + ((int)(Math.random()*11) - 5);
     if(N42.size() < 1){
       shieldGen++;
     }

     break;
   }
  }

//SideBullet 2 Collision
 for(int nI = 0; nI < N48.size(); nI++)
  for(int a = 0; a < N44.size(); a++){
   float d1 = dist(N44.get(a).getX(), N44.get(a).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d1 < 70){
     N48.get(nI).damage(10);
     N48.get(nI).setColor(asteroidsHit);
     N48.get(nI).show();
     N44.remove(a);
     break;
   }
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 1;
     }
     if(laserCharge < 150){
       laserCharge += 2;
     }
     if(eShieldCount < 150){
       eShieldCount += 2;
     }
     asteroidsKill = asteroidsKill + 50;
     money += 10 + ((int)(Math.random()*11) - 5);
     if(N42.size() < 1){
       shieldGen++;
     }

     break;
   }
  }
  
  //RandomCannon Collision
  for(int nI = 0; nI < N48.size(); nI++)
  for(int a = 0; a < N39.size(); a++){
   float d1 = dist(N39.get(a).getX(), N39.get(a).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d1 < 70){
     N48.get(nI).damage(20);
     N48.get(nI).setColor(asteroidsHit);
     N48.get(nI).show();
     N39.remove(a);
     break;
   }
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 1;
     }
     if(laserCharge < 150){
       laserCharge += 2;
     }
     if(eShieldCount < 150){
       eShieldCount += 2;
     }
     asteroidsKill = asteroidsKill + 50;
     money += 10 + ((int)(Math.random()*11) - 5);
     if(N42.size() < 1){
       shieldGen++;
     }
     break;
   }
  }
  
  //WingCannon Collision
  for(int nI = 0; nI < N48.size(); nI++)
  for(int a = 0; a < N41.size(); a++){
   float d1 = dist(N41.get(a).getX(), N41.get(a).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d1 < 70){
     N48.get(nI).damage(75);
     N48.get(nI).setColor(asteroidsHit);
     N48.get(nI).show();
     N41.remove(a);
     break;
   }
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 1;
     }
     if(laserCharge < 150){
       laserCharge += 2;
     }
     if(eShieldCount < 150){
       eShieldCount += 2;
     }
     asteroidsKill = asteroidsKill + 50;
     money += 10 + ((int)(Math.random()*11) - 5);
     if(N42.size() < 1){
       shieldGen++;
     }
     break;
   }
  }
  
  //WingCannon Collision
  for(int nI = 0; nI < N48.size(); nI++)
  for(int a = 0; a < N40.size(); a++){
   float d1 = dist(N40.get(a).getX(), N40.get(a).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d1 < 70){
     N48.get(nI).damage(75);
     N48.get(nI).setColor(asteroidsHit);
     N48.get(nI).show();
     N40.remove(a);
     break;
   }
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 1;
     }
     if(laserCharge < 150){
       laserCharge += 2;
     }
     if(eShieldCount < 150){
       eShieldCount += 2;
     }
     asteroidsKill = asteroidsKill + 50;
     money += 10 + ((int)(Math.random()*11) - 5);
     if(N42.size() < 1){
       shieldGen++;
     }
     break;
   }
  }
  
//MegaBomb Collision
  for(int nI = 0; nI < N48.size(); nI++)
  for(int a = 0; a < N43.size(); a++){
   float d3 = dist(N43.get(a).getX(), N43.get(a).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d3 < 70){
     N48.get(nI).setColor(asteroidsHit);
     N48.get(nI).damage(300);
     N48.get(nI).show();
     N43.remove(a);
     break;
   }
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
     asteroidsKill = asteroidsKill + 50;
     money += 10 + ((int)(Math.random()*11) - 5);
     break;
   }
  }
  
//Laser Collision
  for(int nI = 0; nI < N48.size(); nI++)
  for(int a = 0; a < N38.size(); a++){
   float d3 = dist(N38.get(a).getX(), N38.get(a).getY(), N48.get(nI).getX(), N48.get(nI).getY());
   if(d3 < 70){
     N48.get(nI).setColor(asteroidsHit - 20);
     N48.get(nI).damage(100);
     N48.get(nI).show();
     N38.remove(a);
     break;
   }
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
     asteroidsKill = asteroidsKill + 500;
     money += 10 + ((int)(Math.random()*11) - 5);
     break;
   }
  }

  
  //Laser Bar
  fill(255);
  textSize(18);
  text("Laser: " + laserCharge + " %", 263, 833);
  fill(207, 255, 0);
  noStroke();
  rect(250, 840, laserCharge, 40);
  stroke(255);
  noFill();
  rect(249, 839, 151, 41);
  
  //EnergyShield Bar
  fill(255);
  textSize(18);
  text("Shield: " + eShieldCount + " %", 503, 833);
  fill(211, 255, 227);
  noStroke();
  rect(495, 840, eShieldCount, 40);
  stroke(255);
  noFill();
  rect(494, 839, 151, 41);

  //MegaBomb Bar
  fill(255);
  textSize(18);
  text("Mega Bomb: " + shieldCount + " %", 25, 833);
  fill(45, 126, 255);
  noStroke();
  rect(66, 840, shieldCount, 40);
  stroke(255);
  noFill();
  rect(65, 839, 101, 41);

  //Ship Health Bar
  fill(255);
  textSize(18);
  text("Health: " + health + " %", 714, 833);
  if(health > 45){
    fill(66, 244, 69);
  }
  if(health > 20 && health < 45){
    fill(255, 161, 0);
  }
  if(health > 0 && health < 20){
    fill(232, 4, 4);
  }
  noStroke();
  rect(730, 840, health, 40);
  stroke(255);
  noFill();
  rect(729, 839, 101, 41);
  
  //Bossteroid Health Bar
  if(N50.size() > 0){
  fill(255, 124, 124);
  rect((float)(N50.get(0).getX()), (float)(N50.get(0).getY()), (float)((N50.get(0).getHealth())/180), (float)(40)); 
  }
  
  //High Score
  if(health > 0 && frameCount > 340){
  highScore = frameCount - 340 + asteroidsKill;
 }
  fill(255, 255, 255);
  textSize(20);
  text("High Score: " + highScore, 335, 35);
 
 
 //Stage Count
 textSize(20);
 text("Stage " + stage, 30, 35);

 //Money Count
 textSize(20);
 text("Space Bucks: $" + money, 665, 35);
 
 fill(255, 252, 144, 200);
 ellipse(645, 28, 20, 20);
 
  fill(0, 0, 0);

 text('$', 639, 36);
 
}


void keyPressed() {

  if(key == 'q'){
    qPressed = true;
  }
  if(key == 'w'){
    wPressed = true;
  }
  if(key == 'e'){
    ePressed = true;
  }

}

void keyReleased() {

  if(key == 'q'){
    qPressed = false;
  }
  if(key == 'w'){
    wPressed = false;
  }
  if(key == 'e'){
    ePressed = false;
  }

}

void shoot(){
  if(frameCount % 10 == 0){
  N46.add(new Bullet(N49));
  N45.add(new sideBullet(N49));
  N44.add(new sideBullet2(N49));
 }
 if(frameCount % 150 == 0){
   N41.add(new WingCannon(N49));
   N40.add(new WingCannon2(N49));
 }
 if(frameCount % 20 == 0){
   N39.add(new RandomCannon(N49));
 }
}

void shield() {
  for(int i = 0; i < 10; i++){
  N43.add(new Missiles(N49));
  }
}

void laser() {
  for(int i = 0; i < 10; i++){
    N38.add(new Laser(N49));
  }
}
