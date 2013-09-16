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

// forearms
float forearmAngle = 0;
float forearmAngleChange = 0.75;

// sun
float sunAngle = 0;
float sunAngleChange = 0.3;
float moonAngle = 0;
float moonAngleChange = 0.3;

// for tracking
float robotX = 200;
float robotY = 75;

// time that's passed
final float FRAME_RATE = 80;
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

float loopNumber()
{
  return frameCount / FRAMES_IN_LOOP;
}

void setup() {
  size(700, 400);
  smooth();
  frameRate(FRAME_RATE);
}

void draw() 
{
    drawBackground();
    drawRobot();
}

void drawBackground() 
{
  drawSky();
 
  drawSunOrMoon();
  
  fill(0, 130, 0);
  rect(0, 250, width, 400);
}

void drawSky()
{
  int skyRed = 0;
  int skyGreen = 0;
  int skyBlue = 0;
  
  if (loopNumber() % 4 < 1)
  {
   skyRed =  25 + floor(frameCount % FRAMES_IN_LOOP * (25 / FRAMES_IN_LOOP));
   skyGreen = 75 + floor(frameCount % FRAMES_IN_LOOP * (75 / FRAMES_IN_LOOP));
   skyBlue = 125 + floor(frameCount % FRAMES_IN_LOOP * (125 / FRAMES_IN_LOOP));
  }
  else if (loopNumber() % 4 < 2)
  {
   skyRed =  floor(50 - frameCount % FRAMES_IN_LOOP * (25 / FRAMES_IN_LOOP));
   skyGreen = floor(150 - frameCount % FRAMES_IN_LOOP * (75 / FRAMES_IN_LOOP));
   skyBlue = floor(250 - frameCount % FRAMES_IN_LOOP * (125 / FRAMES_IN_LOOP));
  }
  else if (loopNumber() % 4 < 3) 
  {
   skyRed =  25 - floor(frameCount % FRAMES_IN_LOOP * (25 / FRAMES_IN_LOOP));
   skyGreen = 75 - floor(frameCount % FRAMES_IN_LOOP * (75 / FRAMES_IN_LOOP));
   skyBlue = 125 - floor(frameCount % FRAMES_IN_LOOP * (125 / FRAMES_IN_LOOP));
  }
  else
  {
   skyRed =  floor(frameCount % FRAMES_IN_LOOP * (25 / FRAMES_IN_LOOP));
   skyGreen = floor(frameCount % FRAMES_IN_LOOP * (75 / FRAMES_IN_LOOP));
   skyBlue = floor(frameCount % FRAMES_IN_LOOP * (125 / FRAMES_IN_LOOP));
  }
  background(skyRed, skyGreen, skyBlue);
}

void drawSunOrMoon() 
{
  pushMatrix();
  translate(100, 0);
  if (loopNumber() % 4 < 2)
  {
    sunAngle += sunAngleChange;
    moonAngle = 0;
  }
  else {
    sunAngle = 0;
    moonAngle += moonAngleChange;
  }
  fill(255, 255, 100);
  
  pushMatrix();
  translate(260, 340);
  rotate(radians(sunAngle + 90));
  ellipse(0, 300, 45, 45);
  popMatrix();
  
  pushMatrix();
  fill(250);
  translate(220, 340);
  rotate(radians(moonAngle + 90));
  //ellipse(0, 200, 40, 40);
  arc(0, 300, 30, 30, 0, PI, CHORD);
  popMatrix();
  popMatrix();
}

// the twerking robot
void drawRobot() 
{
  noStroke(); // no outline
  fill(#CC00FF);  
  // translate up/down bc of mouse
  if (mouseY < robotY + 260 )
  {
    robotY -= 1;
  }
  else if (mouseY > robotY + 260)
  {
    robotY += 1;
  }
  
  // translate left/right bc of mouse
  if (mouseX < robotX + 1)
  {
    robotX -= 1;
  }
  else if (mouseX > robotX + 1)
  {
    robotX += 1;
  }

  translate(robotX, robotY);
  
  
  
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
    
  if (frameInLoop() < 40 || frameInLoop() > 260)
  {
    bottomAngle = 0;
  }
  if (bottomAngle > 20 || bottomAngle < -20) //|| bottomAngle < 30)
  {
    bottomAngleChange = -bottomAngleChange;
    bottomAngle += bottomAngleChange;
  }
   noStroke();
   fill(#CC00FF);
   translate(0, 120);
   rotate(radians(bottomAngle));
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
    forearmAngle = 0;
  }
  else if (frameInLoop() < 40) 
  {
    upperArmAngle += upperArmAngleChange;
    forearmAngle += forearmAngleChange;
  }
  else if (frameInLoop() > 260 && upperArmAngle > 0)
  {
    upperArmAngle -= upperArmAngleChange;
    forearmAngle -= forearmAngleChange;
  }
  
  pushMatrix();
  // left  arm
  pushMatrix();
  translate(-30, 90);
  rotate(radians(upperArmAngle));
  // upper arm
  line(0, 0, -30, 60);
  // left elbow
  ellipse(-30, 60, 10, 10);
  pushMatrix();
  translate(-30, 60);
  rotate(radians(-forearmAngle));
  // left forearm
  line(0, 0, 10, 30);
  // left hand
  fill(#FF00CC);
  noStroke();
  ellipse(10, 30, 18, 18);
  popMatrix();
  popMatrix();
  
  stroke(#440088);
  fill(#440088);
  strokeWeight(5);
  
  // right upper arm
  pushMatrix();
  translate(30, 90);
  rotate(radians(-upperArmAngle));
  line(0, 0, 30, 60);
  // right elbow
  ellipse(30, 60, 10, 10);
  pushMatrix();
  translate(30, 60);
  rotate(radians(forearmAngle));
  // right forearm
  line(0, 0, -10, 30);
  // right hand
  fill(#FF00CC);
  noStroke();
  ellipse(-10, 30, 18, 18);
  popMatrix();
  popMatrix();
  
  popMatrix();
}

