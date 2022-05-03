grammar multiploN6;

tokens
{
MOVE = 'mover_ocho';
}

/*PARSER RULES*/
exprmoverocho	:	MOVE '(' vel_r COMA vel_l COMA tiempo_1 COMA tiempo_2 ')'
{
/*Chequeo si es correcto el rango*/
boolean check_velocidades_tiempo_OK = false;
if((0<$vel_r.vel)&&($vel_r.vel<=100)&&(0<$vel_l.vel)&&($vel_l.vel<=100)&&(0<$tiempo_1.time)&&($tiempo_1.time<30)&&(0<$tiempo_2.time)&&($tiempo_2.time<30))
{
	check_velocidades_tiempo_OK = true;
}
if(check_velocidades_tiempo_OK)
{
	System.out.println("/*-----------------------------------------MATLAB INPUT--------------------------------------------*/");
	System.out.println(" w_r="+$vel_r.vel+";");
	System.out.println(" w_i="+$vel_l.vel+";");
	System.out.println(" t_1="+$tiempo_1.time+";");
	System.out.println(" t_2="+$tiempo_2.time+";");
	
	System.out.println("/*--------------------------------------FIN MATLAB INPUT--------------------------------------------*/");
	
	
	System.out.println("/*--------------------------------------MULTIPLO N6 INPUT--------------------------------------------*/");
	System.out.println(" int speed_R="+$vel_r.vel+";");
	System.out.println(" int speed_L="+$vel_l.vel+";");
	System.out.println(" int tiempo_1="+$tiempo_1.time+";");
	System.out.println(" int tiempo_2="+$tiempo_2.time+";");

	System.out.println("/*----------------------------------FIN MULTIPLO N6 INPUT--------------------------------------------*/");

}else
{
System.out.println("/*Error: alguna de las variables ingresadas esta fuera de los rangos permitidos*/");
}
};

vel_r returns [int vel]:INT{$vel = Integer.parseInt($INT.text);}; 

vel_l returns [int vel]:INT{$vel = Integer.parseInt($INT.text);}; 

tiempo_1 returns [int time]:INT{$time = Integer.parseInt($INT.text);}; 

tiempo_2 returns [int time]:INT{$time = Integer.parseInt($INT.text);}; 

/*LEXER RULES*/
ID  :	('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')
    ;

INT : '0'..'9'+;

COMA : ','  ;
    	
LEFT_PARENT
    :   '('
    ;

RIGHT_PARENT
    :   ')'
    ;
	
COMMENT
    :   '//' ~('\n'|'\r')* '\r'? '\n' {$channel=HIDDEN;}
    |   '/*' ( options {greedy=false;} : . )* '*/' {$channel=HIDDEN;}
    ;

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;


