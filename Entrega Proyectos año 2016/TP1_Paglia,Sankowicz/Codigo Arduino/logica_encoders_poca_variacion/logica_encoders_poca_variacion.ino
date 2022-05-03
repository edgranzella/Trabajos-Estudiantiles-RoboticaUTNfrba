#include <DCMotor.h>

DCMotor motor0(M0_EN, M0_D0, M0_D1);
DCMotor motor1(M1_EN, M1_D0, M1_D1);
//ejemplo para probar el timer en el arduino uno
void ActualizarEncoders(void);

#define PIN_ENCODER0 A0
#define PIN_ENCODER1 A1
#define ENCODER_HIGH_TRESHOLD 315 //decimal, 8 bits
#define ENCODER_LOW_TRESHOLD 210 //decimal, 8 bits
#define LONGITUD_ARCO_ENCODER 0.00589 //cuánto representa en distancia lineal un paso del encoder, en m
#define PERIODO_TIMER 1/2000 //sec

unsigned long int delta_t [10]= {400, 600, 800, 1000, 600, 400, 1200, 1600, 1400, 2000};
int estado=0; //estado principal que determina el movimiento
int timer_estados=400;

int toggle_stat = 0; //controla el estado del led
long unsigned int counter = 0; //para maquinaria de timers
int sensor_data = 0; //auxiliar para leer los sensores analógicos
double distancia0=0, tiempo0=0, velocidad0=0, distancia1=0, tiempo1=0, velocidad1=0;

int motores_flag = 1;
unsigned int frenar_motores_contador = 0;

//estos dos cuentan cuántas veces cambia de estado el encoder 
long unsigned int encoder0_counter = 0; 
long unsigned int encoder1_counter = 0;

//estos dos cuentan cuántos ticks pasaron hasta que cambia de estado el encoder 
long unsigned int encoder0_ticks = 0; 
long unsigned int encoder1_ticks = 0;

//valores actuales de los encoders 
long unsigned int encoder0_status = 0; 
long unsigned int encoder1_status = 0;

//valores previos de los encoders 
long unsigned int encoder0_prev_status = 0; 
long unsigned int encoder1_prev_status = 0;

void setup() {

  Serial.begin(9600);
  pinMode(13, OUTPUT); //seteo el led que viene onboard como salida
 
  digitalWrite(13, LOW);
  
  //SETUP DE LA INTERRUPCION DEL TIMER0 (2kHz)
  cli(); //apago interrupciones
  TCCR0A = 0;
  TCCR0B = 0;
  TCNT0  = 0; //pongo el contador del timer en 0
  // set compare match register for 2khz increments
  OCR0A = 124;// = (16*10^6) / (2000*64) - 1 (2kHz), tiene que dar menor a 256 porque el timer es de 8 bits
 
  TCCR0A |= (1 << WGM01); //esto me resetea automáticamente el contador cada vez que interrumpe 
  // pongo el prescaler en 64 
  TCCR0B |= (1 << CS01) | (1 << CS00);   
  // activo la interrupción
  TIMSK0 |= (1 << OCIE0A);
  sei();//activo interrupciones

ActualizarEncoders(); //actualiza los valores digitales de los encoders basado en las lecturas analógicas



//motor0.setSpeed(-50.0);
//motor1.setSpeed(50.0);    
  
}


void loop() {
  // espero interrupciones
switch (estado){

case 0:
motor0.setSpeed(-20.0);
motor1.setSpeed(10.0);    
break;

case 1:
motor0.setSpeed(-10.0);
motor1.setSpeed(20.0);    
break;

case 2:
motor0.setSpeed(-50.0);
motor1.setSpeed(30.0);    

break;
case 3:
motor0.setSpeed(-50.0);
motor1.setSpeed(40.0);    
break;

case 4:
motor0.setSpeed(-20.0);
motor1.setSpeed(50.0);    
break;

case 5:
motor0.setSpeed(-40.0);
motor1.setSpeed(60.0);    
break;

case 6:
motor0.setSpeed(-00.0);
motor1.setSpeed(20.0);    
break;

case 7:
motor0.setSpeed(-80.0);
motor1.setSpeed(70.0);    
break;

case 8:
motor0.setSpeed(-90.0);
motor1.setSpeed(70.0);    
break;

case 9:
motor0.setSpeed(-100.0);
motor1.setSpeed(90.0);    
break;

default:
motor0.brake();
motor1.brake();    

}



}
  
