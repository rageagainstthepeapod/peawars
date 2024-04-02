ArrayList<Integer> keys = new ArrayList<Integer>();

PVector pos;
int radius = 15;

void setup() {
  size(600, 600);
  pos = new PVector(width/2, height/2);
}

void draw() {
  background(0);

  controls();

  noStroke();
  circle(pos.x, pos.y, radius*2);
}

void controls() {
  int speed = 5;
  if (keys.contains(UP)) pos.add(new PVector(0, -speed));
  if (keys.contains(DOWN)) pos.add(new PVector(0, speed));
  if (keys.contains(LEFT)) pos.add(new PVector(-speed, 0));
  if (keys.contains(RIGHT)) pos.add(new PVector(speed, 0));

  //if space pressed
  if (keys.contains(32)) { // keycode for space
    fill(255, 0, 0);
  } else fill(255);

  pos.x = constrain(pos.x, radius, width-radius);
  pos.y = constrain(pos.y, radius, height-radius);
}

void keyPressed() {
  //println(keyCode); use this to find the specific key code you want
  if (!keys.contains(keyCode)) keys.add(keyCode);
}

void keyReleased() {
  keys.remove(keys.indexOf((keyCode)));
}