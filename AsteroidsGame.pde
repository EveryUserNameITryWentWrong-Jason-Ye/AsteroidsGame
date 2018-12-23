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
ArrayList <Laser> N38;

color asteroids;
color asteroidsHit;
color bossteroid;

boolean qPressed = false;
boolean wPressed = false;

int buff = 0;
float shieldCount = 0;
float laserCharge = 100;
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
 
 size(900, 900);
 
 asteroids = color(170, 161, 161);
 asteroidsHit = color(198, 190, 190);
 bossteroid = color(111, 111, 102);

 N49 = new Spaceship();
 N49.setColor(255);
 N49.setX(500);
 N49.setY(500);
 N49.setPointDirection(270);
 
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
   N50.get(i).setHealth(5000);

 }

 
 
}


public void draw(){

 frameRate(999);

 background(33, 32, 32);
 
 
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
  
  //Laser Show
  for(int b = 0; b < N38.size(); b++){
    N38.get(b).show();
    N38.get(b).move();
     if(N38.get(b).getX() == width || N38.get(b).getY() == height || N38.get(b).getX() == 0 || N38.get(b).getY() == 0){
       N38.remove(b);
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
   N49.update();
   shoot();

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
   N50.get(nI).setColor(bossteroid);
   N50.get(nI).show();
   N50.get(nI).move();
   float ds = dist(N49.getX(), N49.getY(), N50.get(nI).getX(), N50.get(nI).getY());
   if(ds < 195){
     health = health - 10;
     N50.get(nI).setColor(asteroidsHit - 20);
     N50.get(nI).show();
     N50.get(nI).damage(10);
   }
   if(health <= 0){
     /*N49.setX(10000);
     N49.setY(10000);
     fill(255);
     textSize(40);
     text("Game Over, Enjoy Watching the Asteroids!", 100, 500);*/
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
     if(laserCharge < 100){
       laserCharge += 10;
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
     if(laserCharge < 100){
       laserCharge += 10;
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
     if(laserCharge < 100){
       laserCharge += 10;
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
     if(laserCharge < 100){
       laserCharge += 10;
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
     if(laserCharge < 100){
       laserCharge += 10;
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
     if(laserCharge < 100){
       laserCharge += 10;
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
     if(laserCharge < 100){
       laserCharge += 10;
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
     N50.get(nI).setColor(asteroidsHit - 20);
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
   if(ds < 100){
     health = health - 1;
     N48.get(nI).setColor(asteroidsHit);
     N48.get(nI).show();
     N48.get(nI).damage(10);
   }
   if(health <= 0){
     /*N49.setX(10000);
     N49.setY(10000);
     fill(255);
     textSize(40);
     text("Game Over, Enjoy Watching the Asteroids!", 100, 500);*/
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
   if(N48.get(nI).getHealth() <= 0){
     N48.remove(nI);
     if(shieldCount < 100){
     shieldCount = shieldCount + 1;
     }
     if(laserCharge < 100){
       laserCharge += 2;
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
     if(laserCharge < 100){
       laserCharge += 2;
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
     if(laserCharge < 100){
       laserCharge += 2;
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
     if(laserCharge < 100){
       laserCharge += 2;
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
     if(laserCharge < 100){
       laserCharge += 2;
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
     if(laserCharge < 100){
       laserCharge += 2;
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
     if(laserCharge < 100){
       laserCharge += 2;
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
     break;
   }
  }
  
  //Laser Bar
  fill(255);
  textSize(20);
  text("Laser Charge: " + laserCharge + ' %', 343, 833);
  fill(207, 255, 0);
  noStroke();
  rect(380, 840, laserCharge, 40);
  stroke(255);
  noFill();
  rect(379, 839, 101, 41);

  //MegaBomb Bar
  fill(255);
  textSize(20);
  text("Mega Bomb Charge: " + shieldCount + ' %', 22, 833);
  fill(45, 126, 255);
  noStroke();
  rect(90, 840, shieldCount, 40);
  stroke(255);
  noFill();
  rect(89, 839, 101, 41);

  //Ship Health Bar
  fill(255);
  textSize(20);
  text("Health: " + health + ' %', 680, 833);
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
  rect(700, 840, health, 40);
  stroke(255);
  noFill();
  rect(699, 839, 101, 41);
  
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
  text("High Score: " + highScore, 335, 35);
 
 
 //Stage Count
 textSize(20);
 text("Stage " + stage, 30, 35);
 


 
 if(keyPressed) {

   if(qPressed && shieldCount > 0){
     shield();
     shieldCount--;
   }
  
  if(wPressed && laserCharge > 0){
    laser();
    laserCharge--;
  }
 
 }
     
}



void hyperDrive() {
  N49.accelerate(0.65);
}

void keyPressed() {

  if(key == 'q'){
    qPressed = true;
  }
  if(key == 'w'){
    wPressed = true;
  }

}

void keyReleased() {

  if(key == 'q'){
    qPressed = false;
  }
  if(key == 'w'){
    wPressed = false;
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