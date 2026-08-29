ArrayList<Grid> grid;
int gridSegments = 30;

ArrayList<Boids> flock;
int maxBoids = 200;

float extraRotation = 0;


void setup(){
 size(1200,1200,P2D);
 //((PGraphicsOpenGL)g).textureSampling( 3 ); // for no smooth in P2D
 frameRate(30);
 //pixelDensity(displayDensity());
 grid = new ArrayList<Grid>();
 createDirectionGrid();
 
  flock = new ArrayList<Boids>();
  for(int i = 0; i < maxBoids; i++){
  flock.add(new Boids(i));
  }
}

void draw(){
 background(0);
 
 for(Grid g: grid){
    g.showDirectionGrid(); 
 }
 
  for(Boids bb: flock){
   bb.flock(flock, grid);
   bb.update();
   bb.show();
 }
 extraRotation = 0;
}

void createDirectionGrid(){
  for (int y = (height/gridSegments)/2; y < height; y+= height/gridSegments){
    for (int x = (width/gridSegments)/2; x < width; x+= width/gridSegments){
      grid.add(new Grid(new PVector(x,y)));
      
  }}
}

void mousePressed(){
  for(Grid g: grid){
   g.rotation += radians(5);
   g.direction.y = -sin(sin(g.rotation)*2.9);
   g.direction.x = -cos(sin(g.rotation)*2.9);
   g.direction.normalize();
   g.direction.setMag(30);
 }
}