ISR(TIMER0_COMPA_vect){ //Handler de la interrupción del timer0

counter++;
frenar_motores_contador++;
timer_estados--;

if(!timer_estados){
estado++;
timer_estados=delta_t[estado];
Serial.print("ESTAD0: ");
Serial.println(estado);

Serial.print("ENCODER 0 CONTADOR: ");
Serial.println(encoder0_counter);
encoder0_counter=0;
Serial.print("ENCODER 1 CONTADOR: ");
Serial.println(encoder1_counter);
encoder1_counter=0;

}


if (counter==1000){
  counter=0;
if (toggle_stat==0){
digitalWrite(13, HIGH);   // turn the LED on (HIGH is the voltage level)
toggle_stat=1;
}
else {
digitalWrite(13, LOW);   // turn the LED on (HIGH is the voltage level)
toggle_stat=0;
}

if (frenar_motores_contador==4000){
motores_flag=0;

}
//cada 500ms calculo distancia e informo la distancia recorrida y la velocidad
/*

distancia0=encoder0_counter*LONGITUD_ARCO_ENCODER;
distancia1=encoder1_counter*LONGITUD_ARCO_ENCODER;
Serial.println("ENCODER 0 DISTANCIA: ");
Serial.println(distancia0);

Serial.println("ENCODER 0 VELOCIDAD: ");
Serial.println(velocidad0);

Serial.println("ENCODER 0 CONTADOR: ");
Serial.println(encoder0_counter);

Serial.println("ENCODER 1 DISTANCIA: ");
Serial.println(distancia1);

Serial.println("ENCODER 0 VELOCIDAD: ");
Serial.println(velocidad1);

Serial.println("ENCODER 1 CONTADOR: ");
Serial.println(encoder1_counter);
*/

}

//lógica de cambios de estado de los encoders:
//me guardo los valores previos
encoder0_prev_status=encoder0_status;
encoder1_prev_status=encoder1_status;
ActualizarEncoders(); //Cargo los nuevos valores en status

if (encoder0_status==encoder0_prev_status){
  encoder0_ticks++;
  //if (encoder0_ticks>=4294967290) //lógica saturada para que no desborde
  //encoder0_ticks==4294967289;
  }
else {
  tiempo0=encoder0_ticks*PERIODO_TIMER;
  velocidad0=LONGITUD_ARCO_ENCODER/tiempo0;
  encoder0_ticks=0;
  encoder0_counter++; 
  }

//-----misma lógica para el encoder1
if (encoder1_status==encoder1_prev_status){
  encoder1_ticks++;
  //if (encoder1_ticks>=4294967290) //lógica saturada para que no desborde
  //encoder1_ticks==4294967289;
  }
else {
  tiempo1=encoder1_ticks*PERIODO_TIMER;
  velocidad1=LONGITUD_ARCO_ENCODER/tiempo1;
  encoder1_ticks=0;
  encoder1_counter++; 
  }

  
}

void ActualizarEncoders(void){ //pone en las variables status el valor actual de los encoders
//me fijo el estado inicial del encoders:
 sensor_data=analogRead(PIN_ENCODER0);
if (sensor_data > ENCODER_HIGH_TRESHOLD) {
  encoder0_status=1; //lógica positiva, 1 == blanco
  }
else if (sensor_data < ENCODER_LOW_TRESHOLD) {
  encoder0_status=0; //lógica positiva, 0 == negro
  }
 //si está en el medio (zona de incertidumbre) queda con el valor que tenía

//idem encoder1-------------------------------


 sensor_data=analogRead(PIN_ENCODER1);
if (sensor_data > ENCODER_HIGH_TRESHOLD) {
  encoder1_status=1; //lógica positiva, 1 == blanco
  }
else if (sensor_data < ENCODER_LOW_TRESHOLD) {
  encoder1_status=0; //lógica positiva, 0 == negro
  }
 //si está en el medio (zona de incertidumbre) queda con el valor que tenía

}
