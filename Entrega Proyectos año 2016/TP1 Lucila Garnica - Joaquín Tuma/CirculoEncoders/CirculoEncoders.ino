#include <DCMotor.h>

#define  UN_SEGUNDO           1000
#define  UN_MILI_SEGUNDO      1
#define  CANTIDAD_DE_MEDICIONES  10000


DCMotor motor0(M0_EN, M0_D0, M0_D1);    // Motor 0 es el derecho
DCMotor motor1(M1_EN, M1_D0, M1_D1);    // Motor 1 es el izquierdo


void setup()
{
  int  contador, contador_encoders, sensor_derecho, sensor_izquierdo;
  unsigned long  tic, toc, demora, us_restantes;
  
  Serial.begin(9600);
  
  motor1.setClockwise(false);
  
  Serial.println( 'Midiendo' );
  
  delay( 2500 );
    
    motor1.setSpeed(25);
    motor0.setSpeed(50);
    
    for( contador_encoders = 0; contador_encoders < 50; contador_encoders++ )
    {
        tic = micros();
        sensor_derecho = analogRead( 0 );
        Serial.print( sensor_derecho );
        Serial.print( ',' );
        sensor_izquierdo = analogRead( 1 );
        Serial.println( sensor_izquierdo );
        toc = micros();
        demora = toc - tic;
        us_restantes = 1000 - demora;
        delayMicroseconds( us_restantes );
    }
    

  motor1.brake();
  motor0.brake();
}

void loop()
{ }


