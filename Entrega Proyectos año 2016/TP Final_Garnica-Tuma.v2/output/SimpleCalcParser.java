// $ANTLR 3.3 Nov 30, 2010 12:45:30 C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g 2016-08-23 21:09:45

	import java.util.HashMap;	//Importamos la clase de la tabla Java para almacenar variables


import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

import org.antlr.runtime.debug.*;
import java.io.IOException;
public class SimpleCalcParser extends DebugParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "ALIAS", "AND", "ARRAY", "ASSOCIATIVE", "BEGIN", "BINDINGS", "BY", "CASE", "CONST", "DEFINITION", "DIV", "DO", "ELSE", "ELSIF", "END", "EXIT", "FOR", "FROM", "IF", "IMPLEMENTATION", "IMPORT", "IN", "LOOP", "MINUS", "MOD", "MODULE", "NOT", "OF", "OPAQUE", "OR", "PLUS", "POINTER", "PROCEDURE", "PRODUCT", "RECORD", "REPEAT", "RETURN", "SET", "THEN", "TO", "TYPE", "UNTIL", "VAR", "VARIADIC", "WHILE", "MOVE", "ID", "NUMBER", "COMA", "WHITESPACE", "LEFT_PAREN", "RIGHT_PAREN", "FLOAT", "INTEGER", "LETTER", "DIGIT", "NAME", "NONCONTROL_CHAR", "STRING_LITERAL", "SYMBOL", "SPACE", "LOWER", "UPPER", "'='"
    };
    public static final int EOF=-1;
    public static final int T__67=67;
    public static final int ALIAS=4;
    public static final int AND=5;
    public static final int ARRAY=6;
    public static final int ASSOCIATIVE=7;
    public static final int BEGIN=8;
    public static final int BINDINGS=9;
    public static final int BY=10;
    public static final int CASE=11;
    public static final int CONST=12;
    public static final int DEFINITION=13;
    public static final int DIV=14;
    public static final int DO=15;
    public static final int ELSE=16;
    public static final int ELSIF=17;
    public static final int END=18;
    public static final int EXIT=19;
    public static final int FOR=20;
    public static final int FROM=21;
    public static final int IF=22;
    public static final int IMPLEMENTATION=23;
    public static final int IMPORT=24;
    public static final int IN=25;
    public static final int LOOP=26;
    public static final int MINUS=27;
    public static final int MOD=28;
    public static final int MODULE=29;
    public static final int NOT=30;
    public static final int OF=31;
    public static final int OPAQUE=32;
    public static final int OR=33;
    public static final int PLUS=34;
    public static final int POINTER=35;
    public static final int PROCEDURE=36;
    public static final int PRODUCT=37;
    public static final int RECORD=38;
    public static final int REPEAT=39;
    public static final int RETURN=40;
    public static final int SET=41;
    public static final int THEN=42;
    public static final int TO=43;
    public static final int TYPE=44;
    public static final int UNTIL=45;
    public static final int VAR=46;
    public static final int VARIADIC=47;
    public static final int WHILE=48;
    public static final int MOVE=49;
    public static final int ID=50;
    public static final int NUMBER=51;
    public static final int COMA=52;
    public static final int WHITESPACE=53;
    public static final int LEFT_PAREN=54;
    public static final int RIGHT_PAREN=55;
    public static final int FLOAT=56;
    public static final int INTEGER=57;
    public static final int LETTER=58;
    public static final int DIGIT=59;
    public static final int NAME=60;
    public static final int NONCONTROL_CHAR=61;
    public static final int STRING_LITERAL=62;
    public static final int SYMBOL=63;
    public static final int SPACE=64;
    public static final int LOWER=65;
    public static final int UPPER=66;

    // delegates
    // delegators

    public static final String[] ruleNames = new String[] {
        "invalidRule", "op", "asig2", "asig", "factor", "expr"
    };
    public static final boolean[] decisionCanBacktrack = new boolean[] {
        false, // invalid decision
        false, false, false
    };

     
        public int ruleLevel = 0;
        public int getRuleLevel() { return ruleLevel; }
        public void incRuleLevel() { ruleLevel++; }
        public void decRuleLevel() { ruleLevel--; }
        public SimpleCalcParser(TokenStream input) {
            this(input, DebugEventSocketProxy.DEFAULT_DEBUGGER_PORT, new RecognizerSharedState());
        }
        public SimpleCalcParser(TokenStream input, int port, RecognizerSharedState state) {
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
    public SimpleCalcParser(TokenStream input, DebugEventListener dbg) {
        super(input, dbg, new RecognizerSharedState());

    }
    protected boolean evalPredicate(boolean result, String predicate) {
        dbg.semanticPredicate(result, predicate);
        return result;
    }


    public String[] getTokenNames() { return SimpleCalcParser.tokenNames; }
    public String getGrammarFileName() { return "C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g"; }


            Integer i=0;
    	HashMap variables = new HashMap();	//Tabla de java para almacenar variables
    	HashMap valores = new HashMap();
    	public static void main(String[] args) throws Exception 
    	{
    		SimpleCalcLexer lex = new SimpleCalcLexer(new ANTLRFileStream(args[0]));
    		CommonTokenStream tokens = new CommonTokenStream(lex);
    		SimpleCalcParser parser = new SimpleCalcParser(tokens);
    		try 
    		{
    			parser.expr();
    		} 
    		catch (RecognitionException e)
    		{
    			e.printStackTrace();
    		}
    	}



    // $ANTLR start "expr"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:85:1: expr : ( ( asig2 ) | ( asig ) )+ ;
    public final void expr() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "expr");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(85, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:85:6: ( ( ( asig2 ) | ( asig ) )+ )
            dbg.enterAlt(1);

            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:85:8: ( ( asig2 ) | ( asig ) )+
            {
            dbg.location(85,8);
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:85:8: ( ( asig2 ) | ( asig ) )+
            int cnt1=0;
            try { dbg.enterSubRule(1);

            loop1:
            do {
                int alt1=3;
                try { dbg.enterDecision(1, decisionCanBacktrack[1]);

                int LA1_0 = input.LA(1);

                if ( (LA1_0==MOVE) ) {
                    alt1=1;
                }
                else if ( (LA1_0==ID) ) {
                    alt1=2;
                }


                } finally {dbg.exitDecision(1);}

                switch (alt1) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:85:9: ( asig2 )
            	    {
            	    dbg.location(85,9);
            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:85:9: ( asig2 )
            	    dbg.enterAlt(1);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:85:10: asig2
            	    {
            	    dbg.location(85,10);
            	    pushFollow(FOLLOW_asig2_in_expr822);
            	    asig2();

            	    state._fsp--;


            	    }


            	    }
            	    break;
            	case 2 :
            	    dbg.enterAlt(2);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:85:17: ( asig )
            	    {
            	    dbg.location(85,17);
            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:85:17: ( asig )
            	    dbg.enterAlt(1);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:85:18: asig
            	    {
            	    dbg.location(85,18);
            	    pushFollow(FOLLOW_asig_in_expr826);
            	    asig();

            	    state._fsp--;


            	    }


            	    }
            	    break;

            	default :
            	    if ( cnt1 >= 1 ) break loop1;
                        EarlyExitException eee =
                            new EarlyExitException(1, input);
                        dbg.recognitionException(eee);

                        throw eee;
                }
                cnt1++;
            } while (true);
            } finally {dbg.exitSubRule(1);}


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(85, 25);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "expr");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "expr"


    // $ANTLR start "asig"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:86:1: asig : ID '=' op ;
    public final void asig() throws RecognitionException {
        Token ID1=null;
        int op2 = 0;


        try { dbg.enterRule(getGrammarFileName(), "asig");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(86, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:86:6: ( ID '=' op )
            dbg.enterAlt(1);

            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:86:8: ID '=' op
            {
            dbg.location(86,8);
            ID1=(Token)match(input,ID,FOLLOW_ID_in_asig837); 
            dbg.location(86,11);
            match(input,67,FOLLOW_67_in_asig839); 
            dbg.location(86,15);
            pushFollow(FOLLOW_op_in_asig841);
            op2=op();

            state._fsp--;

            dbg.location(86,18);
            System.out.println((ID1!=null?ID1.getText():null) +"="+ op2);
            		  variables.put((ID1!=null?ID1.getText():null), new Integer(op2));

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(87, 54);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "asig");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "asig"


    // $ANTLR start "op"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:88:1: op returns [int value] : e= factor ( PLUS e= factor | MINUS e= factor | PRODUCT e= factor )* ;
    public final int op() throws RecognitionException {
        int value = 0;

        int e = 0;


        try { dbg.enterRule(getGrammarFileName(), "op");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(88, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:89:1: (e= factor ( PLUS e= factor | MINUS e= factor | PRODUCT e= factor )* )
            dbg.enterAlt(1);

            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:90:2: e= factor ( PLUS e= factor | MINUS e= factor | PRODUCT e= factor )*
            {
            dbg.location(90,3);
            pushFollow(FOLLOW_factor_in_op860);
            e=factor();

            state._fsp--;

            dbg.location(90,11);
            value = e;
            dbg.location(91,1);
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:91:1: ( PLUS e= factor | MINUS e= factor | PRODUCT e= factor )*
            try { dbg.enterSubRule(2);

            loop2:
            do {
                int alt2=4;
                try { dbg.enterDecision(2, decisionCanBacktrack[2]);

                switch ( input.LA(1) ) {
                case PLUS:
                    {
                    alt2=1;
                    }
                    break;
                case MINUS:
                    {
                    alt2=2;
                    }
                    break;
                case PRODUCT:
                    {
                    alt2=3;
                    }
                    break;

                }

                } finally {dbg.exitDecision(2);}

                switch (alt2) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:91:3: PLUS e= factor
            	    {
            	    dbg.location(91,3);
            	    match(input,PLUS,FOLLOW_PLUS_in_op866); 
            	    dbg.location(91,9);
            	    pushFollow(FOLLOW_factor_in_op870);
            	    e=factor();

            	    state._fsp--;

            	    dbg.location(91,17);
            	    value += e;

            	    }
            	    break;
            	case 2 :
            	    dbg.enterAlt(2);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:92:3: MINUS e= factor
            	    {
            	    dbg.location(92,3);
            	    match(input,MINUS,FOLLOW_MINUS_in_op876); 
            	    dbg.location(92,10);
            	    pushFollow(FOLLOW_factor_in_op880);
            	    e=factor();

            	    state._fsp--;

            	    dbg.location(92,18);
            	    value -= e;

            	    }
            	    break;
            	case 3 :
            	    dbg.enterAlt(3);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:93:3: PRODUCT e= factor
            	    {
            	    dbg.location(93,3);
            	    match(input,PRODUCT,FOLLOW_PRODUCT_in_op886); 
            	    dbg.location(93,12);
            	    pushFollow(FOLLOW_factor_in_op890);
            	    e=factor();

            	    state._fsp--;

            	    dbg.location(93,20);
            	    value *= e;

            	    }
            	    break;

            	default :
            	    break loop2;
                }
            } while (true);
            } finally {dbg.exitSubRule(2);}


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(95, 1);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "op");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return value;
    }
    // $ANTLR end "op"


    // $ANTLR start "factor"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:96:1: factor returns [int value] : ( NUMBER | ID );
    public final int factor() throws RecognitionException {
        int value = 0;

        Token NUMBER3=null;
        Token ID4=null;

        try { dbg.enterRule(getGrammarFileName(), "factor");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(96, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:97:1: ( NUMBER | ID )
            int alt3=2;
            try { dbg.enterDecision(3, decisionCanBacktrack[3]);

            int LA3_0 = input.LA(1);

            if ( (LA3_0==NUMBER) ) {
                alt3=1;
            }
            else if ( (LA3_0==ID) ) {
                alt3=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 3, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(3);}

            switch (alt3) {
                case 1 :
                    dbg.enterAlt(1);

                    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:98:3: NUMBER
                    {
                    dbg.location(98,3);
                    NUMBER3=(Token)match(input,NUMBER,FOLLOW_NUMBER_in_factor910); 
                    dbg.location(98,9);
                    value = Integer.parseInt((NUMBER3!=null?NUMBER3.getText():null));

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:99:3: ID
                    {
                    dbg.location(99,3);
                    ID4=(Token)match(input,ID,FOLLOW_ID_in_factor916); 
                    dbg.location(100,1);

                    	Integer v = (Integer)variables.get((ID4!=null?ID4.getText():null)); //Con esto acepta letras como enteros
                    	valores.put(i++, new Integer(v));
                    	if ( v!=null ) value = v.intValue();
                    	else System.err.println("Variable no definida: "+(ID4!=null?ID4.getText():null));


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(105, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "factor");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return value;
    }
    // $ANTLR end "factor"


    // $ANTLR start "asig2"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:108:1: asig2 : MOVE '(' factor COMA factor COMA factor ')' ;
    public final void asig2() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "asig2");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(108, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:108:7: ( MOVE '(' factor COMA factor COMA factor ')' )
            dbg.enterAlt(1);

            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\SimpleCalc.g:108:9: MOVE '(' factor COMA factor COMA factor ')'
            {
            dbg.location(108,9);
            match(input,MOVE,FOLLOW_MOVE_in_asig2927); 
            dbg.location(108,14);
            match(input,LEFT_PAREN,FOLLOW_LEFT_PAREN_in_asig2929); 
            dbg.location(108,18);
            pushFollow(FOLLOW_factor_in_asig2931);
            factor();

            state._fsp--;

            dbg.location(108,25);
            match(input,COMA,FOLLOW_COMA_in_asig2933); 
            dbg.location(108,30);
            pushFollow(FOLLOW_factor_in_asig2935);
            factor();

            state._fsp--;

            dbg.location(108,37);
            match(input,COMA,FOLLOW_COMA_in_asig2937); 
            dbg.location(108,42);
            pushFollow(FOLLOW_factor_in_asig2939);
            factor();

            state._fsp--;

            dbg.location(108,50);
            match(input,RIGHT_PAREN,FOLLOW_RIGHT_PAREN_in_asig2942); 
            dbg.location(110,1);

            	System.out.println("/*-------------------------------------------------------------------------------------------------------*/");
            	System.out.println("");
            	System.out.println("TRADUCIENDO MI CODIGO FUENTE A TRAVES DE LOS ANALIZADORES SE OBTIENE EL SIGUIENTE CODIGO EN C:");
                    System.out.println("");
                    System.out.println("#include <DCMotor.h>");
                    System.out.println("#define L 135");
                    System.out.println("#define R  3");
                    System.out.println("#define VMAX 50");
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
                    System.out.println(" n=(Xfinal/Xtramo)/2;");
                    System.out.println("Rgiro=Xtramo*10-(L/2);");
                    System.out.println("Vmin=VMAX*(2*Rgiro-L)/(2*Rgiro+L);");
                    System.out.println(" Vmin=Vmin/1000;");
                    System.out.println("nr=VMAX;");  
                     System.out.println("nl=VMAX;");  
                     System.out.println("dist=(Yfinal-Xtramo/2)*10;");         
                      System.out.println("time=dist/(nl/200); ");   
                    System.out.println("time1=(int)aux;");      
                     System.out.println(" Move(nr,nl,time1);//LINEA RECTA");
                     
                     System.out.println("for(i=0;i<n;i++)");
                    System.out.println("{");
                    System.out.println("nr=(int)Vmin;");  
                     System.out.println("nl=VMAX;");            
                    System.out.println("dist=Rgiro*3.14*0.5;");
                    System.out.println("time=dist/(nl/200);");
                    System.out.println("time2=(int)time; ");
                    System.out.println("Move(nr,nl,time2);// SEMICIRCULO");
                    
                    System.out.println("nr=VMAX;");  
                     System.out.println("nl=VMAX;");          
                    System.out.println("dist=(Yfinal-Xtramo)*10;");
                    System.out.println("time=dist/(nl/200);");
                    System.out.println(" time1=(int)time;");       
                    System.out.println(" Move(nr,nl,time1);//LINEA RECTA ");
                    
                    System.out.println("nr=VMAX;");  
                    System.out.println("nl=(int)Vmin;");
                    System.out.println("Move(nr,nl,time2);// SEMICIRCULO");
                    
                    System.out.println("nr=VMAX;");  
                    System.out.println("nl=VMAX;");          
                    System.out.println("dist=(Yfinal-Xtramo)*10;");
                    System.out.println("time=dist/(nl/200);");
                    System.out.println(" time1=(int)time;");       
                    System.out.println(" Move(nr,nl,time1);//LINEA RECTA ");
                    System.out.println("} ");
                    System.out.println(" motor0.brake(); ");
                    System.out.println("motor1.brake(); ");
                    System.out.println("} ");
                    System.out.println("void loop()");
                    System.out.println(" { }");
                    System.out.println("                                                                                                  }");


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(180, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "asig2");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "asig2"

    // Delegated rules


 

    public static final BitSet FOLLOW_asig2_in_expr822 = new BitSet(new long[]{0x0006000000000002L});
    public static final BitSet FOLLOW_asig_in_expr826 = new BitSet(new long[]{0x0006000000000002L});
    public static final BitSet FOLLOW_ID_in_asig837 = new BitSet(new long[]{0x0000000000000000L,0x0000000000000008L});
    public static final BitSet FOLLOW_67_in_asig839 = new BitSet(new long[]{0x000C000000000000L});
    public static final BitSet FOLLOW_op_in_asig841 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_factor_in_op860 = new BitSet(new long[]{0x0000002408000002L});
    public static final BitSet FOLLOW_PLUS_in_op866 = new BitSet(new long[]{0x000C000000000000L});
    public static final BitSet FOLLOW_factor_in_op870 = new BitSet(new long[]{0x0000002408000002L});
    public static final BitSet FOLLOW_MINUS_in_op876 = new BitSet(new long[]{0x000C000000000000L});
    public static final BitSet FOLLOW_factor_in_op880 = new BitSet(new long[]{0x0000002408000002L});
    public static final BitSet FOLLOW_PRODUCT_in_op886 = new BitSet(new long[]{0x000C000000000000L});
    public static final BitSet FOLLOW_factor_in_op890 = new BitSet(new long[]{0x0000002408000002L});
    public static final BitSet FOLLOW_NUMBER_in_factor910 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_factor916 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MOVE_in_asig2927 = new BitSet(new long[]{0x0040000000000000L});
    public static final BitSet FOLLOW_LEFT_PAREN_in_asig2929 = new BitSet(new long[]{0x000C000000000000L});
    public static final BitSet FOLLOW_factor_in_asig2931 = new BitSet(new long[]{0x0010000000000000L});
    public static final BitSet FOLLOW_COMA_in_asig2933 = new BitSet(new long[]{0x000C000000000000L});
    public static final BitSet FOLLOW_factor_in_asig2935 = new BitSet(new long[]{0x0010000000000000L});
    public static final BitSet FOLLOW_COMA_in_asig2937 = new BitSet(new long[]{0x000C000000000000L});
    public static final BitSet FOLLOW_factor_in_asig2939 = new BitSet(new long[]{0x0080000000000000L});
    public static final BitSet FOLLOW_RIGHT_PAREN_in_asig2942 = new BitSet(new long[]{0x0000000000000002L});

}