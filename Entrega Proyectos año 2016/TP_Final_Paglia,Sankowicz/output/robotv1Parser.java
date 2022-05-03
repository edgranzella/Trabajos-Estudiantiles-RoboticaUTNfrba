// $ANTLR 3.3 Nov 30, 2010 12:45:30 /home/javisank/Documents/Robotica/robotv1.g 2016-09-10 10:43:33

import java.util.HashMap;


import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

import org.antlr.runtime.debug.*;
import java.io.IOException;
public class robotv1Parser extends DebugParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "INIT", "END", "MOVC", "MOVL", "WAIT", "INT", "ID", "FLOAT", "DIGIT", "EXPONENT", "WS", "ESC_SEQ", "STRING", "CHAR", "HEX_DIGIT", "UNICODE_ESC", "OCTAL_ESC", "'('", "','", "')'"
    };
    public static final int EOF=-1;
    public static final int T__21=21;
    public static final int T__22=22;
    public static final int T__23=23;
    public static final int INIT=4;
    public static final int END=5;
    public static final int MOVC=6;
    public static final int MOVL=7;
    public static final int WAIT=8;
    public static final int INT=9;
    public static final int ID=10;
    public static final int FLOAT=11;
    public static final int DIGIT=12;
    public static final int EXPONENT=13;
    public static final int WS=14;
    public static final int ESC_SEQ=15;
    public static final int STRING=16;
    public static final int CHAR=17;
    public static final int HEX_DIGIT=18;
    public static final int UNICODE_ESC=19;
    public static final int OCTAL_ESC=20;

    // delegates
    // delegators

    public static final String[] ruleNames = new String[] {
        "invalidRule", "rule5", "factor", "rule4", "comp", "rule3", "rule1", 
        "factor_float", "rule2", "expr"
    };
    public static final boolean[] decisionCanBacktrack = new boolean[] {
        false, // invalid decision
        false, false, false
    };

     
        public int ruleLevel = 0;
        public int getRuleLevel() { return ruleLevel; }
        public void incRuleLevel() { ruleLevel++; }
        public void decRuleLevel() { ruleLevel--; }
        public robotv1Parser(TokenStream input) {
            this(input, DebugEventSocketProxy.DEFAULT_DEBUGGER_PORT, new RecognizerSharedState());
        }
        public robotv1Parser(TokenStream input, int port, RecognizerSharedState state) {
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
    public robotv1Parser(TokenStream input, DebugEventListener dbg) {
        super(input, dbg, new RecognizerSharedState());

    }
    protected boolean evalPredicate(boolean result, String predicate) {
        dbg.semanticPredicate(result, predicate);
        return result;
    }


    public String[] getTokenNames() { return robotv1Parser.tokenNames; }
    public String getGrammarFileName() { return "/home/javisank/Documents/Robotica/robotv1.g"; }


    		
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



    // $ANTLR start "comp"
    // /home/javisank/Documents/Robotica/robotv1.g:47:1: comp : rule1 expr rule2 ;
    public final void comp() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "comp");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(47, 1);

        try {
            // /home/javisank/Documents/Robotica/robotv1.g:47:6: ( rule1 expr rule2 )
            dbg.enterAlt(1);

            // /home/javisank/Documents/Robotica/robotv1.g:47:8: rule1 expr rule2
            {
            dbg.location(47,8);
            pushFollow(FOLLOW_rule1_in_comp75);
            rule1();

            state._fsp--;

            dbg.location(47,14);
            pushFollow(FOLLOW_expr_in_comp77);
            expr();

            state._fsp--;

            dbg.location(47,19);
            pushFollow(FOLLOW_rule2_in_comp79);
            rule2();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(47, 24);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "comp");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "comp"


    // $ANTLR start "expr"
    // /home/javisank/Documents/Robotica/robotv1.g:52:1: expr : ( rule3 | rule4 | rule5 )+ ;
    public final void expr() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "expr");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(52, 1);

        try {
            // /home/javisank/Documents/Robotica/robotv1.g:52:6: ( ( rule3 | rule4 | rule5 )+ )
            dbg.enterAlt(1);

            // /home/javisank/Documents/Robotica/robotv1.g:52:8: ( rule3 | rule4 | rule5 )+
            {
            dbg.location(52,8);
            // /home/javisank/Documents/Robotica/robotv1.g:52:8: ( rule3 | rule4 | rule5 )+
            int cnt1=0;
            try { dbg.enterSubRule(1);

            loop1:
            do {
                int alt1=4;
                try { dbg.enterDecision(1, decisionCanBacktrack[1]);

                switch ( input.LA(1) ) {
                case MOVC:
                    {
                    alt1=1;
                    }
                    break;
                case MOVL:
                    {
                    alt1=2;
                    }
                    break;
                case WAIT:
                    {
                    alt1=3;
                    }
                    break;

                }

                } finally {dbg.exitDecision(1);}

                switch (alt1) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // /home/javisank/Documents/Robotica/robotv1.g:52:10: rule3
            	    {
            	    dbg.location(52,10);
            	    pushFollow(FOLLOW_rule3_in_expr92);
            	    rule3();

            	    state._fsp--;


            	    }
            	    break;
            	case 2 :
            	    dbg.enterAlt(2);

            	    // /home/javisank/Documents/Robotica/robotv1.g:52:16: rule4
            	    {
            	    dbg.location(52,16);
            	    pushFollow(FOLLOW_rule4_in_expr94);
            	    rule4();

            	    state._fsp--;


            	    }
            	    break;
            	case 3 :
            	    dbg.enterAlt(3);

            	    // /home/javisank/Documents/Robotica/robotv1.g:52:22: rule5
            	    {
            	    dbg.location(52,22);
            	    pushFollow(FOLLOW_rule5_in_expr96);
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
        dbg.location(52, 29);

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
    // /home/javisank/Documents/Robotica/robotv1.g:56:1: rule1 : INIT ;
    public final void rule1() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "rule1");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(56, 1);

        try {
            // /home/javisank/Documents/Robotica/robotv1.g:56:7: ( INIT )
            dbg.enterAlt(1);

            // /home/javisank/Documents/Robotica/robotv1.g:57:1: INIT
            {
            dbg.location(57,1);
            match(input,INIT,FOLLOW_INIT_in_rule1109); 
            dbg.location(57,5);



            	System.out.println("/* \n --ROBOTICA 2016--\n JAVIER SANKOWICZ-LUCAS PAGLIA\n*/\n\n");
            	//
            	System.out.println("#include <DCMotor.h>");
            	System.out.println("DCMotor motor1(M1_EN, M1_D0, M1_D1);");
            	System.out.println("DCMotor motor0(M0_EN, M0_D0, M0_D1);");
            	System.out.println("void setup() {");

            	



            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(69, 2);

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
    // /home/javisank/Documents/Robotica/robotv1.g:71:1: rule2 : END ;
    public final void rule2() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "rule2");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(71, 1);

        try {
            // /home/javisank/Documents/Robotica/robotv1.g:71:7: ( END )
            dbg.enterAlt(1);

            // /home/javisank/Documents/Robotica/robotv1.g:73:1: END
            {
            dbg.location(73,1);
            match(input,END,FOLLOW_END_in_rule2120); 
            dbg.location(73,4);
            	
            	
            	System.out.println("\nmotor0.setSpeed(-0.0);");
            	System.out.println("motor1.setSpeed(0.0);");
            	System.out.println("}");
            	
            	System.out.println("\n//--fin del programa--\n");

            	System.out.println("void loop() {}");
            	


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(83, 2);

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
    // /home/javisank/Documents/Robotica/robotv1.g:86:1: rule3 : MOVC '(' velocidad= factor ',' tiempo= factor ',' delta_v= factor ',' sentido= factor ')' ;
    public final void rule3() throws RecognitionException {
        int velocidad = 0;

        int tiempo = 0;

        int delta_v = 0;

        int sentido = 0;


        try { dbg.enterRule(getGrammarFileName(), "rule3");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(86, 1);

        try {
            // /home/javisank/Documents/Robotica/robotv1.g:86:7: ( MOVC '(' velocidad= factor ',' tiempo= factor ',' delta_v= factor ',' sentido= factor ')' )
            dbg.enterAlt(1);

            // /home/javisank/Documents/Robotica/robotv1.g:88:1: MOVC '(' velocidad= factor ',' tiempo= factor ',' delta_v= factor ',' sentido= factor ')'
            {
            dbg.location(88,1);
            match(input,MOVC,FOLLOW_MOVC_in_rule3132); 
            dbg.location(88,6);
            match(input,21,FOLLOW_21_in_rule3134); 
            dbg.location(88,19);
            pushFollow(FOLLOW_factor_in_rule3138);
            velocidad=factor();

            state._fsp--;

            dbg.location(88,27);
            match(input,22,FOLLOW_22_in_rule3140); 
            dbg.location(88,37);
            pushFollow(FOLLOW_factor_in_rule3144);
            tiempo=factor();

            state._fsp--;

            dbg.location(88,45);
            match(input,22,FOLLOW_22_in_rule3146); 
            dbg.location(88,56);
            pushFollow(FOLLOW_factor_in_rule3150);
            delta_v=factor();

            state._fsp--;

            dbg.location(88,64);
            match(input,22,FOLLOW_22_in_rule3152); 
            dbg.location(88,75);
            pushFollow(FOLLOW_factor_in_rule3156);
            sentido=factor();

            state._fsp--;

            dbg.location(88,84);
            match(input,23,FOLLOW_23_in_rule3159); 
            dbg.location(88,87);
             //tiempo en ms
            	
            	System.out.println("\n//movimiento circular");
            if (sentido==1){
            	System.out.println("motor0.setSpeed(" + velocidad * (-1) + ");");
            	
            	if (delta_v<velocidad)  System.out.println("motor1.setSpeed(" + (velocidad-delta_v) + ");");
            	else   System.out.println("motor1.setSpeed(0)");
            	}
            	
            else {

            System.out.println("motor1.setSpeed(" + velocidad  + ");");
            	
            if (delta_v<velocidad)  System.out.println("motor0.setSpeed(" + (velocidad-delta_v)* (-1) + ");");
            else   System.out.println("motor0.setSpeed(0)");
            }
            	System.out.println("delay("+ tiempo + ");");


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(106, 2);

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
    // /home/javisank/Documents/Robotica/robotv1.g:109:1: rule4 : MOVL '(' velocidad= factor ',' tiempo= factor ')' ;
    public final void rule4() throws RecognitionException {
        int velocidad = 0;

        int tiempo = 0;


        try { dbg.enterRule(getGrammarFileName(), "rule4");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(109, 1);

        try {
            // /home/javisank/Documents/Robotica/robotv1.g:109:7: ( MOVL '(' velocidad= factor ',' tiempo= factor ')' )
            dbg.enterAlt(1);

            // /home/javisank/Documents/Robotica/robotv1.g:112:1: MOVL '(' velocidad= factor ',' tiempo= factor ')'
            {
            dbg.location(112,1);
            match(input,MOVL,FOLLOW_MOVL_in_rule4171); 
            dbg.location(112,6);
            match(input,21,FOLLOW_21_in_rule4173); 
            dbg.location(112,19);
            pushFollow(FOLLOW_factor_in_rule4177);
            velocidad=factor();

            state._fsp--;

            dbg.location(112,27);
            match(input,22,FOLLOW_22_in_rule4179); 
            dbg.location(112,37);
            pushFollow(FOLLOW_factor_in_rule4183);
            tiempo=factor();

            state._fsp--;

            dbg.location(112,45);
            match(input,23,FOLLOW_23_in_rule4185); 
            dbg.location(112,48);
             //tiempo en ms
            	System.out.println("\n//movimiento lineal");
            	System.out.println("motor0.setSpeed(" + velocidad * (-1) + ");");
            	System.out.println("motor1.setSpeed(" + velocidad + ");");
            	System.out.println("delay("+ tiempo + ");");
            	


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(118, 2);

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
    // /home/javisank/Documents/Robotica/robotv1.g:121:1: rule5 : WAIT '(' tiempo= factor ')' ;
    public final void rule5() throws RecognitionException {
        int tiempo = 0;


        try { dbg.enterRule(getGrammarFileName(), "rule5");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(121, 1);

        try {
            // /home/javisank/Documents/Robotica/robotv1.g:121:7: ( WAIT '(' tiempo= factor ')' )
            dbg.enterAlt(1);

            // /home/javisank/Documents/Robotica/robotv1.g:122:1: WAIT '(' tiempo= factor ')'
            {
            dbg.location(122,1);
            match(input,WAIT,FOLLOW_WAIT_in_rule5196); 
            dbg.location(122,6);
            match(input,21,FOLLOW_21_in_rule5198); 
            dbg.location(122,16);
            pushFollow(FOLLOW_factor_in_rule5202);
            tiempo=factor();

            state._fsp--;

            dbg.location(122,24);
            match(input,23,FOLLOW_23_in_rule5204); 
            dbg.location(122,28);

            	System.out.println("\n//espera n milisegundos");
            	System.out.println("motor0.setSpeed(0);");
            	System.out.println("motor1.setSpeed(0);");
            	System.out.println("delay("+ tiempo + ");");


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
            dbg.exitRule(getGrammarFileName(), "rule5");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "rule5"


    // $ANTLR start "factor"
    // /home/javisank/Documents/Robotica/robotv1.g:130:1: factor returns [int value] : ( INT | ID );
    public final int factor() throws RecognitionException {
        int value = 0;

        Token INT1=null;
        Token ID2=null;

        try { dbg.enterRule(getGrammarFileName(), "factor");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(130, 1);

        try {
            // /home/javisank/Documents/Robotica/robotv1.g:131:5: ( INT | ID )
            int alt2=2;
            try { dbg.enterDecision(2, decisionCanBacktrack[2]);

            int LA2_0 = input.LA(1);

            if ( (LA2_0==INT) ) {
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

                    // /home/javisank/Documents/Robotica/robotv1.g:131:9: INT
                    {
                    dbg.location(131,9);
                    INT1=(Token)match(input,INT,FOLLOW_INT_in_factor225); 
                    dbg.location(131,13);
                    value = Integer.parseInt((INT1!=null?INT1.getText():null));

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/javisank/Documents/Robotica/robotv1.g:132:7: ID
                    {
                    dbg.location(132,7);
                    ID2=(Token)match(input,ID,FOLLOW_ID_in_factor235); 
                    dbg.location(133,2);

                            Integer v = (Integer)variables.get((ID2!=null?ID2.getText():null));
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
        dbg.location(137, 10);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "factor");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return value;
    }
    // $ANTLR end "factor"


    // $ANTLR start "factor_float"
    // /home/javisank/Documents/Robotica/robotv1.g:140:1: factor_float returns [float value] : ( FLOAT | ID );
    public final float factor_float() throws RecognitionException {
        float value = 0.0f;

        Token FLOAT3=null;
        Token ID4=null;

        try { dbg.enterRule(getGrammarFileName(), "factor_float");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(140, 1);

        try {
            // /home/javisank/Documents/Robotica/robotv1.g:141:5: ( FLOAT | ID )
            int alt3=2;
            try { dbg.enterDecision(3, decisionCanBacktrack[3]);

            int LA3_0 = input.LA(1);

            if ( (LA3_0==FLOAT) ) {
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

                    // /home/javisank/Documents/Robotica/robotv1.g:141:9: FLOAT
                    {
                    dbg.location(141,9);
                    FLOAT3=(Token)match(input,FLOAT,FOLLOW_FLOAT_in_factor_float258); 
                    dbg.location(141,15);
                    value = Float.parseFloat((FLOAT3!=null?FLOAT3.getText():null));

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/javisank/Documents/Robotica/robotv1.g:142:7: ID
                    {
                    dbg.location(142,7);
                    ID4=(Token)match(input,ID,FOLLOW_ID_in_factor_float268); 
                    dbg.location(143,2);

                            Integer v = (Integer)variables.get((ID4!=null?ID4.getText():null));
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
        dbg.location(147, 10);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "factor_float");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return value;
    }
    // $ANTLR end "factor_float"

    // Delegated rules


 

    public static final BitSet FOLLOW_rule1_in_comp75 = new BitSet(new long[]{0x00000000000001C0L});
    public static final BitSet FOLLOW_expr_in_comp77 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_rule2_in_comp79 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule3_in_expr92 = new BitSet(new long[]{0x00000000000001C2L});
    public static final BitSet FOLLOW_rule4_in_expr94 = new BitSet(new long[]{0x00000000000001C2L});
    public static final BitSet FOLLOW_rule5_in_expr96 = new BitSet(new long[]{0x00000000000001C2L});
    public static final BitSet FOLLOW_INIT_in_rule1109 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_END_in_rule2120 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MOVC_in_rule3132 = new BitSet(new long[]{0x0000000000200000L});
    public static final BitSet FOLLOW_21_in_rule3134 = new BitSet(new long[]{0x0000000000000600L});
    public static final BitSet FOLLOW_factor_in_rule3138 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_22_in_rule3140 = new BitSet(new long[]{0x0000000000000600L});
    public static final BitSet FOLLOW_factor_in_rule3144 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_22_in_rule3146 = new BitSet(new long[]{0x0000000000000600L});
    public static final BitSet FOLLOW_factor_in_rule3150 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_22_in_rule3152 = new BitSet(new long[]{0x0000000000000600L});
    public static final BitSet FOLLOW_factor_in_rule3156 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_rule3159 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MOVL_in_rule4171 = new BitSet(new long[]{0x0000000000200000L});
    public static final BitSet FOLLOW_21_in_rule4173 = new BitSet(new long[]{0x0000000000000600L});
    public static final BitSet FOLLOW_factor_in_rule4177 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_22_in_rule4179 = new BitSet(new long[]{0x0000000000000600L});
    public static final BitSet FOLLOW_factor_in_rule4183 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_rule4185 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_WAIT_in_rule5196 = new BitSet(new long[]{0x0000000000200000L});
    public static final BitSet FOLLOW_21_in_rule5198 = new BitSet(new long[]{0x0000000000000600L});
    public static final BitSet FOLLOW_factor_in_rule5202 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_rule5204 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INT_in_factor225 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_factor235 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_FLOAT_in_factor_float258 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_factor_float268 = new BitSet(new long[]{0x0000000000000002L});

}