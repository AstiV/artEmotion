class Circle {
  
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

  // --------------------------------
  // Constructor
  // --------------------------------

  Circle() {
    circleColor = color(59,31,43);
  
  
    // Initially position circle randomly
    circleX = random(width);
    circleY = random(height);
  
    // Initially position circle in center of screen
    // circleX = width/2+circleSize/2+10;
    // circleY = height/2;
  
    ellipseMode(CENTER);
  
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

  // -------------------------------------------
  // Stop circle (for dragging)
  // -------------------------------------------

  void stopCircle() {
    circleX = 0;
    circleY = 0;
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

  //-------------------------------------------------
  // Make circle grow after being released from drag
  //-------------------------------------------------

  void circleGrow() {
    circleSize = circleSize+0.15;
  }
  
}
