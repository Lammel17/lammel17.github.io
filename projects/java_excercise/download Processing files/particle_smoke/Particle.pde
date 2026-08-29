class Particle{
  PVector xy;
  PVector speed;
  PVector acc;
  int lifespan;
  boolean isDead = false;
  PImage img;
  PVector acc2;
  
  Particle(PVector xy){
    this.xy = xy;
    acc = new PVector(0,-0.1);
    speed = new PVector(random(-1,1),random(-3,-1));
    lifespan = 255;
    img = getImg();
  }
  
  
  void run(PVector windDir){
   update(windDir);
   display(); 
  }
  
  
  void update(PVector windDir){
    acc2 = new PVector(acc.x+windDir.x, acc.y+windDir.y);
    speed.add(acc2);
   // speed.limit(8);
    xy.add(speed);
    lifespan -= 5;
  }
  
  
  void display(){
    fill(0,0,255,lifespan/1.5);
    noStroke();
    //rect(xy.x, xy.y, 50,50);
   tint(255, lifespan/6);
   image(img,xy.x,xy.y,120,120);
  }
  

  boolean isDead(){
    if (lifespan <= 0){
      return true;
    } else{
     return false; 
    }
  }
  
  
  
  
}
