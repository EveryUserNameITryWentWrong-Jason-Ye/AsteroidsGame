Spaceship N49;
Star [] N47;
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
int difficulty = 6;
float Pct = 0.0;
int rotSpin = 0; 
int highScore = 0;
int asteroidsKill = 0;
int shieldGen = 0;
float health = 100.0;
int stage = 1;


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
 N41 = new ArrayList<WingCannon>();
 N40 = new ArrayList<WingCannon2>();
 N39 = new ArrayList<RandomCannon>();

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
   N50.get(i).setHealth(5000);

 }
 
 
 
}


public void draw(){

 frameRate(999);
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
 
 //Main Cannon Show
 for(int a = 0; a < N46.size(); a++){
    N46.get(a).show();
    N46.get(a).move();
    N46.get(a).accelerate(0.9);
     if(N46.get(a).getX() == width || N46.get(a).getY() == height || N46.get(a).getX() == 0 || N46.get(a).getY() == 0){
       N46.remove(a);
     }
  }
  
  //sideBullet Show
  for(int b = 0; b < N45.size(); b++){
    N45.get(b).show();
    N45.get(b).move();
     if(N45.get(b).getX() == width || N45.get(b).getY() == height || N45.get(b).getX() == 0 || N45.get(b).getY() == 0){
       N45.remove(b);
     }
  }

  //sideBullet2 Show
  for(int b = 0; b < N44.size(); b++){
    N44.get(b).show();
    N44.get(b).move();
     if(N44.get(b).getX() == width || N44.get(b).getY() == height || N44.get(b).getX() == 0 || N44.get(b).getY() == 0){
       N44.remove(b);
     }
  }
  
  //RandomCannon show
  for(int b = 0; b < N39.size(); b++){
    N39.get(b).show();
    N39.get(b).move();
     if(N39.get(b).getX() == width || N39.get(b).getY() == height || N39.get(b).getX() == 0 || N39.get(b).getY() == 0){
       N39.remove(b);
     }
  }

  //Mega Bomb Show
  for(int b = 0; b < N43.size(); b++){
    N43.get(b).show();
    N43.get(b).move();
     if(N43.get(b).getX() == width || N43.get(b).getY() == height || N43.get(b).getX() == 0 || N43.get(b).getY() == 0){
       N43.remove(b);
     }
  }
  
  //WingCannon Show
  for(int b = 0; b < N41.size(); b++){
    N41.get(b).show();
    N41.get(b).move();
    N41.get(b).accelerate(0.29);
     if(N41.get(b).getX() == width || N41.get(b).getY() == height || N41.get(b).getX() == 0 || N41.get(b).getY() == 0){
       N41.remove(b);
     }
  }
  
  //WingCannon2 Show
  for(int b = 0; b < N40.size(); b++){
    N40.get(b).show();
    N40.get(b).move();
    N40.get(b).accelerate(0.29);
     if(N40.get(b).getX() == width || N40.get(b).getY() == height || N40.get(b).getX() == 0 || N40.get(b).getY() == 0){
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
  
  
   //Ship Show
   N49.show();
   N49.move();

   //Asteroids Spawn
   if(N48.size() == 0){
   N48 = new ArrayList<Asteroid>();
   for(int i = 0; i < difficulty; i++){
   N48.add(new Asteroid());
   N48.get(i).setX(width + 60);
   N48.get(i).setY(height + 60);
   N48.get(i).setDirectionX((Math.random()*2.4) - 1.2);
   N48.get(i).setDirectionY((Math.random()*2.4) - 1.2);
   N48.get(i).setHealth(700);
   }
   difficulty++;
   stage++;

 }
 
 //Bossteroid Spawn
 if(N50.size() == 0){
   N50 = new ArrayList<Bossteroid>();
   for(int nI = 0; nI < 1; nI++){
   N50.add(new Bossteroid());
   N50.get(nI).setX(width + 210);
   N50.get(nI).setY(height + 210);
   N50.get(nI).setDirectionX((Math.random()*2.4) - 1.2);
   N50.get(nI).setDirectionY((Math.random()*2.4) - 1.2);
   N50.get(nI).setHealth(5000);
   }
 }

 
 //Bossteroid Collision
 
 //ship Collision
 for(int nI = 0; nI < N50.size(); nI++){
   N50.get(nI).setColor(asteroids);
   N50.get(nI).show();
   N50.get(nI).move();
   float ds = dist(N49.getX(), N49.getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(ds < 180 && key != 'f' && !hPressed){
     health = health - 10;
     N50.get(nI).setColor(asteroidsHit);
     N50.get(nI).show();
     N50.get(nI).damage(10);
   }
   if(health <= 0){
     N49.setX(10000);
     N49.setY(10000);
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
   }
}

//RotShield Collision
for(int nI = 0; nI < N50.size(); nI++)
  for(int a = 0; a < N42.size(); a++){
   float d9 = dist(N42.get(a).getX(), N42.get(a).getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(d9 < 100){
    N50.get(nI).damage(500);
    N42.remove(a);
    break;
   }
   if(N50.get(nI).getHealth() <= 0 && key != 'f' && !hPressed){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 15;
     }
     asteroidsKill = asteroidsKill + 500;
     break;
   }
  }

//Main Cannon Collision
for(int nI = 0; nI < N50.size(); nI++)
  for(int a = 0; a < N46.size(); a++){
   float d2 = dist(N46.get(a).getX(), N46.get(a).getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(d2 < 170){
    N50.get(nI).setColor(asteroidsHit);
    N50.get(nI).show();
    N50.get(nI).damage(60);
    N46.remove(a);
    break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 15;
     }
     asteroidsKill = asteroidsKill + 500;
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
     N50.get(nI).setColor(asteroidsHit);
     N50.get(nI).show();
     N45.remove(o);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 15;
     }
     asteroidsKill = asteroidsKill + 500;
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
     N50.get(nI).setColor(asteroidsHit);
     N50.get(nI).show();
     N44.remove(a);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 15;
     }
     asteroidsKill = asteroidsKill + 500;
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
     N50.get(nI).setColor(asteroidsHit);
     N50.get(nI).show();
     N39.remove(a);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 15;
     }
     asteroidsKill = asteroidsKill + 500;
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
     N50.get(nI).setColor(asteroidsHit);
     N50.get(nI).show();
     N41.remove(a);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 15;
     }
     asteroidsKill = asteroidsKill + 500;
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
     N50.get(nI).setColor(asteroidsHit);
     N50.get(nI).show();
     N40.remove(a);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 15;
     }
     asteroidsKill = asteroidsKill + 500;
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
     N50.get(nI).setColor(asteroidsHit);
     N50.get(nI).damage(300);
     N50.get(nI).show();
     N43.remove(a);
     break;
   }
   if(N50.get(nI).getHealth() <= 0){
     N50.remove(nI);
     asteroidsKill = asteroidsKill + 500;
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
   if(ds < 100 && key != 'f' && !hPressed){
     health = health - 1;
     N48.get(nI).setColor(asteroidsHit);
     N48.get(nI).show();
     N48.get(nI).damage(10);
   }
   if(health <= 0){
     //N49.setX(10000);
     //N49.setY(10000);
   }
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
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
   if(N48.get(nI).getHealth() <= 0 && key != 'f' && !hPressed){
     N48.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 1;
     }
     asteroidsKill = asteroidsKill + 50;
     
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
     asteroidsKill = asteroidsKill + 50;
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
     asteroidsKill = asteroidsKill + 50;
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
     asteroidsKill = asteroidsKill + 50;
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
     asteroidsKill = asteroidsKill + 50;
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
     asteroidsKill = asteroidsKill + 50;
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
     asteroidsKill = asteroidsKill + 50;
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
     
     break;
   }
  }
   

  //MegaBomb Bar
  fill(255);
  text("Mega Bomb Charge: " + shieldCount + '%', 50, 633);
  fill(45, 126, 255);
  noStroke();
  rect(110, 640, shieldCount, 40);
  stroke(255);
  noFill();
  rect(109, 639, 101, 41);

  //Ship Health Bar
  fill(255);
  text("Health: " + health + '%', 800, 633);
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
  rect(800, 640, health, 40);
  stroke(255);
  noFill();
  rect(799, 639, 101, 41);
  
  //Bossteroid Health Bar
  if(N50.size() > 0){
  fill(255, 124, 124);
  rect((float)(N50.get(0).getX()), (float)(N50.get(0).getY()), (float)((N50.get(0).getHealth())/80), (float)(40)); 
  }
  
  //High Score
  if(health > 0){
  highScore = frameCount + asteroidsKill;
 }
  fill(255, 255, 255);
  textSize(20);
  if(key != 'f' && !hPressed){
  text("High Score: " + highScore, 630, 35);
 }
 
 //Stage Count
 text("Stage " + stage, 30, 35);
 
  if(key == 'f') {
    frameRate(30);
    hyperSpace();
  }
  else{
    frameRate(999);
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
  if(frameCount % 10 == 0 && key != 'f' && !hPressed){
  N46.add(new Bullet(N49));
  N45.add(new sideBullet(N49));
  N44.add(new sideBullet2(N49));
 }
 if(frameCount % 150 == 0 && key != 'f' && !hPressed){
   N41.add(new WingCannon(N49));
   N40.add(new WingCannon2(N49));
 }
 if(frameCount % 20 == 0 && key != 'f' && !hPressed){
   N39.add(new RandomCannon(N49));
 }
}

void shield() {
  for(int i = 0; i < 10; i++){
  N43.add(new Missiles(N49));
  }
}
