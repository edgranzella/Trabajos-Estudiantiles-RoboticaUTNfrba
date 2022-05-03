#include <DCMotor.h>

#define  UN_SEGUNDO           1000
#define  UN_MILI_SEGUNDO      1
#define  CANTIDAD_DE_MEDICIONES  10000


DCMotor motor0(M0_EN, M0_D0, M0_D1);    // Motor 0 es el derecho
DCMotor motor1(M1_EN, M1_D0, M1_D1);    // Motor 1 es el izquierdo


double  velocidad_derecha[] = {
15.39,
29.16,
41.31,
51.84,
60.75,
68.04,
73.71,
77.76,
80.19,
81,
80.19,
77.76,
73.71,
68.04,
60.75,
51.84,
41.31,
29.16,
15.39
};


double  velocidad_izquierda[] = {

7.695,
14.58,
20.655,
25.92,
30.375,
34.02,
36.855,
38.88,
40.095,
40.5,
40.095,
38.88,
36.855,
34.02,
30.375,
25.92,
20.655,
14.58
};


void setup()
{
  int  contador, contador_encoders, sensor_derecho, sensor_izquierdo;
  unsigned long  tic, toc, demora, us_restantes;
  
  Serial.begin(9600);
  
  motor1.setClockwise(false);
  
  delay( 2500 );
  
  for( contador = 0; contador < 18; contador++ )
  {
    
    motor1.setSpeed( velocidad_derecha[ contador ] );
    motor0.setSpeed( velocidad_izquierda[ contador ] );
    
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
    
  }

  motor1.brake();
  motor0.brake();
}

void loop()
{ }


