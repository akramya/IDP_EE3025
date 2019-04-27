#include <LiquidCrystal.h> // includes the LiquidCrystal Library 
LiquidCrystal lcd(1, 2, 4, 5, 6, 7); // Creates an LC object. Parameters: (rs, enable, d4, d5, d6, d7) 
void setup() { 
 lcd.begin(16,2); // Initializes the interface to the LCD screen, and specifies the dimensions (width and height) of the display } 
 
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  pinMode(A5, INPUT);
  pinMode(12, INPUT);
  pinMode(13, INPUT);
  randomSeed(analogRead(0));
}
void loop() { 
  
  delay(2000);
  int a0 = digitalRead(A0);
  int a1 = digitalRead(A1);
  int a2 = digitalRead(A2);
  int a3 = digitalRead(A3);
  int a4 = digitalRead(A4);
  int a5 = digitalRead(A5);
  int a6 = digitalRead(12);
  int a7 = digitalRead(13);
  lcd.print("Final code : ");
  delay(2000);
  lcd.clear();
  lcd.print(a0);
  lcd.print(a1);
  lcd.print(a2);
  lcd.print(a3);
  lcd.print(a4);
  lcd.print(a5);
  lcd.print(a6);
  lcd.print(a7);
  delay(5000);
   lcd.clear();
   
}
