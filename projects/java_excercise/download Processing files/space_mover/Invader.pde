class Invader{
     int size;
   PImage img;
   color[] col = new int[6];
   int id;
   int colo;
   
  Invader(int size, int id, int colo) {
    this.size = size;
    this.id = id;
    this.colo = colo;
    img = createInvader(7);

}

    void show(float x, float y){
    image(img,x,y,size,size);
    
  }


  
  
   PImage createInvader(int invaderSize){
    PImage imgInvader = createImage(invaderSize, invaderSize, ARGB);
      setColors();
      
      int symmetricColumnCount = imgInvader.width;
      for(int y = 0; y< imgInvader.height; y++){
      for(int x = symmetricColumnCount; x > symmetricColumnCount-y; x--){    // x > 0
      color c = col[(int)random(0,5)];
      imgInvader.set(x,y,c);
      imgInvader.set(invaderSize -1 - x, y, c);
  }
    if (0 != float(invaderSize) % 2) {
      imgInvader.set(invaderSize/2, y, col[(int)random(0,5)]);
    }

}
  return imgInvader;
  }
  
  
  
  
   void setColors(){ 
  if(oneColorOnly == true){
  col[0] = color(random(colo,colo+65),random(0,10),random(150,245));    //
  col[1] = color(random(colo,colo+65),random(0,10),random(150,245));    //
  col[2] = color(random(colo,colo+65),random(230,230),random(200,255));
     } else {
  col[0] = color(random(0),random(0,10),random(150,245));    //
  col[1] = color(random(0),random(0,10),random(150,245));    //
  col[2] = color(random(255),random(230,230),random(200,255));
     }
  col[3] = color(0,0,0,0);
  col[4] = color(0,0,0,0);
  col[5] = color(0,0,0,0);
}
  
  
}
