// left/right is all from point of view of viewer, not of robot
// this is run once

// for twerking bottom
int bottomAngle = 0;
int bottomAngleChange = 3;

// shins
float shinAngle = 0; // also affects thigh
// move in opposite direction
float shinAngleChange = 0.5;

// thighs
float thighAngle = 0;
float thighAngleChange = 0.75;

// upper arms
float upperArmAngle = 0; // also affects forearm/hand
float upperArmAngleChange = 0.15;


// time that's passed
final float FRAME_RATE = 30;
final float FRAMES_IN_LOOP = 30 * 10;

// returns where at in loop in seconds
float timeInLoop()
{
  return (frameCount % FRAMES_IN_LOOP) / FRAME_RATE;
}

float frameInLoop()
{
  return frameCount % FRAMES_IN_LOOP;
}

void setup() {
  size(400, 400);
  smooth();
  frameRate(FRAME_RATE);
}

void draw() 
{
    background(255);
    fill(0);
    drawRobot();
}

// the twerking robot
void drawRobot() 
{
  noStroke(); // no outline
  fill(#CC00FF);
  translate(200, 75);
  
  pushMatrix();
  translateForSquat();
  drawNeck();
  drawAntennae();
  drawHead();
  drawBreast();
  popMatrix();
  
  drawLegs();
  
  drawBottom();
  
  pushMatrix();
  translateForSquat();
  drawArms();
  popMatrix();
  drawFeet();
}

void translateForSquat() 
{
  if (frameInLoop() < 40) 
  {
    translate(0, (frameInLoop() * 0.8));
  }
  else if (frameInLoop() > 260)
  {
    translate(0, 40 * 0.8 - ((frameInLoop() - 260) * 0.8));
  }
  else
  {
    translate(0, 40 * 0.8);
  }
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
   stroke(#CC00FF);
   strokeWeight(6);
   line(0, 30, 0, 100);
}

void drawBreast() 
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
  pushMatrix();
  if (frameInLoop() < 40) 
  {
    translate(0, (frameInLoop() * 0.8));
  }
  else if (frameInLoop() > 260)
  {
    translate(0, 40 * 0.8 - ((frameInLoop() - 260) * 0.8));
  }
  else
  {
    translate(0, 40 * 0.8);
  }
  bottomAngle += bottomAngleChange;
  pushMatrix();
  fill(0);
  if (bottomAngle > 20 || bottomAngle < -20) //|| bottomAngle < 30)
  {
    bottomAngleChange = -bottomAngleChange;
    bottomAngle += bottomAngleChange;
  }
   noStroke();
   fill(#CC00FF);
   translate(0, 120);
   //rotate(radians(bottomAngle));
   rect(-45, 0, 90, 50);
   popMatrix();
   popMatrix();
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
  stroke(#440088);
  strokeWeight(8);
  fill(#440088);
  
  if (shinAngle < 0)
  {
    shinAngle = 0;
    thighAngle = 0;
  }
  else if (frameInLoop() < 40) 
  {
  shinAngle += shinAngleChange;
  thighAngle += thighAngleChange;
  }
  else if (frameInLoop() > 260)
  {
    shinAngle -= shinAngleChange;
    thighAngle -= thighAngleChange;
  }

  pushMatrix();
  
  // left leg
  pushMatrix();
  
  translate(-15, 250);
  rotate(radians(-shinAngle));
  stroke(#440088);
  strokeWeight(8);
  line(-10, -30, 0, 0);
  // left thigh
  pushMatrix();
  translate(-10, -40);
  rotate(radians(thighAngle));  
  line(0, 0, 5, -50);
  popMatrix();
  // left knee
  noStroke();
  ellipse(-10, -32, 18, 18);
  
  popMatrix();

  // right shin
  pushMatrix();
  
  translate(15, 250);
  rotate(radians(shinAngle));
  stroke(#440088);
  strokeWeight(8);
  line(10, -30, 0, 0);
  // right thigh
  pushMatrix();
  translate(10, -40);
  rotate(radians(-thighAngle));
  line(0, 0, -5, -50);
  popMatrix();
  // right knee
  noStroke();
  ellipse(10, -32, 18, 18);
  
  popMatrix();
  
  popMatrix();
}

void drawFeet()
{
  noStroke();
  fill(#440088);
  // left foot
  ellipse(-20, 250, 30, 12);
  // right foot
  ellipse(18, 250, 30, 12);
}

void drawArms() 
{
  stroke(#440088);
  fill(#440088);
  strokeWeight(5);
  
  if (upperArmAngle < 0) {
    upperArmAngle = 0;
  }
  else if (frameInLoop() < 40) 
  {
    upperArmAngle += upperArmAngleChange;
  }
  else if (frameInLoop() > 260 && upperArmAngle > 0)
  {
    upperArmAngle -= upperArmAngleChange;
  }
  
  pushMatrix();
  // left upper arm
  pushMatrix();
  translate(-30, 90);
  rotate(radians(upperArmAngle));
  line(0, 0, -30, 60);
  popMatrix();
  // left elbow
  ellipse(-60, 150, 10, 10);
  // left forearm
  line(-60, 150, -50, 180);
  
  
  // right upper arm
  pushMatrix();
  translate(30, 90);
  rotate(radians(-upperArmAngle));
  line(0, 0, 30, 60);
  popMatrix();
  // right elbow
  ellipse(60, 150, 10, 10);
  // right forearm
  line(60, 150, 50, 180);
  // left hand
  fill(#FF00CC);
  noStroke();
  ellipse(-50, 180, 18, 18);
  // right hand
  ellipse(50, 180, 18, 18);
  popMatrix();
}

