
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  
  pinMode(0, OUTPUT);
  pinMode(1, OUTPUT);
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  
  
  
  int r,v;
  r = 0; v=1;
  
  //data_in
  digitalWrite(0, r);
  digitalWrite(1, v);
  digitalWrite(2, r);
  digitalWrite(3, r);
  
  //data_in2
  digitalWrite(4, v);
  digitalWrite(5, v);
  digitalWrite(6, r);
  digitalWrite(7, v);
  
  //initial_value
  digitalWrite(8, v);
  digitalWrite(9, r);
  digitalWrite(10, v);
  digitalWrite(11, r);
 
}

void loop(){
  
  
}


