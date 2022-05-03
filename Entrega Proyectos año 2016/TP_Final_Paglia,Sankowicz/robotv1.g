/*

ROBOTICA 2DO CUATRIMESTRE 2016
UTN FRBA 
JAVIER SANKOWICZ Y LUCAS PAGLIA
TP FINAL

*/

grammar robotv1;

tokens {
	INIT	= 'init';
	END	= 'end';
	MOVC	= 'movc';
	MOVL	= 'movl';
	WAIT	= 'wait';
	

}

@header {
import java.util.HashMap;
}

@members {
		
	HashMap variables = new HashMap();
	
    public static void main(String[] args) throws Exception {
        robotv1Lexer lex = new robotv1Lexer(new ANTLRFileStream(args[0]));
       	CommonTokenStream tokens = new CommonTokenStream(lex);

        robotv1Parser parser = new robotv1Parser(tokens);

        try {
            parser.expr();
        } catch (RecognitionException e)  {
            e.printStackTrace();
        }
    }
}

/*------------------------------------------------------------------
 * PARSER RULES
 *------------------------------------------------------------------*/
comp	:	rule1 expr rule2;

//esto me asegura que todos los pseudocodigos van a empezar con init y terminar con end, y en el medio otras instrucciones
//sino está mal

expr	:	( rule3|rule4|rule5)+;



rule1	:	
INIT{


	System.out.println("/* \n --ROBOTICA 2016--\n JAVIER SANKOWICZ-LUCAS PAGLIA\n*/\n\n");
	//
	System.out.println("#include <DCMotor.h>");
	System.out.println("DCMotor motor1(M1_EN, M1_D0, M1_D1);");
	System.out.println("DCMotor motor0(M0_EN, M0_D0, M0_D1);");
	System.out.println("void setup() {");

	

};

rule2	:	

END{	
	
	System.out.println("\nmotor0.setSpeed(-0.0);");
	System.out.println("motor1.setSpeed(0.0);");
	System.out.println("}");
	
	System.out.println("\n//--fin del programa--\n");

	System.out.println("void loop() {}");
	
};


rule3	:	
//movimiento circular
MOVC '(' velocidad=factor ',' tiempo=factor ',' delta_v=factor ',' sentido=factor  ')'{ //tiempo en ms
	
	System.out.println("\n//movimiento circular");
if ($sentido.value==1){
	System.out.println("motor0.setSpeed(" + $velocidad.value * (-1) + ");");
	
	if ($delta_v.value<$velocidad.value)  System.out.println("motor1.setSpeed(" + ($velocidad.value-$delta_v.value) + ");");
	else   System.out.println("motor1.setSpeed(0)");
	}
	
else {

System.out.println("motor1.setSpeed(" + $velocidad.value  + ");");
	
if ($delta_v.value<$velocidad.value)  System.out.println("motor0.setSpeed(" + ($velocidad.value-$delta_v.value)* (-1) + ");");
else   System.out.println("motor0.setSpeed(0)");
}
	System.out.println("delay("+ $tiempo.value + ");");
};


rule4	:
//movimiento lineal

MOVL '(' velocidad=factor ',' tiempo=factor ')'{ //tiempo en ms
	System.out.println("\n//movimiento lineal");
	System.out.println("motor0.setSpeed(" + $velocidad.value * (-1) + ");");
	System.out.println("motor1.setSpeed(" + $velocidad.value + ");");
	System.out.println("delay("+ $tiempo.value + ");");
	
};


rule5	:	
WAIT '(' tiempo=factor ')' {
	System.out.println("\n//espera n milisegundos");
	System.out.println("motor0.setSpeed(0);");
	System.out.println("motor1.setSpeed(0);");
	System.out.println("delay("+ $tiempo.value + ");");
};


factor	returns [int value]
    :   INT {$value = Integer.parseInt($INT.text);}
    |	ID
	{
        Integer v = (Integer)variables.get($ID.text);
        if ( v!=null ) $value = v.intValue();
        else System.err.println("Variable no definida: "+$ID.text);
        };

//si trabajo con floats es obligatorio ingresarlos con la parte decimal
factor_float	returns [float value] 
    :   FLOAT {$value = Float.parseFloat($FLOAT.text);}
    |	ID
	{
        Integer v = (Integer)variables.get($ID.text);
        if ( v!=null ) $value = v.intValue();
        else System.err.println("Variable no definida: "+$ID.text);
        };
/*---------------------------------------------------------------
 * LEXER RULES
 *------------------------------------------------------------------*/
 
ID  :	('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

INT :	'0'..'9'+
    ;
    

fragment DIGIT	: ('0'..'9')+ ;


FLOAT
    :   ('0'..'9')+ '.' ('0'..'9')* EXPONENT?
    |   '.' ('0'..'9')+ EXPONENT?
    |   ('0'..'9')+ EXPONENT
    ;

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;

STRING
    :  '"' ( ESC_SEQ | ~('\\'|'"') )* '"'
    ;

CHAR:  '\'' ( ESC_SEQ | ~('\''|'\\') ) '\''
    ;

fragment
EXPONENT : ('e'|'E') ('+'|'-')? ('0'..'9')+ ;

fragment
HEX_DIGIT : ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
ESC_SEQ
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    |   UNICODE_ESC
    |   OCTAL_ESC
    ;

fragment
OCTAL_ESC
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;

fragment
UNICODE_ESC
    :   '\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
    ;