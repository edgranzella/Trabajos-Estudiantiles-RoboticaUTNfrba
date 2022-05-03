grammar JarvisCommand;

tokens{
	TURN_LEFT ='Doblar_Izq';
	TURN_RIGHT ='Doblar_Der';
	FORWARD ='Adelante';
	INIT ='Iniciar';
	FINISH ='Terminar';
	PAR1   = '('	;
	PAR2   = ')'	;
	COMA   = ','	;
}

@header{ 

	import java.util.ArrayList;
	import java.lang.Math;
	import java.io.PrintWriter;		// Para generar el script de salida
	import java.util.HashMap;		// Para almacenar variables
	import java.io.BufferedReader;		// Para leer la base del script a generar
	import java.io.File;
}

@members {
	PrintWriter writer;
	HashMap variables = new HashMap();
	HashMap valores = new HashMap();
	int flag = 0;
	public void main(String[] args) throws Exception {
		JarvisCommandLexer lex = new JarvisCommandLexer(new ANTLRFileStream(args[0]));
		CommonTokenStream tokens = new CommonTokenStream(lex);
		JarvisCommandParser parser = new JarvisCommandParser(tokens);
		try {
			parser.expr();
		}catch (RecognitionException e){
			e.printStackTrace();
		}
	
	}
}

/*------------------------------------------------------------------
 * PARSER RULES
 *------------------------------------------------------------------*/	
 
 expr_init  :	(func5) & expr & (func6);
 expr	:	((func2) | (func3) | (func4))+;
	
 
 quarter returns [int value]
 	: NUM_ENTERO 
 	{
 	$value = Integer.parseInt($NUM_ENTERO.text);
 	if($value < 1 || $value > 2) {
 		System.err.println("Error en el ángulo de giro");
 		$value = 255;
 	} 
 	}
 ;
 
 percent returns [int value]
 	: NUM_ENTERO 
 	{
 	$value = Integer.parseInt($NUM_ENTERO.text);
 	if($value < 0 || $value > 100) {
 		System.err.println("Error en el ángulo de giro");
 		$value = 255;
 	} 
 	}
 ;

lenght returns [Double value]
 	:	
	NUM_FLOT
	{
 	$value = Double.parseDouble($NUM_FLOT.text);
 	if($value <= 0.0){
 	 	System.err.println("El largo de avance no debe ser negativo");
 	 	$value = -1.0;
 	}
 	} 
 ;

radio returns [Double value]
 	:	
	NUM_FLOT
	{
 	$value = Double.parseDouble($NUM_FLOT.text);
 	if($value <= 0.0){
 	 	System.err.println("El radio de la curva no debe ser negativo");
 	 	$value = -1.0;
 	}
 	} 
 ;

speed returns [Double value]
 	:	
	NUM_FLOT
	{
 	$value = Double.parseDouble($NUM_FLOT.text);
 	if($value <= 0.0){
 	 	System.err.println("La velocidad de movimiento no debe ser negativa");
 	 	$value = -1.0;
 	}
 	} 
 ;


func2	:
	TURN_LEFT PAR1 r=radio COMA g=quarter COMA acc=percent COMA desc=percent COMA vel1=speed COMA vel2=speed PAR2
	{
		if(flag == 0 || $r.value == -1.0 || $g.value == 255 || $acc.value == 255 || $vel1.value == -1.0 || $vel2.value == -1.0 || $desc.value == 255)
			System.err.println("Error de Compilación");
				else	{
					// GENERACION DE SCRIPT PARA MATLAB
					System.out.println("\%Giro a la izquierda");
					System.out.println("Last_Vel = Tray.v(Tray.ind);");
					System.out.println("Tray = Change_Vel(Last_Vel , "+$vel1.value+","+$acc.value+", Tray);\%velocidad de recorrido");
					System.out.println("Tray = Change_Vel(Last_Vel , "+$vel1.value+",100 - "+$acc.value+" - "+$desc.value+", Tray);\%velocidad de recorrido");
					System.out.println("Tray = Change_Vel("+$vel1.value+" , "+$vel2.value+","+$desc.value+", Tray);\%velocidad de recorrido");
										
					System.out.println("Last_X = Tray.x(Tray.ind);");
					System.out.println("Last_Y = Tray.y(Tray.ind);");
					
					System.out.println("Orient = Get_Orient(Tray);\%Orientación  a partir de los 2 últimos puntos");
					
					System.out.println("if(Orient == 1)");
					if($g.value == 2)
					System.out.println("Tray = plot_arc(-pi/2,pi/2,Last_X,Last_Y + "+$r.value+","+$r.value+", Tray);\%Trazo curva a la izquierda");
					else
					System.out.println("Tray = plot_arc(-pi/2,0,Last_X,Last_Y + "+$r.value+","+$r.value+", Tray);\%Trazo curva a la izquierda");
					System.out.println("end");
					
					System.out.println("if(Orient == 2)");
					if($g.value == 2)
					System.out.println("Tray = plot_arc(0,pi,Last_X - "+$r.value+",Last_Y,"+$r.value+", Tray);\%Trazo curva a la izquierda");
					else
					System.out.println("Tray = plot_arc(0,pi/2,Last_X - "+$r.value+",Last_Y,"+$r.value+", Tray);\%Trazo curva a la izquierda");
					System.out.println("end");
					
					System.out.println("if(Orient == 3)");
					if($g.value == 2)
					System.out.println("Tray = plot_arc(pi/2,1.5*pi,Last_X,Last_Y - "+$r.value+","+$r.value+", Tray);\%Trazo curva a la izquierda");
					else
					System.out.println("Tray = plot_arc(pi/2,pi,Last_X,Last_Y - "+$r.value+","+$r.value+", Tray);\%Trazo curva a la izquierda");
					System.out.println("end");
					
					System.out.println("if(Orient == 4)");
					if($g.value == 2)
					System.out.println("Tray = plot_arc(-pi,0,Last_X + "+$r.value+",Last_Y,"+$r.value+", Tray);\%Trazo curva a la izquierda");
					else
					System.out.println("Tray = plot_arc(-pi,-pi/2,Last_X + "+$r.value+",Last_Y,"+$r.value+", Tray);\%Trazo curva a la izquierda");
					System.out.println("end");
					}
	}
	;

