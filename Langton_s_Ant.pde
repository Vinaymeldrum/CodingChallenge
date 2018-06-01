// Langton's Ant Coding Challenge 

int [] [] grid;
int x; //weight
int y; //height
int dir; //direction
int i; //pixels

int Antup = 0;
int Antright = 1;
int Antdown = 2;
int Antleft = 3;

PImage ant;

void setup() {
  size(800, 800);

  grid = new int[width][height];
  ant = createImage(width,height,RGB);
  ant.loadPixels();
  for (int i = 0; i < ant.pixels.length; i++);{
    ant.pixels[i] = color(255);
  }
  ant.updatePixels();
  //The ants location
  x = 200; 
  y = 200;
  dir = Antup;
}

void turnLeft() {
  dir--;
  if (dir < Antup) {
    dir = Antleft;
  }
}

void turnRight() {
  dir++;
  if (dir > Antleft) {
    dir = Antup;
  }
}

void moveForward() {
  if (dir == Antup) {
    y--;
  } else if (dir == Antright) {
    x++;
  } else if (dir == Antdown) {
    y++;
  } else if (dir == Antleft) {
    x--;
  }
  
  //edges
  if (x>width-1) {
    x = 0;
  } else if (x < 0) {
    x = width-1;
  }

  if (y>height-1) {
    y = 0;
  } else if (y < 0) {
    y = height-1;
  }
}

void draw() {
  background(255);



  for (int n = 0; n < 100; n++) { //speed
    //State of the current spot where the ant is
    int state = grid[x][y];
    if (state == 0) {
      turnRight();
      grid[x][y] = 1;
    } else if (state == 1) {
      turnLeft();
      grid[x][y] = 0;
    }
        
    color col = color(220); //color
    if (grid[x][y] == 0) {
      col = color(135,206,235);
    }
    colorMode(RGB, col);
    noStroke();
    noFill();
    ant.set(x,y,col);
    moveForward();
  }

    image(ant,0,0);
//    loadPixels();
//    for (int a = 0; a < width; a++) {
//      for (int b = 0; b < height; b++) {
//        int pix = a + width * b;
//        if (grid[a][b] == 0) {
//          pixels[pix] = color(255);
//        } else {
//          pixels [pix] = color(0);
//        }
//      }
//    }
//    updatePixels();
//  }
//}
}