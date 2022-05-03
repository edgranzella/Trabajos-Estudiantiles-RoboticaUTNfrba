// $ANTLR 3.5.1 C:\\ANTRL\\JarvisCommand.g 2016-04-01 16:02:39
 

	import java.util.ArrayList;
	import java.lang.Math;
	import java.io.PrintWriter;		// Para generar el script de salida
	import java.util.HashMap;		// Para almacenar variables
	import java.io.BufferedReader;		// Para leer la base del script a generar
	import java.io.File;


import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

import org.antlr.runtime.debug.*;
import java.io.IOException;
@SuppressWarnings("all")
public class JarvisCommandParser extends DebugParser {
	public static final String[] tokenNames = new String[] {
		"<invalid>", "<EOR>", "<DOWN>", "<UP>", "COMA", "FINISH", "FLOAT", "FORWARD", 
		"INIT", "INTEGER", "NUM_ENTERO", "NUM_FLOT", "PAR1", "PAR2", "SIGN", "TURN_LEFT", 
		"TURN_RIGHT", "WHITESPACE"
	};
	public static final int EOF=-1;
	public static final int COMA=4;
	public static final int FINISH=5;
	public static final int FLOAT=6;
	public static final int FORWARD=7;
	public static final int INIT=8;
	public static final int INTEGER=9;
	public static final int NUM_ENTERO=10;
	public static final int NUM_FLOT=11;
	public static final int PAR1=12;
	public static final int PAR2=13;
	public static final int SIGN=14;
	public static final int TURN_LEFT=15;
	public static final int TURN_RIGHT=16;
	public static final int WHITESPACE=17;

	// delegates
	public Parser[] getDelegates() {
		return new Parser[] {};
	}

	// delegators


	public static final String[] ruleNames = new String[] {
		"invalidRule", "percent", "func4", "radio", "lenght", "func6", "expr", 
		"func3", "expr_init", "func2", "speed", "quarter", "func5"
	};

	public static final boolean[] decisionCanBacktrack = new boolean[] {
		false, // invalid decision
		false
	};

 
	public int ruleLevel = 0;
	public int getRuleLevel() { return ruleLevel; }
	public void incRuleLevel() { ruleLevel++; }
	public void decRuleLevel() { ruleLevel--; }
	public JarvisCommandParser(TokenStream input) {
		this(input, DebugEventSocketProxy.DEFAULT_DEBUGGER_PORT, new RecognizerSharedState());
	}
	public JarvisCommandParser(TokenStream input, int port, RecognizerSharedState state) {
		super(input, state);
		DebugEventSocketProxy proxy =
			new DebugEventSocketProxy(this, port, null);

		setDebugListener(proxy);
		try {
			proxy.handshake();
		}
		catch (IOException ioe) {
			reportError(ioe);
		}
	}

	public JarvisCommandParser(TokenStream input, DebugEventListener dbg) {
		super(input, dbg, new RecognizerSharedState());
	}

	protected boolean evalPredicate(boolean result, String predicate) {
		dbg.semanticPredicate(result, predicate);
		return result;
	}

	@Override public String[] getTokenNames() { return JarvisCommandParser.tokenNames; }
	@Override public String getGrammarFileName() { return "C:\\ANTRL\\JarvisCommand.g"; }


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



