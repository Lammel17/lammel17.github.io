class ParticleSystem{
  ArrayList<Particle> parts;
  PVector origin;
  int counter =0;
  
  ParticleSystem(PVector origin){
     this.origin = origin;
     parts = new ArrayList<Particle>(); 
  }
  
  void addParticle(){

      for(int i = 0; i < 5; i++){
    parts.add(new Particle(new PVector(origin.x,origin.y))); 
    counter = 0;
      }
    

  }
  
  void run(PVector windDir){
  addParticle();
  Iterator<Particle> it = parts.iterator();
  while(it.hasNext()){
   Particle p = it.next();
   p.run(windDir);
   if( p.isDead()){
     it.remove();
   }
 }
  }
  
  
}
