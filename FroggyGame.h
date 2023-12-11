//contains the class declaration

#ifndef FroggyGame_h
#define FroggyGame_h

#include <Arduino.h>
#include <LiquidCrystal.h>

class FroggyGame {
  public:
  FroggyGame();
  void initialize ();
  void handleButtonPress();
  void displayQuestion(int index);
  void endGame();

  private:
  LiquidCrystal lcd; 
  int cQuestion;
  int questions[5][3];
};

#endif