func3	:
	TURN_RIGHT PAR1 r=radio COMA g=quarter COMA acc=percent COMA desc=percent COMA vel1=speed COMA vel2=speed PAR2
	{
		if(flag == 0 || $r.value == -1.0 || $g.value == 255 || $acc.value == 255 || $vel1.value == -1.0 || $vel2.value == -1.0 || $desc.value == 255)
			System.err.println("Error de Compilación");
				else	{
					// GENERACION DE SCRIPT PARA MATLAB
					System.out.println("\%Giro a la derecha");
					System.out.println("Last_Vel = Tray.v(Tray.ind);");
					System.out.println("Tray = Change_Vel(Last_Vel , "+$vel1.value+","+$acc.value+", Tray);\%velocidad de recorrido");
					System.out.println("Tray = Change_Vel(Last_Vel , "+$vel1.value+",100 - "+$acc.value+" - "+$desc.value+", Tray);\%velocidad de recorrido");
					System.out.println("Tray = Change_Vel("+$vel1.value+" , "+$vel2.value+","+$desc.value+", Tray);\%velocidad de recorrido");
										
					System.out.println("Last_X = Tray.x(Tray.ind);");
					System.out.println("Last_Y = Tray.y(Tray.ind);");
					
					System.out.println("Orient = Get_Orient(Tray);\%Orientación  a partir de los 2 últimos puntos");
					
					System.out.println("if(Orient == 1)");
					if($g.value == 2)
					System.out.println("Tray = plot_arc(pi/2,-pi/2,Last_X,Last_Y - "+$r.value+","+$r.value+", Tray);\%Trazo curva a la derecha");
					else
					System.out.println("Tray = plot_arc(pi/2,0,Last_X,Last_Y - "+$r.value+","+$r.value+", Tray);\%Trazo curva a la derecha");
					System.out.println("end");
					
					System.out.println("if(Orient == 2)");
					if($g.value == 2)
					System.out.println("Tray = plot_arc(pi,0,Last_X + "+$r.value+",Last_Y,"+$r.value+", Tray);\%Trazo curva a la derecha");
					else
					System.out.println("Tray = plot_arc(pi,pi/2,Last_X + "+$r.value+",Last_Y,"+$r.value+", Tray);\%Trazo curva a la derecha");
					System.out.println("end");
					
					System.out.println("if(Orient == 3)");
					if($g.value == 2)
					System.out.println("Tray = plot_arc(1.5*pi,pi/2,Last_X,Last_Y + "+$r.value+","+$r.value+", Tray);\%Trazo curva a la derecha");
					else
					System.out.println("Tray = plot_arc(-pi/2,-pi,Last_X,Last_Y + "+$r.value+","+$r.value+", Tray);\%Trazo curva a la derecha");
					System.out.println("end");
					
					System.out.println("if(Orient == 4)");
					if($g.value == 2)
					System.out.println("Tray = plot_arc(0,-pi,Last_X - "+$r.value+",Last_Y,"+$r.value+", Tray);\%Trazo curva a la derecha");
					else
					System.out.println("Tray = plot_arc(0,-pi/2,Last_X - "+$r.value+",Last_Y,"+$r.value+", Tray);\%Trazo curva a la derecha");
					System.out.println("end");
					}
	}
	;

