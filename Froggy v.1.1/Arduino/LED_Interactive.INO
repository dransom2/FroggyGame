const int ledPin = 13;    
const int ledPin2 = 12;   //define the LED pins
const int Buzzer = 11;
void setup(){

  pinMode(ledPin, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(Buzzer, OUTPUT);     
  Serial.begin(9600);     
}

void loop(){

  if(Serial.available() > 0){           //if some data is available of in the serial port
    char ledPinState = Serial.read();   //read the value
    if(ledPinState == '1'){             //if statement will be true(1)
      digitalWrite(ledPin, HIGH);
      tone(Buzzer, 300);
      delay(500); 
      noTone(Buzzer);
      delay(500); 
      tone(Buzzer, 300);
      delay(500); 
      noTone(Buzzer);
      tone(Buzzer, 300);
      delay(500); 
      noTone(Buzzer);
      digitalWrite(ledPin, LOW);       //turn ON the LED
      ledPinState == '2';
      Serial.read();    
      ;
    }
    if(ledPinState == '0'){             //if statement will be false(0)
      digitalWrite(ledPin2, HIGH);
      tone(Buzzer, 300);
      delay(1000); 
      noTone(Buzzer);
      digitalWrite(ledPin2, LOW);
      ledPinState == '2';
      Serial.read();
    }
        if(ledPinState == '2'){  

    digitalWrite(ledPin2, LOW);
    digitalWrite(ledPin, LOW);
        }
  }
 
}
