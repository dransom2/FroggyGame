import processing.serial.*;

Serial myPort;

class QuestionManager{
  String[] questions; //Array to store math questions
  int[] correctAnswers; //array to store correct answers
  int cQuestionindex; //index of current question
  int playAnswer = -1; //plater's current answer
  boolean isCorrect; //will track if answer is correct by flagging
  boolean notCorrect; //will track if answer is incorrect by flagging

  QuestionManager(){
    //Initialize questions array with math questions
    questions = new String[]{
      "10 - 8 = 0",
      "7 + 1 = 0",
      "3 + 3 = 0",
      "9 - 4 = 0",
      "10 + 5 = 0",
    };
    //initialize correct answers array
    correctAnswers = new int[]{2, 8, 6, 5, 15};
    
    cQuestionindex = 0; //start with first question
    playAnswer = 0; //initalize player's answer
    isCorrect = false; //initalize answer correctness
  }
  
  void displayCurrentQuestions(){
    //display current question on screen
    fill(255);
    textSize(50);
    text(questions[cQuestionindex], 340, height - 435);
    
    //display player's input
    fill(255);
    textSize(50);
    text("Your Answer: " + playAnswer, 280, height - 370);   

  
    
    if(isCorrect){
      fill(0, 100, 0);
      text("Correct!", 340, height - 580);
       
    } if (notCorrect) {
      fill(255, 0, 0);
     text("Incorrect! Try Again.", 250, height - 580);
   

    }
  }
  void checkAnswer() {
  // Extract the answer part from the current question
  String[] parts = split(questions[cQuestionindex], "=");
  if (parts.length != 2) {

    // Invalid question format, handle accordingly
    isCorrect = false;
    return;
  }
  
  //Parse the correct answer from the question
  int correctAnswer = correctAnswers[cQuestionindex];
  
  //compare the player's answer with the correct answer;
  isCorrect = (playAnswer == correctAnswer);
  notCorrect = (playAnswer != correctAnswer); 
        if (isCorrect) {
    myPort.write('1');
    isCorrect = false;
  }
     if (notCorrect) {
    myPort.write('0');
    notCorrect = false;
  }
  }
  
  
    
  
  void selectNextQuestion() {
    // Move to the next question

    cQuestionindex = (cQuestionindex + 1) % questions.length;
    playAnswer = 0; // Reset the player's answer for the next question
    isCorrect = false; // Reset answer correctness
    notCorrect = false;
   
  }

  
  void keyPressed(char key){
    //handle key presses for answering questions
    if(key >= '0' && key <= '9'){
      //if number key is pressed, update player's answer
      int digit = key - '0';
      playAnswer = playAnswer * 10 + digit;
    } else if (key == BACKSPACE && playAnswer > 0){
      //backspace is pressed, remove last digit
      playAnswer = playAnswer / 10; 
    } else if(key == ENTER){
      //press enter key to check answer
     checkAnswer();
    }
  }
}
