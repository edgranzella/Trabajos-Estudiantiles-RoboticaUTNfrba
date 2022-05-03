grammar Compilador_Robotica;

tokens 				
{
	//Aca definimos los simbolos o tokens que reconoce el compilador
	ALIAS          = 'ALIAS';
	AND            = 'AND';
	ARRAY          = 'ARRAY';
	ASSOCIATIVE    = 'ASSOCIATIVE';
	BEGIN          = 'BEGIN';
	BINDINGS       = 'BINDINGS';
	BY             = 'BY';
	CASE           = 'CASE';
	CONST          = 'CONST';
	DEFINITION     = 'DEFINITION';
	DIV            = 'DIV';
	DO             = 'DO';
	ELSE           = 'ELSE';
	ELSIF          = 'ELSIF';
	END            = 'end';
	EXIT           = 'EXIT';
	FOR            = 'FOR';
	FROM           = 'FROM';
	IF             = 'IF';
	IMPLEMENTATION = 'IMPLEMENTATION';
	IMPORT         = 'IMPORT';
	IN             = 'IN';
	INIT 	       = 'init';
	LOOP           = 'LOOP';
	MINUS          = '-' ;
	MOD            = 'MOD';
	MODULE         = 'MODULE';
	NOT            = 'NOT';
	OF             = 'OF';
	OPAQUE         = 'OPAQUE';
	OR             = 'OR';
	PLUS 	       = '+' ;
	POINTER        = 'POINTER';
	PROCEDURE      = 'PROCEDURE';
	PRODUCT        = '*';
	RECORD         = 'RECORD';
	REPEAT         = 'REPEAT';
	RETURN         = 'RETURN';
	SET            = 'SET';
	THEN           = 'THEN';
	TO             = 'TO';
	TYPE           = 'TYPE';
	UNTIL          = 'UNTIL';
	VAR            = 'VAR';
	VARIADIC       = 'VARIADIC';
	WHILE          = 'WHILE';
	MOVEL 	       = 'movel';
	MOVEDER        = 'moveder';
	MOVEIZQ        = 'moveizq';
	
}



@header 
{
	import java.util.HashMap;	//Importamos la clase de la tabla Java para almacenar variables
}

@members
{
        Integer i=0;
	HashMap variables = new HashMap();	//Tabla de java para almacenar variables
	HashMap valores = new HashMap();
	public static void main(String[] args) throws Exception 
	{
		Compilador_RoboticaLexer lex = new Compilador_RoboticaLexer(new ANTLRFileStream(args[0]));
		CommonTokenStream tokens = new CommonTokenStream(lex);
		Compilador_RoboticaParser parser = new Compilador_RoboticaParser(tokens);
		try 
		{
			parser.expr();
		} 
		catch (RecognitionException e)
		{
			e.printStackTrace();
		}
	}
}

/*------------------------------------------------------------------
* PARSER RULES: REGLAS DEL ANALIZADOR SINTACTICO
*------------------------------------------------------------------*/

expr	:( rule1|rule2|rule3|rule4|rule5)+;

rule1	:	
INIT{
        System.out.println("#include <DCMotor.h>");
        System.out.println("#define L 133");
        System.out.println("#define R  3");      
        System.out.println("#define DELAY 3828");
        System.out.println("DCMotor motor0(M0_EN, M0_D0, M0_D1);");
        System.out.println("DCMotor motor1(M1_EN, M1_D0, M1_D1);");

        System.out.println("int Yfinal=a,Xfinal=b,Xtramo=c; //LAS COORDENADAS SON EN CM");	
        
        System.out.println("int time1=0,time2=0,nr=0,nl=0,n=0,i;");
   
        System.out.println("void Move(int nr,int nl,int timer)");
        System.out.println("{");    
        System.out.println(" motor0.setSpeed(nr); ");
        System.out.println(" motor1.setSpeed(nl);  // LINEA RECTA INICIAL ");
        System.out.println("delay(timer);} ");
        
                
        System.out.println("void setup(){");
        System.out.println(" float Vmin=0,dist=0,Rgiro=0,time=0;");        
        System.out.println("motor1.setClockwise(false);");
        
};

