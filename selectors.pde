float r = 32;
float g = 32;
float b = 32;
float startx;
float starty;
float endx;
float endy;
boolean dragging = false;
ArrayList<Selector> selectors = new ArrayList<Selector>();

void setup() {
  size(300, 300);
}

void draw() {
//  background(256);
  if (dragging) {
    fill(255,255,255);
    line(startx,starty,mouseX,starty);
    line(startx,starty,startx,mouseY);
    line(mouseX,starty,mouseX,mouseY);
    line(startx,mouseY,mouseX,mouseY);
  }

  for (Selector s : selectors) {
   s.show();
  }
}

void mousePressed() {
  circle(mouseX,mouseY,5);
  startx = mouseX;
  starty = mouseY;
}

void mouseReleased() {

  dragging = false;
  endx = mouseX;
  endy = mouseY;
  selectors.add(new Selector(startx,starty,endx,endy));
  background(0);
}

void mouseDragged() {
  dragging = true;
}

class Selector {

  float x1,x2,y1,y2,xs,ys;
  Selector(float x11,float y11,float x22,float y22){
    x1=x11;
    y1=y11;
    x2=x22;
    y2=y22;
    xs=x22-x11;
    ys=y22-y11;
  }

  public void show() {
    rect(x1,y1,xs,ys);
  }
}
