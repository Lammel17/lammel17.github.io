Circle c;
Circle other;
int circlesPerFrame = 1;
float speed = 0.5;
int attempts = 0;
int attemptsMax = 1000000;
int timeUp = 300;
ArrayList<Circle> circles;

void setup(){
 size(1000, 625, P2D);
 pixelDensity(2);
 circles = new ArrayList<Circle>();
}

void draw(){
 // frameRate(24);
  background(0);
  
  int count = 0;
  
  while(count < circlesPerFrame){
  Circle newC = newCircle();
  count++;
  if(newC != null){
   circles.add(newC); 
   //count++;
  }
  attempts++;
  if(attempts > attemptsMax){
    noLoop();
    break;
  }
 }

  for(Circle c : circles){
    
  if(c.counter < timeUp){
    int t = int(map(c.counter,0,timeUp,255,0));
  c.show(t);
  c.grow(); 
  } else {
    c.x = 0;
    c.y = 0;
    c.r = 0;
  }
  }
}


Circle newCircle(){
  float x = random(width);
  float y = random(height);
  
  boolean valid = true;
  for(Circle c : circles) {
    float d = dist(x,y,c.x,c.y);
    if(d < c.r+5){
      valid = false;
      break;
    }
  }
  
  if(valid){
  return new Circle(x,y,speed);
  } else {
    return null;
 }
}