rule2 :	
MOVEL'(' vel=factor COMA yfinal=factor ')'{
         System.out.println("nr="+ $vel.value + ";");  
         System.out.println("nl="+ $vel.value + ";");  
         System.out.println("dist="+ $yfinal.value + ";");
         System.out.println("dist=dist/(6.28*R);");           
         System.out.println("time=dist/(VMAX/60); ");   
         System.out.println("time1=(int)aux;");      
         System.out.println(" Move(nr,nl,time1);//LINEA RECTA");
};
rule3	:	
MOVEDER	'(' velIzq=factor COMA xtramo=factor ')'{
        System.out.println(" n=(Xfinal/"+ $xtramo.value + ")/2;");
        System.out.println(" Rgiro=("+ $xtramo.value + "*10+L)/2;");
        System.out.println("Vmin="+ $velIzq.value + "*(2*Rgiro-L)/(2*Rgiro+L);");         
        System.out.println("nl="+ $velIzq.value + ";"); 
        System.out.println("nr=(int)Vmin;");             
        System.out.println("dist=Rgiro*3.14;");
        System.out.println("dist=dist/(6.28*R);");
        System.out.println("time=DELAY/("+ $xtramo.value + "/50);");
        System.out.println("time2=(int)time; ");
        System.out.println("Move(nr,nl,time2);// SEMICIRCULO");
};

rule4	:	
MOVEIZQ	'(' velDer=factor COMA xtramo=factor ')'{
        System.out.println(" n=(Xfinal/"+ $xtramo.value + ")/2;");
        System.out.println(" Rgiro=("+ $xtramo.value + "*10+L)/2;");
        System.out.println("Vmin="+ $velDer.value + "*(2*Rgiro-L)/(2*Rgiro+L);");       
        System.out.println("nr="+ $velDer.value + ";"); 
        System.out.println("nl=(int)Vmin;");             
        System.out.println("dist=Rgiro*3.14;");
        System.out.println("dist=dist/(6.28*R);");
        System.out.println("time=DELAY/("+ $xtramo.value + "/50);");
        System.out.println("time2=(int)time; ");
        System.out.println("Move(nr,nl,time2);// SEMICIRCULO");
};

rule5	:	
END{
        System.out.println(" motor0.brake(); ");
        System.out.println("motor1.brake(); ");
        System.out.println("} ");
        System.out.println("void loop()");
        System.out.println(" { }");
        System.out.println("                                                   }");
 
};
factor returns [int value]
: 
  NUMBER{$value = Integer.parseInt($NUMBER.text);} //Con esto acepta un entero
| ID
{
	Integer v = (Integer)variables.get($ID.text); //Con esto acepta letras como enteros
	valores.put(i++, new Integer(v));
	if ( v!=null ) $value = v.intValue();
	else System.err.println("Variable no definida: "+$ID.text);
};
                        
                              
/*------------------------------------------------------------------
* LEXER RULES: REGLAS DEL ANALIZADOR LEXICO
*------------------------------------------------------------------*/
ID : ('a'..'z'|'A'..'Z')+ ;	
WHITESPACE : ( '\t' | ' ' | '\r' | '\n'| '\u000C' )+ { $channel = HIDDEN; } ;
LEFT_PAREN: '(';
RIGHT_PAREN: ')';
COMA 	:	',';

NUMBER: FLOAT|INTEGER;
fragment FLOAT:INTEGER '.' '0'..'9'+;
fragment INTEGER: '0' | '1'..'9' '0'..'9'*;
 
NAME: LETTER (LETTER | DIGIT | '_')*;
STRING_LITERAL: '"' NONCONTROL_CHAR* '"';

fragment NONCONTROL_CHAR: LETTER | DIGIT | SYMBOL | SPACE;
fragment LETTER: LOWER | UPPER;
fragment LOWER: 'a'..'z';
fragment UPPER: 'A'..'Z';
fragment DIGIT: '0'..'9';
fragment SPACE: ' ' | '\t';
fragment SYMBOL: '!' | '#'..'/' | ':'..'@' | '['..'`' | '{'..'~';





