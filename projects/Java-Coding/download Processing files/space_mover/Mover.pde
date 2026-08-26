class Mover{
  PVector loc;
  PVector speed;
  PVector acc;
  float maxSpeed;
  int size;
  int id;
  int pullPushRadius;
  PVector direct;
  
  Mover(float maxSpeed, int size, int id, int pullPushRadius){
    loc = new PVector(random(width), random(height));
    speed = new PVector(0, 0);
    this.maxSpeed = maxSpeed;
    this.size = size;
    this.id = id;
    this.pullPushRadius = pullPushRadius;
  }
  
  void update(float pullMouse, float pullPushOthers, float pushOrPull){
    PVector mouse = new PVector(mouseX,mouseY);
    float a = 0;
    float b = 0;
    float aa = 0;
    float bb = 0;
    for(int h = 1; h <= 8; h++){
      switch(h){
        case 1:
        a = 0;
        b = - height;
        break;
        case 2:
        a = width;
        b = - height;
        break;
        case 3:
        a = width;
        b = 0;
        break;
        case 4:
        a = width;
        b = height;
        break;
        case 5:
        a = 0;
        b = height;
        break;
        case 6:
        a = - width;
        b = height;
        break;
        case 7:
        a = - width;
        b = 0;
        break;
        case 8:
        a = - width;
        b = - height;
        break;
      }
      if( dist(mouseX-aa,mouseY-bb,loc.x,loc.y) > dist(mouseX-a,mouseY-b,loc.x,loc.y)){ 
        aa = a;
        bb = b;
      //background(255,0,0);
      }
      }
      
      PVector mouse2 = new PVector(mouse.x-aa,mouse.y-bb);
      
      direct = PVector.sub(mouse2,loc);
      direct.normalize();
      direct.mult(pullMouse*pushOrPull);
      
      PVector direct2 = checkOthers();
      direct2.normalize();
      direct2.mult(pullPushOthers*4);
      
      direct.add(direct2);
      
   
    acc = direct;
    
    speed.add(acc);
    speed.limit(maxSpeed);
    loc.add(speed);
    
  }
  
  void display(){
    push();
    float a = atan2(speed.y,speed.x);
    translate(loc.x,loc.y);
    rotate(a+PI/2);
    translate(-loc.x,-loc.y);
    inv[id].show(loc.x,loc.y);
    pop();
    
    
    /*
    stroke(0);
    fill(175);
    //ellipse(loc.x,loc.y,size,size
    push();
    float a = atan2(speed.y,speed.x);
    translate(loc.x,loc.y);
    rotate(a+PI/2);
    translate(-loc.x,-loc.y);
    triangle(loc.x,loc.y-size/2,  loc.x-size/3,loc.y+size/2,  loc.x+size/3,loc.y+size/2);
    pop();
    */
  }
  
  
  PVector checkOthers(){
    PVector v = new PVector(0,0);
  for(int i = 0; i< mov.length; i++){
    if( this.id != i){
    
      if(dist(this.loc.x,this.loc.y,mov[i].loc.x,mov[i].loc.y) < pullPushRadius){
        PVector w = new PVector(  this.loc.x - mov[i].loc.x,   this.loc.y - mov[i].loc.y  );
        w.mult(pullPushRadius/dist(this.loc.x,this.loc.y,mov[i].loc.x,mov[i].loc.y));
        v.add(w);
     }
    }
   }
   return v;
  }
  
  
  void checkEdges(){
    if ( loc.x > width){
      loc.x = 0;
    }
     if ( loc.x < 0){
      loc.x = width;
    }
     if ( loc.y > height){
      loc.y = 0;
    }
     if ( loc.y < 0){
      loc.y = height ;
    }
  }
  
  
}
