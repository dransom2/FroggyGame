int menu = 0;
int currentIntermediate = 0; // Variable to keep track of the current intermediate screen

// 0 start menu
// 1 intermediate screen
// 2 game play
// 3 end game

PImage imgStart;
PImage imgIntermediate;

PImage frog;
PImage imgEnd;

float frogX = 0;
float frogY = 0;

PVector frogForce;

float[] lilypad_pos = new float[] {100, 100, 160, 100};
boolean isJumping = false;

void setup() {
  size(900, 780);
  
  imgStart = loadImage("_Froggy Game! Starting Screen.png");
  imgIntermediate = loadImage("Froggy Game! Background.png");
  imgEnd = loadImage("Froggy Game! Ending Screen.png");
  frog = loadImage("Frog.png");

  frogY = height - lilypad_pos[0] - 150;

  frogForce = new PVector(0, 0);

}

void draw() {
  switch(menu) {
  case 0: // start menu
    image(imgStart, 0, 0);
    break;
    
  case 1: // intermediate screen
    // Use different intermediate images based on the currentIntermediate variable
    if (currentIntermediate == 0) {
      image(imgIntermediate, 0, 0);
      
    } else {
      image(imgEnd, 0, 0);
      
    }
    
    drawFrog();
    moveFrog();
    break;
  case 2: // game play
    // Add code for game play here
    break;
  case 3: // end game
    image(imgEnd, 0, 0);
    break;
  }
}

void drawFrog() {
  image(frog, frogX, frogY, 150, 150);
}


void moveFrog() {
  frogY += frogForce.y;
  frogX += frogForce.x;
  
  // test collisions
  int caseX = floor(frogX / float(width / lilypad_pos.length));
  float h = height - 100;
  
  if(caseX >= 0 && caseX < lilypad_pos.length)
    h = height - lilypad_pos[caseX];
  
  frogForce.add(-0.01 * frogForce.x, 0.8);

  if(frogY + 150 > h) {
      frogForce.add(-frogForce.x, -frogForce.y);
      isJumping = false;
  }
  
  if(frogX > width) {
    menu = 3;
    frogX = 0;
    frogY = height - lilypad_pos[0] - 150;
    isJumping = false;
    frogForce = new PVector(0, 0);
  }

}

void jump() {
  isJumping = true;
  
  int caseX = floor(frogX / float(width / lilypad_pos.length));

  if(caseX != 2 || lilypad_pos[2] == 10) {
    frogForce.add(6.3, 0);
    frogForce.add(0, -20);  

  }
  else {
    lilypad_pos[2] = 10;  
    frogForce.add(0, -10);  

  }

}


void mousePressed() {
  // Switch screens based on mouse click
  if (menu == 0) {
    menu = 1; // Switch to intermediate screen
  } else if (menu == 1) {
    jump();
    
  } else if (menu == 2) {
    menu = 3; // Switch to end game
  } else if (menu == 3) {
    menu = 0; // Switch back to start menu
  }
}
