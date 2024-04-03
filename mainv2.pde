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

float r = 32;
float g = 32;
float b = 32;
float startx;
float starty;
float endx;
float endy;
boolean dragging = false;
int scount = 0;
ArrayList<Selector> selectors = new ArrayList<Selector>();

int units = 99;
PVector[] spots = new PVector[100];




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
  
  println("there are "+bases.size()+" bases. base 0 has "+bases.get(0).units+" units");
  
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
  
  for (int i = 0;i < 100;i++) {
    // create the spots in formation array
    spots[i] = new PVector((i % 8) * 6,(int)(i / 8) * 6);
  }
}

void draw() {
  
  // grow the pees in the pods
  for (Base b : bases) {
    // println("base: " + b.basenum + " team: " + b.team + " units: " + b.units);
    if (frameCount % spawnrate[4] == 0) {
      b.units++;
      pees.add(new Pee(b.pos.x + 6 * b.units, 180, 0, 0, b.team, 5,b.basenum,numpees));
      numpees++;
    }  
  }
  counter = 0;
  // check each pee and get its stats and print it
  for (Pee p : pees) {
    //println("count: " + counter + " pee: " + p.peenum + " team: " + p.team + "in base: " + p.inbase + "x,y: " + p.pos.x + "," + p.pos.y);
    counter++;
  }
  
  // update the positions of the pees, base by base
  
  // main draw loop
  
  background(0);
  
  for (Base b : bases) {
    b.show();

  }
  
  for (Pee p : pees) {
    p.moveTo(100,100);
    p.show();
    
  }
  
  for (Selector s : selectors) {
    s.show();
  }

  if (frameCount%120==0){
    for (int i=0;i<20;i++){
      println("");
    }
    println("there are "+bases.size()+" bases. base 0 has "+bases.get(0).units+" units");
    println("there are "+bases.size()+" bases. base 1 has "+bases.get(1).units+" units");
    println("there are "+bases.size()+" bases. base 2 has "+bases.get(2).units+" units");
  }
} // end draw



void mousePressed() {
  // circle(mouseX,mouseY,5);
  startx = mouseX;
  starty = mouseY;
}

void mouseReleased() {
  
  dragging = false;
  endx = mouseX;
  endy = mouseY;
  selectors.add(new Selector(startx,starty,endx,endy));
  scount++;
  background(0);
  println("there are now " + scount + " selectors selected");
}

void mouseDragged() {
  background(0);
  fill(0);
  for (Selector s : selectors) {
    s.show();
  }
  stroke(0,255,0);
  strokeWeight(4);
  line(startx,starty,mouseX,starty);
  line(startx,starty,startx,mouseY);
  line(mouseX,starty,mouseX,mouseY);
  line(startx,mouseY,mouseX,mouseY);
}

// end of main program. classes Pee Base Selector to follow
//




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
    basenum = basenumm;
  }
  
  public void show() {
    if (team ==  1) fill(255,0,0);
    if (team ==  2) fill(0,255,0);
    if (team ==  3) fill(0,0,255);
    
    rect(pos.x, pos.y, size * 4,size * 8);
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
  
  public void moveTo(float nxx, float nyy) {
    this.pos.x=nxx;
    this.pos.y=nyy;
  }
    
  
} // end pee

class Selector {
  
  float x1,x2,y1,y2,xs,ys;
  Selector(float x11,float y11,float x22,float y22) {
    x1 = x11;
    y1 = y11;
    x2 = x22;
    y2 = y22;
    xs = x22 - x11;
    ys = y22 - y11;
  }
  
  public void show() {
    fill(0);
    stroke(255);
    strokeWeight(1);
    rect(x1,y1,xs,ys);
  }
}


