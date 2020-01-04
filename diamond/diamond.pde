int counter;
int total;
boolean record;
float percent;

void setup() {  
  size(480, 480, P3D);
  counter = 0;
  total = 240;
  record = false;
  percent = 0;
}        
void draw() {
  if (record) {
    percent = float(counter) / total;
    if (counter == total-1){
      exit();
    }
  } else {
    percent = float(counter % total) / total;
  }
  render(map(percent,0, 1, 0, TWO_PI));
  counter++;
  if (record){
    saveFrame("output/gif-" + counter + ".png");
  }
}

void render(float percent){
  if (percent <= TWO_PI){
    textSize(32);
    textMode(SHAPE);
    stroke(150, 0, 50);
    text("LOOP", 0, 0);
  }
  translate(width/2, width/2);
  ambientLight(5,0,15);
  directionalLight(50,0,150,0,0,-1);
  rotateX(-PI/2);
  rotateY(PI/2);
  background(0);  
  fill(255); 
  strokeWeight(8);
  stroke(150, 0, 50);
  ellipseMode(CENTER);
  rectMode(CENTER);
  rotateX(percent);
  for (float a = 0;a < 8;a += 1){
    rotateX(PI / 8);
    push();
    rotateX(PI/4);
    rotateZ(PI/4);
    rect(0, 0, width/2, height/2);
    pop();
  }
  rotateY(-PI/2);
  float r = sqrt(pow(width/2, 2) + pow(height/2, 2));
  ellipse(0, 0, r, r);
}
