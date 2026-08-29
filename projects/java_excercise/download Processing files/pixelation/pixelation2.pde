PImage img;
int d = 80;
float save = d;
float factor = 1 - 0.052;  // - 0.052;
float varianz = 0.02;    //0.02;

void setup(){
  img = loadImage("medis.png");
  size(1416,1015);
  background(0);
  
  for(int x=0 ; x<width ; x++){     //bei factor=1 dann einfach x=x
     for(int y=0 ; y<height ; y++){   //bei faktor=1-0.052 dann x++
         int loc = x+y*width;
         
         //int loc2 = x+d+y*width;
         //int loc3 = x+y*width+width;
         //float deff = abs(brightness(img.pixels[loc])-brightness(img.pixels[loc2]));
         //float deff2 = abs(brightness(img.pixels[loc])-brightness(img.pixels[loc3]));
         //float deff3 = abs(hue(img.pixels[loc])-hue(img.pixels[loc2]));
         //float deff4 = abs(hue(img.pixels[loc])-hue(img.pixels[loc3]));
         
        
         color c = color(img.pixels[loc]);
         fill(c);
         noStroke();
         ellipseMode(LEFT);
         ellipse(x,y,d,d);
         
         square(x,y,d);
         //if(deff> 40 || deff2 >40 || deff3 > 70 || deff4 > 70){
         //fill(0,255,0);
         //ellipse(x,y,d,d);
         //}
         
         float yy = y + d-d*varianz;
         y = (int)yy;
       }
       float xx = x + d-d*varianz;
       x = (int)xx;
       
       save = save * factor;
       if(save<=1){
       save = 1;
       }
      d = (int)save;
  }
  //mousePressed();
}

  

//void mousePressed() { 
//saveFrame("output-####.png"); 
//}
