// $ANTLR 3.3 Nov 30, 2010 12:45:30 C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g 2016-09-01 15:27:36

	import java.util.HashMap;	//Importamos la clase de la tabla Java para almacenar variables


import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

import org.antlr.runtime.debug.*;
import java.io.IOException;
public class Compilador_RoboticaParser extends DebugParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "ALIAS", "AND", "ARRAY", "ASSOCIATIVE", "BEGIN", "BINDINGS", "BY", "CASE", "CONST", "DEFINITION", "DIV", "DO", "ELSE", "ELSIF", "END", "EXIT", "FOR", "FROM", "IF", "IMPLEMENTATION", "IMPORT", "IN", "INIT", "LOOP", "MINUS", "MOD", "MODULE", "NOT", "OF", "OPAQUE", "OR", "PLUS", "POINTER", "PROCEDURE", "PRODUCT", "RECORD", "REPEAT", "RETURN", "SET", "THEN", "TO", "TYPE", "UNTIL", "VAR", "VARIADIC", "WHILE", "MOVEL", "MOVEDER", "MOVEIZQ", "COMA", "NUMBER", "ID", "WHITESPACE", "LEFT_PAREN", "RIGHT_PAREN", "FLOAT", "INTEGER", "LETTER", "DIGIT", "NAME", "NONCONTROL_CHAR", "STRING_LITERAL", "SYMBOL", "SPACE", "LOWER", "UPPER"
    };
    public static final int EOF=-1;
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
    public static final int INIT=26;
    public static final int LOOP=27;
    public static final int MINUS=28;
    public static final int MOD=29;
    public static final int MODULE=30;
    public static final int NOT=31;
    public static final int OF=32;
    public static final int OPAQUE=33;
    public static final int OR=34;
    public static final int PLUS=35;
    public static final int POINTER=36;
    public static final int PROCEDURE=37;
    public static final int PRODUCT=38;
    public static final int RECORD=39;
    public static final int REPEAT=40;
    public static final int RETURN=41;
    public static final int SET=42;
    public static final int THEN=43;
    public static final int TO=44;
    public static final int TYPE=45;
    public static final int UNTIL=46;
    public static final int VAR=47;
    public static final int VARIADIC=48;
    public static final int WHILE=49;
    public static final int MOVEL=50;
    public static final int MOVEDER=51;
    public static final int MOVEIZQ=52;
    public static final int COMA=53;
    public static final int NUMBER=54;
    public static final int ID=55;
    public static final int WHITESPACE=56;
    public static final int LEFT_PAREN=57;
    public static final int RIGHT_PAREN=58;
    public static final int FLOAT=59;
    public static final int INTEGER=60;
    public static final int LETTER=61;
    public static final int DIGIT=62;
    public static final int NAME=63;
    public static final int NONCONTROL_CHAR=64;
    public static final int STRING_LITERAL=65;
    public static final int SYMBOL=66;
    public static final int SPACE=67;
    public static final int LOWER=68;
    public static final int UPPER=69;

    // delegates
    // delegators

    public static final String[] ruleNames = new String[] {
        "invalidRule", "expr", "rule4", "rule1", "rule2", "rule5", "factor", 
        "rule3"
    };
    public static final boolean[] decisionCanBacktrack = new boolean[] {
        false, // invalid decision
        false, false
    };

     
        public int ruleLevel = 0;
        public int getRuleLevel() { return ruleLevel; }
        public void incRuleLevel() { ruleLevel++; }
        public void decRuleLevel() { ruleLevel--; }
        public Compilador_RoboticaParser(TokenStream input) {
            this(input, DebugEventSocketProxy.DEFAULT_DEBUGGER_PORT, new RecognizerSharedState());
        }
        public Compilador_RoboticaParser(TokenStream input, int port, RecognizerSharedState state) {
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
    public Compilador_RoboticaParser(TokenStream input, DebugEventListener dbg) {
        super(input, dbg, new RecognizerSharedState());

    }
    protected boolean evalPredicate(boolean result, String predicate) {
        dbg.semanticPredicate(result, predicate);
        return result;
    }


    public String[] getTokenNames() { return Compilador_RoboticaParser.tokenNames; }
    public String getGrammarFileName() { return "C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g"; }


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



    // $ANTLR start "expr"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:90:1: expr : ( rule1 | rule2 | rule3 | rule4 | rule5 )+ ;
    public final void expr() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "expr");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(90, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:90:6: ( ( rule1 | rule2 | rule3 | rule4 | rule5 )+ )
            dbg.enterAlt(1);

            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:90:7: ( rule1 | rule2 | rule3 | rule4 | rule5 )+
            {
            dbg.location(90,7);
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:90:7: ( rule1 | rule2 | rule3 | rule4 | rule5 )+
            int cnt1=0;
            try { dbg.enterSubRule(1);

            loop1:
            do {
                int alt1=6;
                try { dbg.enterDecision(1, decisionCanBacktrack[1]);

                switch ( input.LA(1) ) {
                case INIT:
                    {
                    alt1=1;
                    }
                    break;
                case MOVEL:
                    {
                    alt1=2;
                    }
                    break;
                case MOVEDER:
                    {
                    alt1=3;
                    }
                    break;
                case MOVEIZQ:
                    {
                    alt1=4;
                    }
                    break;
                case END:
                    {
                    alt1=5;
                    }
                    break;

                }

                } finally {dbg.exitDecision(1);}

                switch (alt1) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:90:9: rule1
            	    {
            	    dbg.location(90,9);
            	    pushFollow(FOLLOW_rule1_in_expr870);
            	    rule1();

            	    state._fsp--;


            	    }
            	    break;
            	case 2 :
            	    dbg.enterAlt(2);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:90:15: rule2
            	    {
            	    dbg.location(90,15);
            	    pushFollow(FOLLOW_rule2_in_expr872);
            	    rule2();

            	    state._fsp--;


            	    }
            	    break;
            	case 3 :
            	    dbg.enterAlt(3);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:90:21: rule3
            	    {
            	    dbg.location(90,21);
            	    pushFollow(FOLLOW_rule3_in_expr874);
            	    rule3();

            	    state._fsp--;


            	    }
            	    break;
            	case 4 :
            	    dbg.enterAlt(4);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:90:27: rule4
            	    {
            	    dbg.location(90,27);
            	    pushFollow(FOLLOW_rule4_in_expr876);
            	    rule4();

            	    state._fsp--;


            	    }
            	    break;
            	case 5 :
            	    dbg.enterAlt(5);

            	    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:90:33: rule5
            	    {
            	    dbg.location(90,33);
            	    pushFollow(FOLLOW_rule5_in_expr878);
            	    rule5();

            	    state._fsp--;


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
        dbg.location(90, 40);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "expr");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "expr"


    // $ANTLR start "rule1"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:92:1: rule1 : INIT ;
    public final void rule1() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "rule1");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(92, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:92:7: ( INIT )
            dbg.enterAlt(1);

            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:93:1: INIT
            {
            dbg.location(93,1);
            match(input,INIT,FOLLOW_INIT_in_rule1889); 
            dbg.location(93,5);

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
                    


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(116, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "rule1");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "rule1"


    // $ANTLR start "rule2"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:118:1: rule2 : MOVEL '(' vel= factor COMA yfinal= factor ')' ;
    public final void rule2() throws RecognitionException {
        int vel = 0;

        int yfinal = 0;


        try { dbg.enterRule(getGrammarFileName(), "rule2");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(118, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:118:7: ( MOVEL '(' vel= factor COMA yfinal= factor ')' )
            dbg.enterAlt(1);

            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:119:1: MOVEL '(' vel= factor COMA yfinal= factor ')'
            {
            dbg.location(119,1);
            match(input,MOVEL,FOLLOW_MOVEL_in_rule2899); 
            dbg.location(119,6);
            match(input,LEFT_PAREN,FOLLOW_LEFT_PAREN_in_rule2900); 
            dbg.location(119,13);
            pushFollow(FOLLOW_factor_in_rule2904);
            vel=factor();

            state._fsp--;

            dbg.location(119,21);
            match(input,COMA,FOLLOW_COMA_in_rule2906); 
            dbg.location(119,32);
            pushFollow(FOLLOW_factor_in_rule2910);
            yfinal=factor();

            state._fsp--;

            dbg.location(119,40);
            match(input,RIGHT_PAREN,FOLLOW_RIGHT_PAREN_in_rule2912); 
            dbg.location(119,43);

                     System.out.println("nr="+ vel + ";");  
                     System.out.println("nl="+ vel + ";");  
                     System.out.println("dist="+ yfinal + ";");
                     System.out.println("dist=dist/(6.28*R);");           
                     System.out.println("time=dist/(VMAX/60); ");   
                     System.out.println("time1=(int)aux;");      
                     System.out.println(" Move(nr,nl,time1);//LINEA RECTA");


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(127, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "rule2");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "rule2"


    // $ANTLR start "rule3"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:128:1: rule3 : MOVEDER '(' velIzq= factor COMA xtramo= factor ')' ;
    public final void rule3() throws RecognitionException {
        int velIzq = 0;

        int xtramo = 0;


        try { dbg.enterRule(getGrammarFileName(), "rule3");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(128, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:128:7: ( MOVEDER '(' velIzq= factor COMA xtramo= factor ')' )
            dbg.enterAlt(1);

            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:129:1: MOVEDER '(' velIzq= factor COMA xtramo= factor ')'
            {
            dbg.location(129,1);
            match(input,MOVEDER,FOLLOW_MOVEDER_in_rule3921); 
            dbg.location(129,9);
            match(input,LEFT_PAREN,FOLLOW_LEFT_PAREN_in_rule3923); 
            dbg.location(129,19);
            pushFollow(FOLLOW_factor_in_rule3927);
            velIzq=factor();

            state._fsp--;

            dbg.location(129,27);
            match(input,COMA,FOLLOW_COMA_in_rule3929); 
            dbg.location(129,38);
            pushFollow(FOLLOW_factor_in_rule3933);
            xtramo=factor();

            state._fsp--;

            dbg.location(129,46);
            match(input,RIGHT_PAREN,FOLLOW_RIGHT_PAREN_in_rule3935); 
            dbg.location(129,49);

                    System.out.println(" n=(Xfinal/"+ xtramo + ")/2;");
                    System.out.println(" Rgiro=("+ xtramo + "*10+L)/2;");
                    System.out.println("Vmin="+ velIzq + "*(2*Rgiro-L)/(2*Rgiro+L);");         
                    System.out.println("nl="+ velIzq + ";"); 
                    System.out.println("nr=(int)Vmin;");             
                    System.out.println("dist=Rgiro*3.14;");
                    System.out.println("dist=dist/(6.28*R);");
                    System.out.println("time=DELAY/("+ xtramo + "/50);");
                    System.out.println("time2=(int)time; ");
                    System.out.println("Move(nr,nl,time2);// SEMICIRCULO");


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(140, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "rule3");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "rule3"


    // $ANTLR start "rule4"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:142:1: rule4 : MOVEIZQ '(' velDer= factor COMA xtramo= factor ')' ;
    public final void rule4() throws RecognitionException {
        int velDer = 0;

        int xtramo = 0;


        try { dbg.enterRule(getGrammarFileName(), "rule4");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(142, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:142:7: ( MOVEIZQ '(' velDer= factor COMA xtramo= factor ')' )
            dbg.enterAlt(1);

            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:143:1: MOVEIZQ '(' velDer= factor COMA xtramo= factor ')'
            {
            dbg.location(143,1);
            match(input,MOVEIZQ,FOLLOW_MOVEIZQ_in_rule4945); 
            dbg.location(143,9);
            match(input,LEFT_PAREN,FOLLOW_LEFT_PAREN_in_rule4947); 
            dbg.location(143,19);
            pushFollow(FOLLOW_factor_in_rule4951);
            velDer=factor();

            state._fsp--;

            dbg.location(143,27);
            match(input,COMA,FOLLOW_COMA_in_rule4953); 
            dbg.location(143,38);
            pushFollow(FOLLOW_factor_in_rule4957);
            xtramo=factor();

            state._fsp--;

            dbg.location(143,46);
            match(input,RIGHT_PAREN,FOLLOW_RIGHT_PAREN_in_rule4959); 
            dbg.location(143,49);

                    System.out.println(" n=(Xfinal/"+ xtramo + ")/2;");
                    System.out.println(" Rgiro=("+ xtramo + "*10+L)/2;");
                    System.out.println("Vmin="+ velDer + "*(2*Rgiro-L)/(2*Rgiro+L);");       
                    System.out.println("nr="+ velDer + ";"); 
                    System.out.println("nl=(int)Vmin;");             
                    System.out.println("dist=Rgiro*3.14;");
                    System.out.println("dist=dist/(6.28*R);");
                    System.out.println("time=DELAY/("+ xtramo + "/50);");
                    System.out.println("time2=(int)time; ");
                    System.out.println("Move(nr,nl,time2);// SEMICIRCULO");


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(154, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "rule4");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "rule4"


    // $ANTLR start "rule5"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:156:1: rule5 : END ;
    public final void rule5() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "rule5");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(156, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:156:7: ( END )
            dbg.enterAlt(1);

            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:157:1: END
            {
            dbg.location(157,1);
            match(input,END,FOLLOW_END_in_rule5969); 
            dbg.location(157,4);

                    System.out.println(" motor0.brake(); ");
                    System.out.println("motor1.brake(); ");
                    System.out.println("} ");
                    System.out.println("void loop()");
                    System.out.println(" { }");
                    System.out.println("                                                   }");
             


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(165, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "rule5");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "rule5"


    // $ANTLR start "factor"
    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:166:1: factor returns [int value] : ( NUMBER | ID );
    public final int factor() throws RecognitionException {
        int value = 0;

        Token NUMBER1=null;
        Token ID2=null;

        try { dbg.enterRule(getGrammarFileName(), "factor");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(166, 1);

        try {
            // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:167:1: ( NUMBER | ID )
            int alt2=2;
            try { dbg.enterDecision(2, decisionCanBacktrack[2]);

            int LA2_0 = input.LA(1);

            if ( (LA2_0==NUMBER) ) {
                alt2=1;
            }
            else if ( (LA2_0==ID) ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 2, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(2);}

            switch (alt2) {
                case 1 :
                    dbg.enterAlt(1);

                    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:168:3: NUMBER
                    {
                    dbg.location(168,3);
                    NUMBER1=(Token)match(input,NUMBER,FOLLOW_NUMBER_in_factor984); 
                    dbg.location(168,9);
                    value = Integer.parseInt((NUMBER1!=null?NUMBER1.getText():null));

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\Compilador_Robotica.g:169:3: ID
                    {
                    dbg.location(169,3);
                    ID2=(Token)match(input,ID,FOLLOW_ID_in_factor990); 
                    dbg.location(170,1);

                    	Integer v = (Integer)variables.get((ID2!=null?ID2.getText():null)); //Con esto acepta letras como enteros
                    	valores.put(i++, new Integer(v));
                    	if ( v!=null ) value = v.intValue();
                    	else System.err.println("Variable no definida: "+(ID2!=null?ID2.getText():null));


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
        dbg.location(175, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "factor");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return value;
    }
    // $ANTLR end "factor"

    // Delegated rules


 

    public static final BitSet FOLLOW_rule1_in_expr870 = new BitSet(new long[]{0x001C000004040002L});
    public static final BitSet FOLLOW_rule2_in_expr872 = new BitSet(new long[]{0x001C000004040002L});
    public static final BitSet FOLLOW_rule3_in_expr874 = new BitSet(new long[]{0x001C000004040002L});
    public static final BitSet FOLLOW_rule4_in_expr876 = new BitSet(new long[]{0x001C000004040002L});
    public static final BitSet FOLLOW_rule5_in_expr878 = new BitSet(new long[]{0x001C000004040002L});
    public static final BitSet FOLLOW_INIT_in_rule1889 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MOVEL_in_rule2899 = new BitSet(new long[]{0x0200000000000000L});
    public static final BitSet FOLLOW_LEFT_PAREN_in_rule2900 = new BitSet(new long[]{0x00C0000000000000L});
    public static final BitSet FOLLOW_factor_in_rule2904 = new BitSet(new long[]{0x0020000000000000L});
    public static final BitSet FOLLOW_COMA_in_rule2906 = new BitSet(new long[]{0x00C0000000000000L});
    public static final BitSet FOLLOW_factor_in_rule2910 = new BitSet(new long[]{0x0400000000000000L});
    public static final BitSet FOLLOW_RIGHT_PAREN_in_rule2912 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MOVEDER_in_rule3921 = new BitSet(new long[]{0x0200000000000000L});
    public static final BitSet FOLLOW_LEFT_PAREN_in_rule3923 = new BitSet(new long[]{0x00C0000000000000L});
    public static final BitSet FOLLOW_factor_in_rule3927 = new BitSet(new long[]{0x0020000000000000L});
    public static final BitSet FOLLOW_COMA_in_rule3929 = new BitSet(new long[]{0x00C0000000000000L});
    public static final BitSet FOLLOW_factor_in_rule3933 = new BitSet(new long[]{0x0400000000000000L});
    public static final BitSet FOLLOW_RIGHT_PAREN_in_rule3935 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MOVEIZQ_in_rule4945 = new BitSet(new long[]{0x0200000000000000L});
    public static final BitSet FOLLOW_LEFT_PAREN_in_rule4947 = new BitSet(new long[]{0x00C0000000000000L});
    public static final BitSet FOLLOW_factor_in_rule4951 = new BitSet(new long[]{0x0020000000000000L});
    public static final BitSet FOLLOW_COMA_in_rule4953 = new BitSet(new long[]{0x00C0000000000000L});
    public static final BitSet FOLLOW_factor_in_rule4957 = new BitSet(new long[]{0x0400000000000000L});
    public static final BitSet FOLLOW_RIGHT_PAREN_in_rule4959 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_END_in_rule5969 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_factor984 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_factor990 = new BitSet(new long[]{0x0000000000000002L});

}