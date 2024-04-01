
// currently: make the pees stand in rows of 10x10 under each tower instead of a line that ends up off the screen
// next stage: create a target and start using a mouse pressed/released selector to seelect how many pees are to attack, then have them attack the tower.


int numpees = 0;
int startingpees = 5;
int numbases = 2;
ArrayList<Pee> pees = new ArrayList<Pee>();
ArrayList<Base> bases = new ArrayList<Base>();
int frate = 60;
int[] spawnrate = new int[5];
int counter = 0;


// Pee(float xx, float yy, float vxx, float vyy, int teamm, float sizee, int inbasee, int peanumm) {
void setup() {
  size(700, 450);
  spawnrate[0] = 180;
  spawnrate[1] = 90;
  spawnrate[2] = 60;
  spawnrate[3] = 45;
  spawnrate[4] = 36;
  
  bases.add(new Base(100, 60, 10, startingpees, 1, 1,0));
  bases.add(new Base(600, 60, 10, startingpees, 1, 2,1));
  bases.add(new Base(350, 60, 8, 0, 1, 3,2));
  
  
  //create team 1's pees
  for (int i = 0; i <=  startingpees; i++) {
    pees.add(new Pee(100 + (6 * i), 150, 0, 0, 1, 5,0,numpees));
    numpees++;
  }
  
  // create team 2's pees
  
  for (int i = 0; i <= startingpees; i++) {
    pees.add(new Pee(600 + 6 * i, 150, 0, 0, 2, 5,1,numpees));
    numpees++;
  }
}

void draw() {
  
  // grow the pees in the pods
  for (Base b : bases) {
    println("base: " + b.basenum + " team: " + b.team + " units: " + b.units);
    if (frameCount % spawnrate[4] == 0) {
      b.units++;
      pees.add(new Pee(b.pos.x + 6 * b.units, 180, 0, 0, b.team, 5,b.basenum,numpees));
      numpees++;
    }  
  }
  counter=0;
  // check each pee and get its stats and print it
  for (Pee p : pees) {
    println("count: "+counter+" pee: " + p.peenum + " team: " + p.team + "in base: "+p.inbase+ "x,y: "+p.pos.x+","+p.pos.y);
    counter++;
  }
  
  // main draw loop
  if (frameCount % frate == 0) {
    background(0);
    
    for (Base b : bases) {
      b.show();
    }
    
    for (Pee p : pees) {
      p.show();
    }
  }  
} // end draw




class Base {
  int level;
  int team;
  PVector pos;
  float size;
  int units;
  int basenum;

  Base(float xx, float yy, float sizee, int unitss, int levell, int teamm, int basenumm) {
    level = levell;
    team = teamm;
  
    pos = new PVector(xx,yy);
    size = sizee;
    units = unitss;
    basenum=basenumm;
  }

  public void show() {
    if(team==1) fill(255,0,0);
    if(team==2) fill(0,255,0);
    if(team==3) fill(0,0,255);
    
    rect(pos.x, pos.y, size*4,size*8);
  }
}



class Pee {
  PVector pos;
  PVector vel;
  int team;
  float size;
  int inbase;
  int peenum;
  
  Pee(float xx, float yy, float vxx, float vyy, int teamm, float sizee, int inbasee, int peenumm) {
    
    pos = new PVector(xx,yy);
    vel = new PVector(vxx,vyy);
    team = teamm;
    size = sizee;
    inbase = inbasee;
    peenum = peenumm;
  }
  
  public void show() {
    if (team ==  1) fill(255,0,0);
    if (team ==  2) fill(0,255,0);
    if (team ==  3) fill(0,0,255);
    circle(pos.x, pos.y, size);
  }
  
  public void sort() {
    
    
  }
}


