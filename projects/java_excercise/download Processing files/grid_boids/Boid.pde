class Boids{
  PVector loc;
  PVector vel;
  PVector acc;
  float maxSpeed = 4.3;
  float maxAcc = 0.12;
  float id;
    PVector dirAcc;
    int size = 30;
  
  Boids(int id){
    this.loc = new PVector(random(width)+width,random(height));
    this.vel = new PVector(random(-1,1),random(-1,1));
    this.vel.normalize();
    this.vel.mult(random(2,4));
    this.acc = new PVector(0,0);
    this.id = id;
    this.dirAcc = new PVector();
  }
  
  void flock(ArrayList<Boids> flo, ArrayList<Grid> grid){

    fieldForce(grid, 1);
    
    PVector repull = checkOthers(flo, 50, 20);

    
    acc.add(dirAcc);
    acc.add(repull);
    acc.setMag(maxAcc);
    
  }
  
  void update(){
    loc.add(vel);      //reihenfolge?
    acc.setMag(maxAcc);
    vel.add(acc);
    vel.limit(maxSpeed);
    
    acc.mult(0);
    
  }
  
  void show(){
   push();
   float a = atan2(vel.y,vel.x);
   strokeWeight(0);
   fill(255,0,0);
   translate(loc.x,loc.y);
   rotate(a+PI/2);
   translate(-loc.x,-loc.y);
   triangle(loc.x,loc.y-size/2,  loc.x-size/3,loc.y+size/2,  loc.x+size/3,loc.y+size/2);
   pop();
  }
  
  void fieldForce(ArrayList<Grid> grid, float fieldForce){
    if(loc.x < 0 && loc.y < 0   || loc.x > width && loc.y < 0  || loc.x > width && loc.y > height  || loc.x < 0 && loc.y > height  ){
      dirAcc = new PVector(width/2-loc.x,height/2-loc.y);
    } else if(loc.x > 0 && loc.y > 0 && loc.x < width && loc.y < height){
      for(Grid g: grid){
         if( dist(loc.x,loc.y, g.xy.x, g.xy.y) < (width/gridSegments)/2){
           dirAcc = new PVector(g.direction.x,g.direction.y);
         }
      }
    }
    dirAcc.setMag(fieldForce);
  }
  
  

  PVector checkOthers(ArrayList<Boids> flo, int r, float velForce){
    PVector v = new PVector();
    float radius = r;
    int count = 0;
    
  for(Boids other: flo){
    if(dist(this.loc.x,this.loc.y,other.loc.x,other.loc.y) < radius && this.id != other.id){
      PVector w = new PVector(  this.loc.x - other.loc.x,   this.loc.y - other.loc.y  );
      w.setMag(maxSpeed);
      w.div(radius);
      w.mult(radius/dist(this.loc.x,this.loc.y,other.loc.x,other.loc.y)+1);  //radius oder maxSpeed?
      v.add(w);
      count++;
     }   
   }
   if(count > 0){
   //v.div(count);
   //v.sub(this.acc);
   v.setMag(velForce);           //maxSpeed
   v.sub(vel);
   v.limit(maxAcc);
   }
   return v;
  }
  
  
  
  
  
}
