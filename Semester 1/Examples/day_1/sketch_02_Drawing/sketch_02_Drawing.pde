void setup(){
  // Define the size of our window to 500px x 500px
  size(500,260);
  // Set a white background
  background(255);
  
  // Draw a black rectangle with red borders
  fill(0);
  stroke(255, 0, 0);
  rect(20, 20, 100, 100);
  
  // Draw another rectangle with thicker border
  strokeWeight(5);
  rect(140, 20, 100, 100);
  
  // Draw a red ellipse with no borders
  noStroke();
  fill(255, 0, 0);
  ellipse(320, 70, 100, 100);
  
  // Draw an ellipse with the width smaller than height
  ellipse(425, 70, 50, 100);
  
  // Draw a point
  stroke(0);
  strokeWeight(3);
  point(70, 190);
  
  // Draw a line
  line(140, 240, 240, 140);
  
  // draw a complex arc group
  noFill();
  strokeWeight(1);
  arc(310, 190, 100, 100, 0, HALF_PI);
  arc(310, 190, 80, 80, HALF_PI, PI);
  arc(310, 190, 70, 70, PI, PI+QUARTER_PI);
  arc(310, 190, 50, 50, PI+QUARTER_PI, TWO_PI);
}

void draw(){
  
}
