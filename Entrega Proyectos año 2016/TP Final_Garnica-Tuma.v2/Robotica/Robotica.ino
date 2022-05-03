#include <DCMotor.h>
#define L 133
#define R 3 
#define VMAX 50.00  //RPM
#define YFINAL 100 // cm
#define XFINAL 100 //cm
#define XTRAMO 50// cm
#define DELAY 3828

DCMotor motor0(M0_EN, M0_D0, M0_D1);
DCMotor motor1(M1_EN, M1_D0, M1_D1);
 
  int time1=0,time2=0,n=0;
  float nr=0,nl=0;
  
void Move(int nr,int nl,int timer)
{
  motor0.setSpeed(nr);
  motor1.setSpeed(nl);  // LINEA RECTA INICIAL
  delay(timer);
}

void setup()
{    
 int Yfinal=YFINAL,Xfinal=XFINAL,Xtramo=XTRAMO,i=0;
 float Vmin=0,dist=0,Rgiro=0,time=0;

 motor1.setClockwise(false);   
  //LAS COORDENADAS SON EN CM
  n=Xfinal/Xtramo;
  n=n/2;   
  Rgiro=(Xtramo*10+L)/2;
  Vmin=VMAX*(2*Rgiro-L)/(2*Rgiro+L);
  
  for(i=0;i<n;i++)
{
  nr=VMAX;
  nl=VMAX;
  dist=Yfinal;
  dist=dist/(6.28*R);
  time=(dist)/(VMAX/60);
  //time=dist/(nl/200);
  time1=(int)time;
  Move(nr,nl,time1);// LINEA RECTA
  
  dist=Rgiro*3.14;
  dist=dist/(6.28*R);
  //time2=(dist)/(VMAX/60);
  time=DELAY*(XTRAMO/50);
  time2=(int)time;
  nr=(int)Vmin;
  nl=VMAX;
  Move(nr,nl,time2);// SEMICIRCULO  
  
  nr=VMAX;
  nl=VMAX;
  dist=Yfinal;
  dist=dist*10;
  time=dist/(nl/200);
  time1=(int)time;
  Move(nr,nl,time1);// LINEA RECTA
  
  nl=(int)Vmin;
  nr=VMAX;
  Move(nr,nl,time2+500);// SEMICIRCULO  
  
}
  motor0.brake();
  motor1.brake();
}

void loop()
{ }

