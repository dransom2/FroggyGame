//contains the class implementation

#include "FroggyGame.h"

FroggyGame::FroggyGame() : lcd(12, 11, 7, 8, 9, 10) {
  cQuestion = 0;

  questions[0][0] = 4;
  questions[0][1] = 7;
  questions[0][2] = 0; 

  questions[1][0] = 5;
  questions[1][1] = 8;
  questions[1][2] = 0; 

  questions[2][0] = 1;
  questions[2][1] = 9;
  questions[2][2] = 0; 

  questions[3][0] = 4;
  questions[3][1] = 3;
  questions[3][2] = 0; 

  questions[4][0] = 6;
  questions[4][1] = 3;
  questions[4][2] = 0; 
}

void FroggyGame::initialize() {
  lcd.begin(16, 2);
  lcd.print("Welcome to the");
  lcd.setCursor(0, 1);
  lcd.print("Froggy Game!");
}
void FroggyGame::handleButtonPress() {
  int buttonState = digitalRead(5);  // Assuming the button is connected to pin 5

  if (buttonState == HIGH) {
    if (cQuestion < 5) {
      displayQuestion(cQuestion);
      cQuestion++;
    } else {
      endGame();
    }
    delay(1000);
  }
}

void FroggyGame::displayQuestion(int index) {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Question:");
  lcd.setCursor(0, 1);
  lcd.print(questions[index][0]);
  lcd.print((questions[index][2] == 0) ? " + " : " - ");
  lcd.print(questions[index][1]);
  lcd.print(" = ?");
}

void FroggyGame::endGame() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Good Job!");
  delay(2000);
  lcd.clear();
  lcd.print("Welcome to the");
  lcd.setCursor(0, 1);
  lcd.print("Froggy Game!");
  cQuestion = 0; 
}
