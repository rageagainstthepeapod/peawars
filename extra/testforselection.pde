float r = 32;
float g = 32;
float b = 32;
float startx;
float starty;
float endx;
float endy;
boolean dragging = false;

void setup() {
  size(300, 300);
}

void draw() {
  background(r, g, b);
  if (dragging) {
    line(startx,starty,mouseX,starty);
    line(startx,starty,startx,mouseY);
    line(mouseX,starty,mouseX,mouseY);
    line(startx,mouseY,mouseX,mouseY);
  }
}

void mousePressed() {
  r = 0;
  g = 255;
  b = 0;
  circle(mouseX,mouseY,5);
  startx = mouseX;
  starty = mouseY;
}

void mouseReleased() {
  r = 255;
  g = 255;
  b = 0;
  dragging = false;
}

void mouseDragged() {
  dragging = true;
  r = 0;
  g = 0;
  b = 255;
}
