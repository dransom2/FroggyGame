int menu = 0;

//0 start menu
//1 game play
//2 end game


void setup(){
  size(900, 780);
  
}

void draw(){
  switch(menu)
  {
    case 0: //main menu
    {
      PImage img;
      img = loadImage("_Froggy Game! Starting Screen.png"); 
      image(img, 0, 0);
    }break;
    case 1: //game play
    {
      
    }break;
    case 2: //end game
    {
      PImage end;
      end = loadImage("Froggy Game! Ending Screen.png");
      image(end, 0, 0);
    }break;
  }
}
  }
  



 
