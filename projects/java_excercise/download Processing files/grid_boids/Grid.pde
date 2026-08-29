class Grid{
  PVector xy;
  PVector direction;
  float rotation;
  
  Grid(PVector xy){
   this.xy = xy; 
   direction = new PVector();
   rotation = radians(map(this.xy.x-this.xy.y,-height,width,0,360));
   
    if(xy.x < width/gridSegments){
     direction.add(1,0);
   } else if(xy.x > width - width/gridSegments){
     direction.add(-1,0);
   } else if(xy.y < height/gridSegments){
     direction.add(0,1);
   } else if(xy.y > height - height/gridSegments){
     direction.add(0,-1);
   } else {
   direction.y = -sin(sin(rotation)*2.9);
   direction.x = -cos(sin(rotation)*2.9);
   }
   direction.normalize();
      direction.setMag(30);
   
  }
  



 void showDirectionGrid(){
    
   push();
   translate(this.xy.x,this.xy.y);
   push();
   if(xy.x < width/gridSegments){
     rotate(radians(180));
   } else if(xy.x > width - width/gridSegments){
     rotate(radians(0));
   } else if(xy.y < height/gridSegments){
     rotate(radians(270));
   } else if(xy.y > height - height/gridSegments){
     rotate(radians(90));
   } else {
   rotate(sin(rotation)*2.9);

 }
   drawArrow();
   pop();
   stroke(255,0,0);
   strokeWeight(2);
   //line(0,0,direction.x,direction.y);
   pop();
 }
 
 
void  drawArrow(){
   stroke(255);
   strokeWeight(2);
   line(10,0,-10,0);
   triangle(-7,-2,-7,2,-12,0);
 }
}