func4	:
	FORWARD PAR1 len=lenght COMA acc=percent COMA desc=percent COMA vel1=speed COMA vel2=speed PAR2
	{
		if(flag == 0 || $len.value == -1.0 || $acc.value == 255 || $vel1.value == -1.0 || $vel2.value == -1.0 || $desc.value == 255)
			System.err.println("Error de Compilación");
		
		else {
			// GENERACION DE SCRIPT PARA MATLAB
			System.out.println("\%Tramo rectilíneo");
			System.out.println("Last_Vel = Tray.v(Tray.ind);");
			System.out.println("Tray = Change_Vel(Last_Vel , "+$vel1.value+","+$acc.value+", Tray);\%velocidad de recorrido");
			System.out.println("Tray = Change_Vel(Last_Vel , "+$vel1.value+",100 - "+$acc.value+" - "+$desc.value+", Tray);\%velocidad de recorrido");
			System.out.println("Tray = Change_Vel("+$vel1.value+" , "+$vel2.value+","+$desc.value+", Tray);\%velocidad de recorrido");
						
			System.out.println("Last_X = Tray.x(Tray.ind);\%Posición de último punto de la trayectoria");
			System.out.println("Last_Y = Tray.y(Tray.ind);\%Posición de último punto de la trayectoria");
			System.out.println("Orient = Get_Orient(Tray);\%Orientación  a partir de los 2 últimos puntos");
			System.out.println("if(Orient == 1)");
			System.out.println("Tray = plot_line(Last_X,Last_Y,Last_X + "+$len.value+",Last_Y,Tray);\%Trazo el tramo de trayectoria");
			System.out.println("end");
			System.out.println("if(Orient == 2)");
			System.out.println("Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y + "+$len.value+",Tray);\%Trazo el tramo de trayectoria");
			System.out.println("end");
			System.out.println("if(Orient == 3)");
			System.out.println("Tray = plot_line(Last_X,Last_Y,Last_X - "+$len.value+",Last_Y,Tray);\%Trazo el tramo de trayectoria");
			System.out.println("end");
			System.out.println("if(Orient == 4)");
			System.out.println("Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y - "+$len.value+",Tray);\%Trazo el tramo de trayectoria");
			System.out.println("end");
			//System.out.println("Last_Vel = Tray.v(Tray.ind);");
			//System.out.println("Tray = Change_Vel(Last_Vel, Last_Vel ,"+$len.value+", Tray);\%velocidad de recorrido");
			}
	}
	;


func5	:
	INIT PAR1 PAR2
	{
	flag = 1;
	System.out.println("function H = Trayectoria1(Tray)");	
	}
	;

func6	:
	FINISH PAR1 PAR2
	{
	if (flag == 0)
	return;
	
	System.out.println("\%Eliminar elementos repetidos. No debe haber 2 puntos consecutivos");
	System.out.println("\%del vector con las mismas coordenadas x, y.");
	System.out.println("i=2;");
	System.out.println("barrer = 0;");
	System.out.println("while (barrer == 0)");
    	System.out.println("if(i ==  length(Tray.x))");
    	System.out.println("barrer = 1;");    
    	System.out.println("else");
        System.out.println("if(Tray.x(i) == Tray.x(i-1))");
        System.out.println("Tray.x(i)=[];\%Igualando a '[]' elimino el elemento");
        System.out.println("Tray.y(i)=[];");
        System.out.println("Tray.v(i)=[];");
        System.out.println("Tray.ind = length(Tray.x);\%Corrijo el nro de posiciones de Tray");
        System.out.println("end");
    	System.out.println("i = i + 1;");
    	System.out.println("end");
    	System.out.println("end");

	System.out.println("H.x = Tray.x;");
	System.out.println("H.y = Tray.y;");
	System.out.println("H.v = Tray.v;");
	System.out.println("H.ind = Tray.ind;"); 
	System.out.println("if ~nargout");
    	System.out.println("display('Función Trayectoria() - Se requieren argumentos')");
    	System.out.println("return;");
	System.out.println("end");
		
	// FIN DE GENERACION DE SCRIPT
	System.out.flush();
	System.out.println("\%Compilación exitosa.");	 	
	}
	;

	
 /*------------------------------------------------------------------
 * LEXER RULES
 *------------------------------------------------------------------*/
 WHITESPACE : ( '\t' | ' ' | '\r' | '\n'| '\u000C' )+ 	{ $channel = HIDDEN; } ;
 NUM_ENTERO 	:	INTEGER;
 NUM_FLOT	:	FLOAT;
 fragment SIGN 	:	 ('+'|'-');
 fragment FLOAT  :   INTEGER '.' '0'..'9'+;	
 fragment INTEGER : (SIGN)? ('0'..'9')+;