// Position and Size of Circle
float circleX, circleY;  // Position of circle
float circleSize = 50.0;   // Diameter of circle

float xOffset = 0.0; 
float yOffset = 0.0;

// Speed of Movement
float xSpeed = 3.0;
float ySpeed = 2.3;

// Color
color circleColor;
color strokeColor;

// States
boolean circleOver = false;
boolean locked = false;
boolean released = false;


void setup() {
  size(650, 750); 
  circleColor = color(59,31,43);
  
  
  // Initially position circle randomly
  circleX = random(width);
  circleY = random(height);
  
  // Initially position circle in center of screen
  // circleX = width/2+circleSize/2+10;
  // circleY = height/2;
  
  ellipseMode(CENTER);
}

void draw() { 
  
  // Draw stuff
  background(51,52,89);
  displayCircle();
  moveCircle();
  checkBorders();
  
  // Logic
  update(mouseX, mouseY);
  
  // Change color on hover (to test if mouse-circle relationship is checked)
  if (circleOver) {
    strokeColor = color(95,117,142);
    circleColor = color(95,117,142);
  } else {
    strokeColor = color(59,31,43);
    circleColor = color(59,31,43);
  }
  
  // Make circle grow after being released from drag
  if(released) {
    if(circleSize < 100) {
      circleGrow();
    }
  }
}

// --------------------------------
// Display circle
// --------------------------------

void displayCircle(){
  stroke(strokeColor);
  fill(circleColor);
  ellipse(circleX, circleY, circleSize, circleSize);
}

// -------------------------------------------
// Move circle by adding to it's coordinates
// -------------------------------------------

void moveCircle() {
  circleX = circleX + xSpeed;
  circleY = circleY + ySpeed;
}

// ---------------------------------------------------------
// Check if circle touches borders, if yes change direction
// ---------------------------------------------------------

void checkBorders() {
  // (https://www.youtube.com/watch?v=YIKRXl3wH8Y&index=5&list=PLRqwX-V7Uu6YqykuLs00261JCqnL_NNZ_)
  if (circleX > width || circleX < 0 ) {
    xSpeed = xSpeed * -1; 
  } else if (circleY > height || circleY < 0) {
    ySpeed = ySpeed * -1;
  }
}

// --------------------------------
// Check if mouse is over circle
// --------------------------------

void update(int x, int y) {
  if( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
  }
  else {
    circleOver = false;
  }
}

boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

// --------------------------------
// Click on Circle and Drag it
// --------------------------------

void mousePressed() {
  if(circleOver) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-circleX; 
  yOffset = mouseY-circleY; 

}

void mouseDragged() {
  if(locked) {
    circleX = mouseX-xOffset; 
    circleY = mouseY-yOffset;
  }
}

void mouseReleased() {
  locked = false;
  released = true;
}

//-------------------------------------------------
// Make circle grow after being released from drag
//-------------------------------------------------

void circleGrow() {
  circleSize = circleSize+0.15;
}
