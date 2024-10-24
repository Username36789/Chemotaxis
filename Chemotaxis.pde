Bacteria[] bacteriaArray;  // Array to store multiple bacteria
int numBacteria = 200;     // # of bacteria

void setup() {
  size(800, 600);
  bacteriaArray = new Bacteria[numBacteria];
  
  for (int i = 0; i < bacteriaArray.length; i++) {
    bacteriaArray[i] = new Bacteria();
  }
}

void draw() {
  background(255);
  
  //display and move
  for (int i = 0; i < bacteriaArray.length; i++) {
    bacteriaArray[i].move();
    bacteriaArray[i].show();
  }
}

class Bacteria {
  int x, y;
  int col;
  
  Bacteria() {
    x = width / 2;
    y = height / 2;
    //x = (int)(Math.random() * 400) + 100;
    //y = (int)(Math.random() * 400) + 100;
    col = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
  }
  
  void move() {
    float biasX = (mouseX - x) * 0.01;  // bias towards the mouse
    float biasY = (mouseY - y) * 0.01;  // bias towards the mouse
    
    //float biasX = (mouseX - x);
    //float biasY = (mouseY - y);
    
    // If the left mouse button is pressed, bacteria move toward mouse
    if (mousePressed && mouseButton == LEFT) {
      x += (int)(Math.random() * 5 - 2 + biasX);
      y += (int)(Math.random() * 5 - 2 + biasY);
    }
    // If the right mouse button is pressed, bacteria move away from mouse
    else if (mousePressed && mouseButton == RIGHT) {
      x += (int)(Math.random() * 5 - 2 - biasX);
      y += (int)(Math.random() * 5 - 2 - biasY);
    }
    // if no mouse button is pressed
    else {
      x += (int)(Math.random() * 5) - 2;
      y += (int)(Math.random() * 5) - 2;
      
    }
    
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
  
  void show() {
    fill(col);
    noStroke();
    ellipse(x, y, 10, 10);  //drawing the bacteria shape
  }
}