	// $ANTLR start "expr_init"
	// C:\\ANTRL\\JarvisCommand.g:46:2: expr_init : ( func5 ) expr ( func6 ) ;
	public final void expr_init() throws RecognitionException {
		try { dbg.enterRule(getGrammarFileName(), "expr_init");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(46, 1);

		try {
			// C:\\ANTRL\\JarvisCommand.g:46:13: ( ( func5 ) expr ( func6 ) )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:46:15: ( func5 ) expr ( func6 )
			{
			dbg.location(46,15);
			// C:\\ANTRL\\JarvisCommand.g:46:15: ( func5 )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:46:16: func5
			{
			dbg.location(46,16);
			pushFollow(FOLLOW_func5_in_expr_init102);
			func5();
			state._fsp--;

			}
			dbg.location(46,25);
			pushFollow(FOLLOW_expr_in_expr_init106);
			expr();
			state._fsp--;
			dbg.location(46,32);
			// C:\\ANTRL\\JarvisCommand.g:46:32: ( func6 )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:46:33: func6
			{
			dbg.location(46,33);
			pushFollow(FOLLOW_func6_in_expr_init110);
			func6();
			state._fsp--;

			}

			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(46, 38);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "expr_init");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

	}
	// $ANTLR end "expr_init"



	// $ANTLR start "expr"
	// C:\\ANTRL\\JarvisCommand.g:47:2: expr : ( ( func2 ) | ( func3 ) | ( func4 ) )+ ;
	public final void expr() throws RecognitionException {
		try { dbg.enterRule(getGrammarFileName(), "expr");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(47, 1);

		try {
			// C:\\ANTRL\\JarvisCommand.g:47:7: ( ( ( func2 ) | ( func3 ) | ( func4 ) )+ )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:47:9: ( ( func2 ) | ( func3 ) | ( func4 ) )+
			{
			dbg.location(47,9);
			// C:\\ANTRL\\JarvisCommand.g:47:9: ( ( func2 ) | ( func3 ) | ( func4 ) )+
			int cnt1=0;
			try { dbg.enterSubRule(1);

			loop1:
			while (true) {
				int alt1=4;
				try { dbg.enterDecision(1, decisionCanBacktrack[1]);

				switch ( input.LA(1) ) {
				case TURN_LEFT:
					{
					alt1=1;
					}
					break;
				case TURN_RIGHT:
					{
					alt1=2;
					}
					break;
				case FORWARD:
					{
					alt1=3;
					}
					break;
				}
				} finally {dbg.exitDecision(1);}

				switch (alt1) {
				case 1 :
					dbg.enterAlt(1);

					// C:\\ANTRL\\JarvisCommand.g:47:10: ( func2 )
					{
					dbg.location(47,10);
					// C:\\ANTRL\\JarvisCommand.g:47:10: ( func2 )
					dbg.enterAlt(1);

					// C:\\ANTRL\\JarvisCommand.g:47:11: func2
					{
					dbg.location(47,11);
					pushFollow(FOLLOW_func2_in_expr121);
					func2();
					state._fsp--;

					}

					}
					break;
				case 2 :
					dbg.enterAlt(2);

					// C:\\ANTRL\\JarvisCommand.g:47:20: ( func3 )
					{
					dbg.location(47,20);
					// C:\\ANTRL\\JarvisCommand.g:47:20: ( func3 )
					dbg.enterAlt(1);

					// C:\\ANTRL\\JarvisCommand.g:47:21: func3
					{
					dbg.location(47,21);
					pushFollow(FOLLOW_func3_in_expr127);
					func3();
					state._fsp--;

					}

					}
					break;
				case 3 :
					dbg.enterAlt(3);

					// C:\\ANTRL\\JarvisCommand.g:47:30: ( func4 )
					{
					dbg.location(47,30);
					// C:\\ANTRL\\JarvisCommand.g:47:30: ( func4 )
					dbg.enterAlt(1);

					// C:\\ANTRL\\JarvisCommand.g:47:31: func4
					{
					dbg.location(47,31);
					pushFollow(FOLLOW_func4_in_expr133);
					func4();
					state._fsp--;

					}

					}
					break;

				default :
					if ( cnt1 >= 1 ) break loop1;
					EarlyExitException eee = new EarlyExitException(1, input);
					dbg.recognitionException(eee);

					throw eee;
				}
				cnt1++;
			}
			} finally {dbg.exitSubRule(1);}

			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(47, 38);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "expr");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

	}
	// $ANTLR end "expr"



	// $ANTLR start "quarter"
	// C:\\ANTRL\\JarvisCommand.g:50:2: quarter returns [int value] : NUM_ENTERO ;
	public final int quarter() throws RecognitionException {
		int value = 0;


		Token NUM_ENTERO1=null;

		try { dbg.enterRule(getGrammarFileName(), "quarter");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(50, 1);

		try {
			// C:\\ANTRL\\JarvisCommand.g:51:3: ( NUM_ENTERO )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:51:5: NUM_ENTERO
			{
			dbg.location(51,5);
			NUM_ENTERO1=(Token)match(input,NUM_ENTERO,FOLLOW_NUM_ENTERO_in_quarter154); dbg.location(52,3);

			 	value = Integer.parseInt((NUM_ENTERO1!=null?NUM_ENTERO1.getText():null));
			 	if(value < 1 || value > 2) {
			 		System.err.println("Error en el ángulo de giro");
			 		value = 255;
			 	} 
			 	
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(59, 1);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "quarter");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

		return value;
	}
	// $ANTLR end "quarter"



	// $ANTLR start "percent"
	// C:\\ANTRL\\JarvisCommand.g:61:2: percent returns [int value] : NUM_ENTERO ;
	public final int percent() throws RecognitionException {
		int value = 0;


		Token NUM_ENTERO2=null;

		try { dbg.enterRule(getGrammarFileName(), "percent");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(61, 1);

		try {
			// C:\\ANTRL\\JarvisCommand.g:62:3: ( NUM_ENTERO )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:62:5: NUM_ENTERO
			{
			dbg.location(62,5);
			NUM_ENTERO2=(Token)match(input,NUM_ENTERO,FOLLOW_NUM_ENTERO_in_percent177); dbg.location(63,3);

			 	value = Integer.parseInt((NUM_ENTERO2!=null?NUM_ENTERO2.getText():null));
			 	if(value < 0 || value > 100) {
			 		System.err.println("Error en el ángulo de giro");
			 		value = 255;
			 	} 
			 	
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(70, 1);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "percent");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

		return value;
	}
	// $ANTLR end "percent"



	// $ANTLR start "lenght"
	// C:\\ANTRL\\JarvisCommand.g:72:1: lenght returns [Double value] : NUM_FLOT ;
	public final Double lenght() throws RecognitionException {
		Double value = null;


		Token NUM_FLOT3=null;

		try { dbg.enterRule(getGrammarFileName(), "lenght");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(72, 0);

		try {
			// C:\\ANTRL\\JarvisCommand.g:73:3: ( NUM_FLOT )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:74:2: NUM_FLOT
			{
			dbg.location(74,2);
			NUM_FLOT3=(Token)match(input,NUM_FLOT,FOLLOW_NUM_FLOT_in_lenght200); dbg.location(75,2);

			 	value = Double.parseDouble((NUM_FLOT3!=null?NUM_FLOT3.getText():null));
			 	if(value <= 0.0){
			 	 	System.err.println("El largo de avance no debe ser negativo");
			 	 	value = -1.0;
			 	}
			 	
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(82, 1);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "lenght");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

		return value;
	}
	// $ANTLR end "lenght"



	// $ANTLR start "radio"
	// C:\\ANTRL\\JarvisCommand.g:84:1: radio returns [Double value] : NUM_FLOT ;
	public final Double radio() throws RecognitionException {
		Double value = null;


		Token NUM_FLOT4=null;

		try { dbg.enterRule(getGrammarFileName(), "radio");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(84, 0);

		try {
			// C:\\ANTRL\\JarvisCommand.g:85:3: ( NUM_FLOT )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:86:2: NUM_FLOT
			{
			dbg.location(86,2);
			NUM_FLOT4=(Token)match(input,NUM_FLOT,FOLLOW_NUM_FLOT_in_radio222); dbg.location(87,2);

			 	value = Double.parseDouble((NUM_FLOT4!=null?NUM_FLOT4.getText():null));
			 	if(value <= 0.0){
			 	 	System.err.println("El radio de la curva no debe ser negativo");
			 	 	value = -1.0;
			 	}
			 	
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(94, 1);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "radio");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

		return value;
	}
	// $ANTLR end "radio"



	// $ANTLR start "speed"
	// C:\\ANTRL\\JarvisCommand.g:96:1: speed returns [Double value] : NUM_FLOT ;
	public final Double speed() throws RecognitionException {
		Double value = null;


		Token NUM_FLOT5=null;

		try { dbg.enterRule(getGrammarFileName(), "speed");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(96, 0);

		try {
			// C:\\ANTRL\\JarvisCommand.g:97:3: ( NUM_FLOT )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:98:2: NUM_FLOT
			{
			dbg.location(98,2);
			NUM_FLOT5=(Token)match(input,NUM_FLOT,FOLLOW_NUM_FLOT_in_speed244); dbg.location(99,2);

			 	value = Double.parseDouble((NUM_FLOT5!=null?NUM_FLOT5.getText():null));
			 	if(value <= 0.0){
			 	 	System.err.println("La velocidad de movimiento no debe ser negativa");
			 	 	value = -1.0;
			 	}
			 	
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(106, 1);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "speed");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

		return value;
	}
	// $ANTLR end "speed"



	// $ANTLR start "func2"
	// C:\\ANTRL\\JarvisCommand.g:109:1: func2 : TURN_LEFT PAR1 r= radio COMA g= quarter COMA acc= percent COMA desc= percent COMA vel1= speed COMA vel2= speed PAR2 ;
	public final void func2() throws RecognitionException {
		Double r =null;
		int g =0;
		int acc =0;
		int desc =0;
		Double vel1 =null;
		Double vel2 =null;

		try { dbg.enterRule(getGrammarFileName(), "func2");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(109, 0);

		try {
			// C:\\ANTRL\\JarvisCommand.g:109:7: ( TURN_LEFT PAR1 r= radio COMA g= quarter COMA acc= percent COMA desc= percent COMA vel1= speed COMA vel2= speed PAR2 )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:110:2: TURN_LEFT PAR1 r= radio COMA g= quarter COMA acc= percent COMA desc= percent COMA vel1= speed COMA vel2= speed PAR2
			{
			dbg.location(110,2);
			match(input,TURN_LEFT,FOLLOW_TURN_LEFT_in_func2260); dbg.location(110,12);
			match(input,PAR1,FOLLOW_PAR1_in_func2262); dbg.location(110,18);
			pushFollow(FOLLOW_radio_in_func2266);
			r=radio();
			state._fsp--;
			dbg.location(110,25);
			match(input,COMA,FOLLOW_COMA_in_func2268); dbg.location(110,31);
			pushFollow(FOLLOW_quarter_in_func2272);
			g=quarter();
			state._fsp--;
			dbg.location(110,40);
			match(input,COMA,FOLLOW_COMA_in_func2274); dbg.location(110,48);
			pushFollow(FOLLOW_percent_in_func2278);
			acc=percent();
			state._fsp--;
			dbg.location(110,57);
			match(input,COMA,FOLLOW_COMA_in_func2280); dbg.location(110,66);
			pushFollow(FOLLOW_percent_in_func2284);
			desc=percent();
			state._fsp--;
			dbg.location(110,75);
			match(input,COMA,FOLLOW_COMA_in_func2286); dbg.location(110,84);
			pushFollow(FOLLOW_speed_in_func2290);
			vel1=speed();
			state._fsp--;
			dbg.location(110,91);
			match(input,COMA,FOLLOW_COMA_in_func2292); dbg.location(110,100);
			pushFollow(FOLLOW_speed_in_func2296);
			vel2=speed();
			state._fsp--;
			dbg.location(110,107);
			match(input,PAR2,FOLLOW_PAR2_in_func2298); dbg.location(111,2);

					if(flag == 0 || r == -1.0 || g == 255 || acc == 255 || vel1 == -1.0 || vel2 == -1.0 || desc == 255)
						System.err.println("Error de Compilación");
							else	{
								// GENERACION DE SCRIPT PARA MATLAB
								System.out.println("%Giro a la izquierda");
								System.out.println("Last_Vel = Tray.v(Tray.ind);");
								System.out.println("Tray = Change_Vel(Last_Vel , "+vel1+","+acc+", Tray);%velocidad de recorrido");
								System.out.println("Tray = Change_Vel(Last_Vel , "+vel1+",100 - "+acc+" - "+desc+", Tray);%velocidad de recorrido");
								System.out.println("Tray = Change_Vel("+vel1+" , "+vel2+","+desc+", Tray);%velocidad de recorrido");
													
								System.out.println("Last_X = Tray.x(Tray.ind);");
								System.out.println("Last_Y = Tray.y(Tray.ind);");
								
								System.out.println("Orient = Get_Orient(Tray);%Orientación  a partir de los 2 últimos puntos");
								
								System.out.println("if(Orient == 1)");
								if(g == 2)
								System.out.println("Tray = plot_arc(-pi/2,pi/2,Last_X,Last_Y + "+r+","+r+", Tray);%Trazo curva a la izquierda");
								else
								System.out.println("Tray = plot_arc(-pi/2,0,Last_X,Last_Y + "+r+","+r+", Tray);%Trazo curva a la izquierda");
								System.out.println("end");
								
								System.out.println("if(Orient == 2)");
								if(g == 2)
								System.out.println("Tray = plot_arc(0,pi,Last_X - "+r+",Last_Y,"+r+", Tray);%Trazo curva a la izquierda");
								else
								System.out.println("Tray = plot_arc(0,pi/2,Last_X - "+r+",Last_Y,"+r+", Tray);%Trazo curva a la izquierda");
								System.out.println("end");
								
								System.out.println("if(Orient == 3)");
								if(g == 2)
								System.out.println("Tray = plot_arc(pi/2,1.5*pi,Last_X,Last_Y - "+r+","+r+", Tray);%Trazo curva a la izquierda");
								else
								System.out.println("Tray = plot_arc(pi/2,pi,Last_X,Last_Y - "+r+","+r+", Tray);%Trazo curva a la izquierda");
								System.out.println("end");
								
								System.out.println("if(Orient == 4)");
								if(g == 2)
								System.out.println("Tray = plot_arc(-pi,0,Last_X + "+r+",Last_Y,"+r+", Tray);%Trazo curva a la izquierda");
								else
								System.out.println("Tray = plot_arc(-pi,-pi/2,Last_X + "+r+",Last_Y,"+r+", Tray);%Trazo curva a la izquierda");
								System.out.println("end");
								}
				
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(156, 1);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "func2");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

	}
	// $ANTLR end "func2"



	// $ANTLR start "func3"
	// C:\\ANTRL\\JarvisCommand.g:158:1: func3 : TURN_RIGHT PAR1 r= radio COMA g= quarter COMA acc= percent COMA desc= percent COMA vel1= speed COMA vel2= speed PAR2 ;
	public final void func3() throws RecognitionException {
		Double r =null;
		int g =0;
		int acc =0;
		int desc =0;
		Double vel1 =null;
		Double vel2 =null;

		try { dbg.enterRule(getGrammarFileName(), "func3");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(158, 0);

		try {
			// C:\\ANTRL\\JarvisCommand.g:158:7: ( TURN_RIGHT PAR1 r= radio COMA g= quarter COMA acc= percent COMA desc= percent COMA vel1= speed COMA vel2= speed PAR2 )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:159:2: TURN_RIGHT PAR1 r= radio COMA g= quarter COMA acc= percent COMA desc= percent COMA vel1= speed COMA vel2= speed PAR2
			{
			dbg.location(159,2);
			match(input,TURN_RIGHT,FOLLOW_TURN_RIGHT_in_func3312); dbg.location(159,13);
			match(input,PAR1,FOLLOW_PAR1_in_func3314); dbg.location(159,19);
			pushFollow(FOLLOW_radio_in_func3318);
			r=radio();
			state._fsp--;
			dbg.location(159,26);
			match(input,COMA,FOLLOW_COMA_in_func3320); dbg.location(159,32);
			pushFollow(FOLLOW_quarter_in_func3324);
			g=quarter();
			state._fsp--;
			dbg.location(159,41);
			match(input,COMA,FOLLOW_COMA_in_func3326); dbg.location(159,49);
			pushFollow(FOLLOW_percent_in_func3330);
			acc=percent();
			state._fsp--;
			dbg.location(159,58);
			match(input,COMA,FOLLOW_COMA_in_func3332); dbg.location(159,67);
			pushFollow(FOLLOW_percent_in_func3336);
			desc=percent();
			state._fsp--;
			dbg.location(159,76);
			match(input,COMA,FOLLOW_COMA_in_func3338); dbg.location(159,85);
			pushFollow(FOLLOW_speed_in_func3342);
			vel1=speed();
			state._fsp--;
			dbg.location(159,92);
			match(input,COMA,FOLLOW_COMA_in_func3344); dbg.location(159,101);
			pushFollow(FOLLOW_speed_in_func3348);
			vel2=speed();
			state._fsp--;
			dbg.location(159,108);
			match(input,PAR2,FOLLOW_PAR2_in_func3350); dbg.location(160,2);

					if(flag == 0 || r == -1.0 || g == 255 || acc == 255 || vel1 == -1.0 || vel2 == -1.0 || desc == 255)
						System.err.println("Error de Compilación");
							else	{
								// GENERACION DE SCRIPT PARA MATLAB
								System.out.println("%Giro a la derecha");
								System.out.println("Last_Vel = Tray.v(Tray.ind);");
								System.out.println("Tray = Change_Vel(Last_Vel , "+vel1+","+acc+", Tray);%velocidad de recorrido");
								System.out.println("Tray = Change_Vel(Last_Vel , "+vel1+",100 - "+acc+" - "+desc+", Tray);%velocidad de recorrido");
								System.out.println("Tray = Change_Vel("+vel1+" , "+vel2+","+desc+", Tray);%velocidad de recorrido");
													
								System.out.println("Last_X = Tray.x(Tray.ind);");
								System.out.println("Last_Y = Tray.y(Tray.ind);");
								
								System.out.println("Orient = Get_Orient(Tray);%Orientación  a partir de los 2 últimos puntos");
								
								System.out.println("if(Orient == 1)");
								if(g == 2)
								System.out.println("Tray = plot_arc(pi/2,-pi/2,Last_X,Last_Y - "+r+","+r+", Tray);%Trazo curva a la derecha");
								else
								System.out.println("Tray = plot_arc(pi/2,0,Last_X,Last_Y - "+r+","+r+", Tray);%Trazo curva a la derecha");
								System.out.println("end");
								
								System.out.println("if(Orient == 2)");
								if(g == 2)
								System.out.println("Tray = plot_arc(pi,0,Last_X + "+r+",Last_Y,"+r+", Tray);%Trazo curva a la derecha");
								else
								System.out.println("Tray = plot_arc(pi,pi/2,Last_X + "+r+",Last_Y,"+r+", Tray);%Trazo curva a la derecha");
								System.out.println("end");
								
								System.out.println("if(Orient == 3)");
								if(g == 2)
								System.out.println("Tray = plot_arc(1.5*pi,pi/2,Last_X,Last_Y + "+r+","+r+", Tray);%Trazo curva a la derecha");
								else
								System.out.println("Tray = plot_arc(-pi/2,-pi,Last_X,Last_Y + "+r+","+r+", Tray);%Trazo curva a la derecha");
								System.out.println("end");
								
								System.out.println("if(Orient == 4)");
								if(g == 2)
								System.out.println("Tray = plot_arc(0,-pi,Last_X - "+r+",Last_Y,"+r+", Tray);%Trazo curva a la derecha");
								else
								System.out.println("Tray = plot_arc(0,-pi/2,Last_X - "+r+",Last_Y,"+r+", Tray);%Trazo curva a la derecha");
								System.out.println("end");
								}
				
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(205, 1);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "func3");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

	}
	// $ANTLR end "func3"



	// $ANTLR start "func4"
	// C:\\ANTRL\\JarvisCommand.g:207:1: func4 : FORWARD PAR1 len= lenght COMA acc= percent COMA desc= percent COMA vel1= speed COMA vel2= speed PAR2 ;
	public final void func4() throws RecognitionException {
		Double len =null;
		int acc =0;
		int desc =0;
		Double vel1 =null;
		Double vel2 =null;

		try { dbg.enterRule(getGrammarFileName(), "func4");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(207, 0);

		try {
			// C:\\ANTRL\\JarvisCommand.g:207:7: ( FORWARD PAR1 len= lenght COMA acc= percent COMA desc= percent COMA vel1= speed COMA vel2= speed PAR2 )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:208:2: FORWARD PAR1 len= lenght COMA acc= percent COMA desc= percent COMA vel1= speed COMA vel2= speed PAR2
			{
			dbg.location(208,2);
			match(input,FORWARD,FOLLOW_FORWARD_in_func4364); dbg.location(208,10);
			match(input,PAR1,FOLLOW_PAR1_in_func4366); dbg.location(208,18);
			pushFollow(FOLLOW_lenght_in_func4370);
			len=lenght();
			state._fsp--;
			dbg.location(208,26);
			match(input,COMA,FOLLOW_COMA_in_func4372); dbg.location(208,34);
			pushFollow(FOLLOW_percent_in_func4376);
			acc=percent();
			state._fsp--;
			dbg.location(208,43);
			match(input,COMA,FOLLOW_COMA_in_func4378); dbg.location(208,52);
			pushFollow(FOLLOW_percent_in_func4382);
			desc=percent();
			state._fsp--;
			dbg.location(208,61);
			match(input,COMA,FOLLOW_COMA_in_func4384); dbg.location(208,70);
			pushFollow(FOLLOW_speed_in_func4388);
			vel1=speed();
			state._fsp--;
			dbg.location(208,77);
			match(input,COMA,FOLLOW_COMA_in_func4390); dbg.location(208,86);
			pushFollow(FOLLOW_speed_in_func4394);
			vel2=speed();
			state._fsp--;
			dbg.location(208,93);
			match(input,PAR2,FOLLOW_PAR2_in_func4396); dbg.location(209,2);

					if(flag == 0 || len == -1.0 || acc == 255 || vel1 == -1.0 || vel2 == -1.0 || desc == 255)
						System.err.println("Error de Compilación");
					
					else {
						// GENERACION DE SCRIPT PARA MATLAB
						System.out.println("%Tramo rectilíneo");
						System.out.println("Last_Vel = Tray.v(Tray.ind);");
						System.out.println("Tray = Change_Vel(Last_Vel , "+vel1+","+acc+", Tray);%velocidad de recorrido");
						System.out.println("Tray = Change_Vel(Last_Vel , "+vel1+",100 - "+acc+" - "+desc+", Tray);%velocidad de recorrido");
						System.out.println("Tray = Change_Vel("+vel1+" , "+vel2+","+desc+", Tray);%velocidad de recorrido");
									
						System.out.println("Last_X = Tray.x(Tray.ind);%Posición de último punto de la trayectoria");
						System.out.println("Last_Y = Tray.y(Tray.ind);%Posición de último punto de la trayectoria");
						System.out.println("Orient = Get_Orient(Tray);%Orientación  a partir de los 2 últimos puntos");
						System.out.println("if(Orient == 1)");
						System.out.println("Tray = plot_line(Last_X,Last_Y,Last_X + "+len+",Last_Y,Tray);%Trazo el tramo de trayectoria");
						System.out.println("end");
						System.out.println("if(Orient == 2)");
						System.out.println("Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y + "+len+",Tray);%Trazo el tramo de trayectoria");
						System.out.println("end");
						System.out.println("if(Orient == 3)");
						System.out.println("Tray = plot_line(Last_X,Last_Y,Last_X - "+len+",Last_Y,Tray);%Trazo el tramo de trayectoria");
						System.out.println("end");
						System.out.println("if(Orient == 4)");
						System.out.println("Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y - "+len+",Tray);%Trazo el tramo de trayectoria");
						System.out.println("end");
						//System.out.println("Last_Vel = Tray.v(Tray.ind);");
						//System.out.println("Tray = Change_Vel(Last_Vel, Last_Vel ,"+len+", Tray);%velocidad de recorrido");
						}
				
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(240, 1);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "func4");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

	}
	// $ANTLR end "func4"



	// $ANTLR start "func5"
	// C:\\ANTRL\\JarvisCommand.g:243:1: func5 : INIT PAR1 PAR2 ;
	public final void func5() throws RecognitionException {
		try { dbg.enterRule(getGrammarFileName(), "func5");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(243, 0);

		try {
			// C:\\ANTRL\\JarvisCommand.g:243:7: ( INIT PAR1 PAR2 )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:244:2: INIT PAR1 PAR2
			{
			dbg.location(244,2);
			match(input,INIT,FOLLOW_INIT_in_func5411); dbg.location(244,7);
			match(input,PAR1,FOLLOW_PAR1_in_func5413); dbg.location(244,12);
			match(input,PAR2,FOLLOW_PAR2_in_func5415); dbg.location(245,2);

				flag = 1;
				System.out.println("function H = Trayectoria1(Tray)");	
				
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(249, 1);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "func5");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

	}
	// $ANTLR end "func5"



	// $ANTLR start "func6"
	// C:\\ANTRL\\JarvisCommand.g:251:1: func6 : FINISH PAR1 PAR2 ;
	public final void func6() throws RecognitionException {
		try { dbg.enterRule(getGrammarFileName(), "func6");
		if ( getRuleLevel()==0 ) {dbg.commence();}
		incRuleLevel();
		dbg.location(251, 0);

		try {
			// C:\\ANTRL\\JarvisCommand.g:251:7: ( FINISH PAR1 PAR2 )
			dbg.enterAlt(1);

			// C:\\ANTRL\\JarvisCommand.g:252:2: FINISH PAR1 PAR2
			{
			dbg.location(252,2);
			match(input,FINISH,FOLLOW_FINISH_in_func6429); dbg.location(252,9);
			match(input,PAR1,FOLLOW_PAR1_in_func6431); dbg.location(252,14);
			match(input,PAR2,FOLLOW_PAR2_in_func6433); dbg.location(253,2);

				if (flag == 0)
				return;
				
				System.out.println("%Eliminar elementos repetidos. No debe haber 2 puntos consecutivos");
				System.out.println("%del vector con las mismas coordenadas x, y.");
				System.out.println("i=2;");
				System.out.println("barrer = 0;");
				System.out.println("while (barrer == 0)");
			    	System.out.println("if(i ==  length(Tray.x))");
			    	System.out.println("barrer = 1;");    
			    	System.out.println("else");
			        System.out.println("if(Tray.x(i) == Tray.x(i-1))");
			        System.out.println("Tray.x(i)=[];%Igualando a '[]' elimino el elemento");
			        System.out.println("Tray.y(i)=[];");
			        System.out.println("Tray.v(i)=[];");
			        System.out.println("Tray.ind = length(Tray.x);%Corrijo el nro de posiciones de Tray");
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
				System.out.println("%Compilación exitosa.");	 	
				
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
		dbg.location(288, 1);

		}
		finally {
			dbg.exitRule(getGrammarFileName(), "func6");
			decRuleLevel();
			if ( getRuleLevel()==0 ) {dbg.terminate();}
		}

	}
	// $ANTLR end "func6"

	// Delegated rules



	public static final BitSet FOLLOW_func5_in_expr_init102 = new BitSet(new long[]{0x0000000000018080L});
	public static final BitSet FOLLOW_expr_in_expr_init106 = new BitSet(new long[]{0x0000000000000020L});
	public static final BitSet FOLLOW_func6_in_expr_init110 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_func2_in_expr121 = new BitSet(new long[]{0x0000000000018082L});
	public static final BitSet FOLLOW_func3_in_expr127 = new BitSet(new long[]{0x0000000000018082L});
	public static final BitSet FOLLOW_func4_in_expr133 = new BitSet(new long[]{0x0000000000018082L});
	public static final BitSet FOLLOW_NUM_ENTERO_in_quarter154 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_NUM_ENTERO_in_percent177 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_NUM_FLOT_in_lenght200 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_NUM_FLOT_in_radio222 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_NUM_FLOT_in_speed244 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_TURN_LEFT_in_func2260 = new BitSet(new long[]{0x0000000000001000L});
	public static final BitSet FOLLOW_PAR1_in_func2262 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_radio_in_func2266 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func2268 = new BitSet(new long[]{0x0000000000000400L});
	public static final BitSet FOLLOW_quarter_in_func2272 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func2274 = new BitSet(new long[]{0x0000000000000400L});
	public static final BitSet FOLLOW_percent_in_func2278 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func2280 = new BitSet(new long[]{0x0000000000000400L});
	public static final BitSet FOLLOW_percent_in_func2284 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func2286 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_speed_in_func2290 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func2292 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_speed_in_func2296 = new BitSet(new long[]{0x0000000000002000L});
	public static final BitSet FOLLOW_PAR2_in_func2298 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_TURN_RIGHT_in_func3312 = new BitSet(new long[]{0x0000000000001000L});
	public static final BitSet FOLLOW_PAR1_in_func3314 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_radio_in_func3318 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func3320 = new BitSet(new long[]{0x0000000000000400L});
	public static final BitSet FOLLOW_quarter_in_func3324 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func3326 = new BitSet(new long[]{0x0000000000000400L});
	public static final BitSet FOLLOW_percent_in_func3330 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func3332 = new BitSet(new long[]{0x0000000000000400L});
	public static final BitSet FOLLOW_percent_in_func3336 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func3338 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_speed_in_func3342 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func3344 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_speed_in_func3348 = new BitSet(new long[]{0x0000000000002000L});
	public static final BitSet FOLLOW_PAR2_in_func3350 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_FORWARD_in_func4364 = new BitSet(new long[]{0x0000000000001000L});
	public static final BitSet FOLLOW_PAR1_in_func4366 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_lenght_in_func4370 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func4372 = new BitSet(new long[]{0x0000000000000400L});
	public static final BitSet FOLLOW_percent_in_func4376 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func4378 = new BitSet(new long[]{0x0000000000000400L});
	public static final BitSet FOLLOW_percent_in_func4382 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func4384 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_speed_in_func4388 = new BitSet(new long[]{0x0000000000000010L});
	public static final BitSet FOLLOW_COMA_in_func4390 = new BitSet(new long[]{0x0000000000000800L});
	public static final BitSet FOLLOW_speed_in_func4394 = new BitSet(new long[]{0x0000000000002000L});
	public static final BitSet FOLLOW_PAR2_in_func4396 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_INIT_in_func5411 = new BitSet(new long[]{0x0000000000001000L});
	public static final BitSet FOLLOW_PAR1_in_func5413 = new BitSet(new long[]{0x0000000000002000L});
	public static final BitSet FOLLOW_PAR2_in_func5415 = new BitSet(new long[]{0x0000000000000002L});
	public static final BitSet FOLLOW_FINISH_in_func6429 = new BitSet(new long[]{0x0000000000001000L});
	public static final BitSet FOLLOW_PAR1_in_func6431 = new BitSet(new long[]{0x0000000000002000L});
	public static final BitSet FOLLOW_PAR2_in_func6433 = new BitSet(new long[]{0x0000000000000002L});
}
