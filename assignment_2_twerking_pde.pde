// left/right is all from point of view of viewer, not of robot
// this is run once
void setup() {
  size(400, 400);
  smooth();
  frameRate(30);
}

void draw() 
{
    background(255);
    //translate(50, 50); // place robot so arms are always on screen
    drawRobot();
}

// the twerking robot
void drawRobot() 
{
  noStroke(); // no outline
  fill(#CC00FF);
  translate(200, 75);
  drawNeck();
  drawAntennae();
  drawHead();
  drawLegs();
  drawArms();
  drawAbdomen();
  drawBottom();
  drawFeet();
}

void drawHead() 
{
  fill(#CC00FF);
  noStroke();
  ellipseMode(CENTER);
  ellipse(0, 0, 80, 80);
  drawEyes();
  drawGlasses();
  drawMouth();
}

void drawEyes() 
{
    fill(255); //white
    ellipseMode(CENTER);
    // white part
    ellipse(0, -4, 20, 28);
    // pupil
    fill(0);
    ellipse(0, 0, 16, 17);
}

void drawGlasses() 
{
    noFill();
    stroke(51, 255, 204);
    strokeWeight(5);
    strokeJoin(ROUND);
    rect(-16, -26, 32, 40);
    // temples of glasses
    // left temple
    line(-16, 0, -34, -14);
    // right temple
    line(16, 0, 34, -14);
}

void drawMouth()
{
   stroke(200, 10, 10);
   arc(0, 20, 20, 20, 0.6, PI - 0.6);
}

void drawNeck() 
{
   noStroke();
   fill(#CC00FF);
   rect(-5, 30, 10, 50);
}

void drawAbdomen() 
{
  noStroke();
  fill(#CC00FF);
   // connect to bottom
  rect(-5, 110, 10, 20);
  // abdomen 
  rect(-30, 80, 60, 30);
}

void drawBottom() 
{
   noStroke();
   fill(#CC00FF);
   rect(-40, 120, 80, 40);
}

void drawAntennae()
{
   strokeWeight(4);
   stroke(#FF9933);
   noFill();
   // right antennae
   arc(40, -32, 40, 40, -PI, -0.3);
   noStroke();
   fill(#FF9933);
   ellipse(-60, -30, 15, 15);
   // left antennae
   stroke(#FF9933);
   noFill();
   arc(-40, -32, 40, 40, -PI + 0.3, 0);
   noStroke();
   fill(#FF9933);
   ellipse(60, -30, 15, 15);
}

void drawLegs()
{
  noStroke();
  fill(#440088);
  // left thigh
  rect(-25, 160, 8, 30);
  // left knee
  ellipse(-23, 190, 18, 18);
  // left shin
  stroke(#440088);
  strokeWeight(8);
  line(-23, 190, -15, 215);
  // right thigh
  noStroke();
  rect(17, 160, 8, 30);
  // right knee
  ellipse(21, 190, 18, 18);
  // right shin
  stroke(#440088);
  strokeWeight(8);
  line(20, 190, 15, 215);
}

void drawFeet()
{
  noStroke();
  fill(#440088);
  // left foot
  ellipse(-20, 220, 30, 12);
  // right foot
  ellipse(18, 220, 30, 12);
}

void drawArms() 
{
  stroke(#440088);
  strokeWeight(5);
  // left upper arm
  line(-30, 90, -60, 150);
  // left elbow
  ellipse(-60, 150, 10, 10);
  // left forearm
  line(-60, 150, -50, 180);
  // left hand
  ellipse(-50, 180, 15, 15);
  // right upper arm
  line(30, 90, 60, 150);
  // right elbow
  ellipse(-60, 150, 10, 10);
  // right forearm
  line(60, 150, 50, 180);
  // right hand
  ellipse(50, 180, 15, 15);
}

