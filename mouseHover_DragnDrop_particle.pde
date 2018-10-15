Circle c;

void setup() {
  size(650, 750);
  c = new Circle();
}

void draw() { 
  
  // Draw stuff
  background(51,52,89);
  c.displayCircle();
  c.moveCircle();
  c.checkBorders();
  
  // Logic
  c.update(mouseX, mouseY);
  
      // Change color on hover (to test if mouse-circle relationship is checked)
    if (c.circleOver) {
      c.strokeColor = color(95,117,142);
      c.circleColor = color(95,117,142);
    } else {
      c.strokeColor = color(59,31,43);
      c.circleColor = color(59,31,43);
    }
  
    // Make circle grow after being released from drag
    if(c.released) {
      if(c.circleSize < 100) {
        c.circleGrow();
      }
    }
}

// --------------------------------
// Click on Circle and Drag it
// --------------------------------

void mousePressed() {
  if(c.circleOver) { 
    c.locked = true; 
    fill(255, 255, 255);
  } else {
    c.locked = false;
  }
  c.xOffset = mouseX-c.circleX; 
  c.yOffset = mouseY-c.circleY; 
}

void mouseDragged() {
  if(c.locked) {
    c.circleX = mouseX-c.xOffset; 
    c.circleY = mouseY-c.yOffset;
  }
}

void mouseReleased() {
  c.locked = false;
  c.released = true;
}
  
