grammar robot;

tokens {
	INIT	= 'init';
	HOME	= 'home';
	MOVE	= 'move';
	MOVEREC	= 'moverec';
	MOVEQ	= 'moveq';
	WAIT	= 'wait';
	END	= 'end'	;	
}

@header {
import java.util.HashMap;
}

@members {
		
	HashMap variables = new HashMap();
	
    public static void main(String[] args) throws Exception {
        robotLexer lex = new robotLexer(new ANTLRFileStream(args[0]));
       	CommonTokenStream tokens = new CommonTokenStream(lex);

        robotParser parser = new robotParser(tokens);

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
comp	:	rule1 expr rule6;

expr	:	( rule2|rule3|rule4|rule5|rule7  )+;


rule1	:	
INIT{
	System.out.println(""
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"\% INIT"
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"clear all;"
+"\n"+"clc;"
+"\n"+"syms q1 q2 q3 q4 q5 real"

+"\n"+"arm_lenght=3;"
+"\n"+"display(\'INIT()\');"

+"\n"+"Eq = [ q1; "
+"\n"+"     cos(q3)*arm_lenght+sin(q4/2)*arm_lenght;"
+"\n"+"     q2];"
   
+"\n"+"q0=[0 0 1.55 0.033 0]; \% Valores de q de la posición inicial"
+"\n"+"qa=q0;          \% qa son los valores de q al finalizar cada instrucción"

+"\n"+"qmax = [20 15 degtorad(180) degtorad(180)]; \% Restricciones"
+"\n"+"qmin = [0  0 degtorad(-125) degtorad(-70)];"

+"\n"+"q1=qa(1,1);q2=qa(1,2);q3=qa(1,3);"
+"\n"+"Pa= eval(Eq)\';   \% Punto en x,y,z"

+"\n"+" fd = fopen(\'outq.txt\',\'w\');"

+"\n"+"fprintf(fd,\'q1      q2      q3      q4      q5\\n\');"

+"\n"+"fprintf(fd,\'\%2.4f   \',q0);"
+"\n"+"fprintf(fd,\' ;\\n \');"+
	"");
};

rule2	:	
HOME{
	System.out.println(""
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"\% HOME"
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"display(\'HOME()\');"

+"\n"+"N=20;"
+"\n"+"qi=q0;"
+"\n"+"clear(\'q\');"

+"\n"+"inc_q=(qi-qa)/N;"

+"\n"+"for j=1:1:N"
+"\n"+"    q(j,:)= qa + j*inc_q ;    "
+"\n"+"end"
 
+"\n"+"for j=1:1:size(q,1)"
+"\n"+"    fprintf(fd,\'\%2.3f   \',q(j,:));"
+"\n"+"    fprintf(fd,\' ;\\n\');    "
+"\n"+"    qa=q(j,:);"
+"\n"+"end"

+"\n"+"q1=qa(1,1);q2=qa(1,2);q3=qa(1,3);"
+"\n"+"Pa= eval(Eq)\';"

+"\n"+"qa;	"
	
	+"");	
};

rule3	:	
MOVE '(' x=factor'.'xd=factor ',' y=factor'.'yd=factor ',' z=factor'.'zd=factor ',' t=factor ')'{
	System.out.println(""
		
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"\% MOVE"
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"display(\'MOVE( "+ $x.value + "." + $xd.value  + " , " + $y.value + "." + $yd.value+ " , " + $z.value + "." + $zd.value+" , "+ $t.value+ " )\');"

+"\n"+"Pxyz=[-0.30,0.6,0]\'; \% q=[0 2.0956 3.0707 0 0 ]"
+"\n"+"Pxyz=["+ $x.value + "." + $xd.value  + " , " + $y.value + "." + $yd.value+ " , " + $z.value + "." + $zd.value+"]\';"

+"\n"+"px=Pxyz(1,1);"
+"\n"+"py=Pxyz(2,1);"
+"\n"+"pz=Pxyz(3,1);"

+"\n"+"\%-----------------------------------------------"
+"\n"+"q1s = pz;"
+"\n"+"q2s = px;"

+"\n"+"if (py > 0.53) & (py <= 5.97) "
+"\n"+"    q3s =acos((py/2)/arm_lenght);"
+"\n"+"    q4s =2*asin((py/2)/arm_lenght);"
+"\n"+"end"

+"\n"+"if ( imag(q3s) ~= 0 ) | (imag(q4s) ~= 0 )"
+"\n"+"    display(\'Punto inalcanzable. Ubicado fuera del espacio de trabajo\')  "

+"\n"+"else"
+"\n"+"    qi=[q1s q2s q3s q4s 0];"

+"\n"+"    if ( qi(1,1:4) <= qmax ) & ( qi(1,1:4) >= qmin )        "

+"\n"+"        N=" +$t.value + ";"
+"\n"+"        inc_q=(qi-qa)/N;"

+"\n"+"        for( j=1:1:N )"
+"\n"+"            q(j,:)= qa + j*inc_q ;    \% Interpolación lineal"
+"\n"+"        end"

+"\n"+"        for j=1:1:size(q,1)"
+"\n"+"            for h=1:1:size(q,2)"
+"\n"+"                fprintf(fd,\'\%2.3f   \',q(j,h));"
+"\n"+"            end"
+"\n"+"                fprintf(fd,\' ;\\n\');"
+"\n"+"            qa=q(j,:);"
+"\n"+"        end"
+"\n"+"    else"
+"\n"+"        display(\'Los valores de q están fuera de rango\');    "
+"\n"+"    end"

+"\n"+"end    "
    
+"\n"+"q=zeros(1,5);"
+"\n"+"qa;"			
	
	);

	
};

rule4	:	
MOVEQ '('q1=factor'.'q1d=factor ',' q2=factor'.'q2d=factor ',' q3=factor'.'q3d=factor ',' q4=factor'.'q4d=factor ',' t=factor ')'{
	System.out.println(""

+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"\% MOVQ"
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"display(\'MOVQ( "+ $q1.value + "." + $q1d.value  + " , "+ $q2.value + "." + $q2d.value+ " , "+ $q3.value+"."+$q3d.value+" , "+ $q4.value+"."+$q4d.value+" , "+ $t.value+")\');"

+"\n"+"N="+ $t.value + ";"
+"\n"+"qi=["+ $q1.value + "." + $q1d.value  + " , " + $q2.value + "." + $q2d.value+ " , " + $q3.value + "." + $q3d.value+" ," + $q4.value + "." + $q4d.value+" , 0 ];"

+"\n"+"if ( qi(1,1:4) <= qmax ) & ( qi(1,1:4) >= qmin )"

+"\n"+"    inc_q=(qi-qa)/N;"
+"\n"+"    q=zeros(N,5);"

+"\n"+"    for j=1:1:N"
+"\n"+"        q(j,:)= qa + j*inc_q ;    "
+"\n"+"    end"


+"\n"+"    for j=1:1:size(q,1)"
+"\n"+"        for h=1:1:size(q,2)"
+"\n"+"            fprintf(fd,\'\%2.3f   \',q(j,h));"
+"\n"+"        end"
+"\n"+"            fprintf(fd,\' ;\\n\');"
+"\n"+"        q1=q(j,1);q2=q(j,2);q3=q(j,3);        "
+"\n"+"        Pa= eval(Eq)\';       "
+"\n"+"        qa=q(j,:);"
+"\n"+"    end"
    
+"\n"+"else"
+"\n"+"    display(\'Los valores de q están fuera de rango\');"
+"\n"+"end"
    
    
+"\n"+"q=zeros(1,5);"

	);

};

rule5	:	
WAIT '(' t=factor ')' {
	System.out.println(""
	
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"\% WAIT"
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"display(\'WAIT()\');"

+"\n"+"t="+ $t.value + ";"

+"\n"+"for j=1:1:t"
+"\n"+"    q(j,:)= qa ;    "
+"\n"+"end"
 
+"\n"+"for j=1:1:size(q,1)"
+"\n"+"    for h=1:1:size(q,2)"
+"\n"+"        fprintf(fd,\'\%2.3f   \',q(j,h));"
+"\n"+"    end"
+"\n"+"        fprintf(fd,\' ;\\n\');"
+"\n"+"    qa=q(j,:);"
+"\n"+"end"

+"\n"+"qa;"		
	+"");
};

rule6	:	
END{
	System.out.println(""
	+"\n\%--------------------------------------------------------------------------"
	+"\n\% END"
	+"\n\%--------------------------------------------------------------------------"
	+"\ndisplay('END()');"
	+"\nfclose(fd);"	
	);	
};

rule7	:	
MOVEREC '(' x=factor'.'xd=factor ',' y=factor'.'yd=factor ',' z=factor'.'zd=factor ',' t=factor ')'{
	System.out.println(""
		
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"\% MOVEREC"
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"display(\'MOVEREC( "+ $x.value + "." + $xd.value  + " , " + $y.value + "." + $yd.value+ " , " + $z.value + "." + $zd.value+" , "+ $t.value+ " )\');"

+"\n"+"Pxyz=["+ $x.value + "." + $xd.value  + " , " + $y.value + "." + $yd.value+ " , " + $z.value + "." + $zd.value+"]\';"
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"\% 		APROXIMACION"
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"px=Pxyz(1,1);"
+"\n"+"py=Pxyz(2,1)-.5;"
+"\n"+"pz=Pxyz(3,1);"

+"\n"+"\%-----------------------------------------------"
+"\n"+"q1s = pz;"
+"\n"+"q2s = px;"

+"\n"+"if (py > 0.53) & (py <= 5.97) "
+"\n"+"    q3s =acos((py/2)/arm_lenght);"
+"\n"+"    q4s =2*asin((py/2)/arm_lenght);"
+"\n"+"end"

+"\n"+"if ( imag(q3s) ~= 0 ) | (imag(q4s) ~= 0 )"
+"\n"+"    display(\'Punto inalcanzable. Ubicado fuera del espacio de trabajo\')  "

+"\n"+"else"
+"\n"+"    qi=[q1s q2s q3s q4s 0];"

+"\n"+"    if ( qi(1,1:4) <= qmax ) & ( qi(1,1:4) >= qmin )        "

+"\n"+"        N=" +$t.value + ";"
+"\n"+"        inc_q=(qi-qa)/N;"

+"\n"+"        for( j=1:1:N )"
+"\n"+"            q(j,:)= qa + j*inc_q ;    \% Interpolación lineal"
+"\n"+"        end"

+"\n"+"        for j=1:1:size(q,1)"
+"\n"+"            for h=1:1:size(q,2)"
+"\n"+"                fprintf(fd,\'\%2.3f   \',q(j,h));"
+"\n"+"            end"
+"\n"+"                fprintf(fd,\' ;\\n\');"
+"\n"+"            qa=q(j,:);"
+"\n"+"        end"
+"\n"+"    else"
+"\n"+"        display(\'Los valores de q están fuera de rango\');    "
+"\n"+"    end"

+"\n"+"end    "
    
+"\n"+"q=zeros(1,5);"
+"\n"+"qa;"			


+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"\% 		MOVIMIENTO FINAL"
+"\n"+"\%--------------------------------------------------------------------------"
+"\n"+"px=Pxyz(1,1);"
+"\n"+"py=Pxyz(2,1);"
+"\n"+"pz=Pxyz(3,1);"

+"\n"+"\%-----------------------------------------------"
+"\n"+"q1s = pz;"
+"\n"+"q2s = px;"

+"\n"+"if (py > 0.53) & (py <= 5.97) "
+"\n"+"    q3s =acos((py/2)/arm_lenght);"
+"\n"+"    q4s =2*asin((py/2)/arm_lenght);"
+"\n"+"end"

+"\n"+"if ( imag(q3s) ~= 0 ) | (imag(q4s) ~= 0 )"
+"\n"+"    display(\'Punto inalcanzable. Ubicado fuera del espacio de trabajo\')  "

+"\n"+"else"
+"\n"+"    qi=[q1s q2s q3s q4s 0];"

+"\n"+"    if ( qi(1,1:4) <= qmax ) & ( qi(1,1:4) >= qmin )        "

+"\n"+"        N=" +$t.value + ";"
+"\n"+"        inc_q=(qi-qa)/N;"

+"\n"+"        for( j=1:1:N )"
+"\n"+"            q(j,:)= qa + j*inc_q ;    \% Interpolación lineal"
+"\n"+"        end"

+"\n"+"        for j=1:1:size(q,1)"
+"\n"+"            for h=1:1:size(q,2)"
+"\n"+"                fprintf(fd,\'\%2.3f   \',q(j,h));"
+"\n"+"            end"
+"\n"+"                fprintf(fd,\' ;\\n\');"
+"\n"+"            qa=q(j,:);"
+"\n"+"        end"
+"\n"+"    else"
+"\n"+"        display(\'Los valores de q están fuera de rango\');    "
+"\n"+"    end"

+"\n"+"end    "
    
+"\n"+"q=zeros(1,5);"
+"\n"+"qa;"
	
	);

	
};



factor	returns [int value]
    :   NUMBER {$value = Integer.parseInt($NUMBER.text);}
    |	ID
	{
        Integer v = (Integer)variables.get($ID.text);
        if ( v!=null ) $value = v.intValue();
        else System.err.println("Variable no definida: "+$ID.text);
        };

/*------------------------------------------------------------------
 * LEXER RULES
 *------------------------------------------------------------------*/

ID  :   ('a'..'z'|'A'..'Z')+ ;

NUMBER	:	SIGNO? DIGIT ;

WHITESPACE : ( '\t' | ' ' | '\r' | '\n'| '\u000C' )+ 	{ $channel = HIDDEN; } ;

fragment DIGIT	: ('0'..'9')+ ;

SIGNO 	: '+' | '-';

PUNTO 	:	'.';