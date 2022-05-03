// $ANTLR 3.3 Nov 30, 2010 12:45:30 /home/ubuntu/Descargas/multiploN6.g 2016-09-12 00:25:56

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class multiploN6Parser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "MOVE", "COMA", "INT", "ID", "LEFT_PARENT", "RIGHT_PARENT", "COMMENT", "WS"
    };
    public static final int EOF=-1;
    public static final int MOVE=4;
    public static final int COMA=5;
    public static final int INT=6;
    public static final int ID=7;
    public static final int LEFT_PARENT=8;
    public static final int RIGHT_PARENT=9;
    public static final int COMMENT=10;
    public static final int WS=11;

    // delegates
    // delegators


        public multiploN6Parser(TokenStream input) {
            this(input, new RecognizerSharedState());
        }
        public multiploN6Parser(TokenStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        

    public String[] getTokenNames() { return multiploN6Parser.tokenNames; }
    public String getGrammarFileName() { return "/home/ubuntu/Descargas/multiploN6.g"; }



    // $ANTLR start "exprmoverocho"
    // /home/ubuntu/Descargas/multiploN6.g:9:1: exprmoverocho : MOVE '(' vel_r COMA vel_l COMA tiempo_1 COMA tiempo_2 ')' ;
    public final void exprmoverocho() throws RecognitionException {
        int vel_r1 = 0;

        int vel_l2 = 0;

        int tiempo_13 = 0;

        int tiempo_24 = 0;


        try {
            // /home/ubuntu/Descargas/multiploN6.g:9:15: ( MOVE '(' vel_r COMA vel_l COMA tiempo_1 COMA tiempo_2 ')' )
            // /home/ubuntu/Descargas/multiploN6.g:9:17: MOVE '(' vel_r COMA vel_l COMA tiempo_1 COMA tiempo_2 ')'
            {
            match(input,MOVE,FOLLOW_MOVE_in_exprmoverocho24); 
            match(input,LEFT_PARENT,FOLLOW_LEFT_PARENT_in_exprmoverocho26); 
            pushFollow(FOLLOW_vel_r_in_exprmoverocho28);
            vel_r1=vel_r();

            state._fsp--;

            match(input,COMA,FOLLOW_COMA_in_exprmoverocho30); 
            pushFollow(FOLLOW_vel_l_in_exprmoverocho32);
            vel_l2=vel_l();

            state._fsp--;

            match(input,COMA,FOLLOW_COMA_in_exprmoverocho34); 
            pushFollow(FOLLOW_tiempo_1_in_exprmoverocho36);
            tiempo_13=tiempo_1();

            state._fsp--;

            match(input,COMA,FOLLOW_COMA_in_exprmoverocho38); 
            pushFollow(FOLLOW_tiempo_2_in_exprmoverocho40);
            tiempo_24=tiempo_2();

            state._fsp--;

            match(input,RIGHT_PARENT,FOLLOW_RIGHT_PARENT_in_exprmoverocho42); 

            /*Chequeo si es correcto el rango*/
            boolean check_velocidades_tiempo_OK = false;
            if((0<vel_r1)&&(vel_r1<=100)&&(0<vel_l2)&&(vel_l2<=100)&&(0<tiempo_13)&&(tiempo_13<30)&&(0<tiempo_24)&&(tiempo_24<30))
            {
            	check_velocidades_tiempo_OK = true;
            }
            if(check_velocidades_tiempo_OK)
            {
            	System.out.println("/*-----------------------------------------MATLAB INPUT--------------------------------------------*/");
            	System.out.println(" w_r="+vel_r1+";");
            	System.out.println(" w_i="+vel_l2+";");
            	System.out.println(" t_1="+tiempo_13+";");
            	System.out.println(" t_2="+tiempo_24+";");
            	
            	System.out.println("/*--------------------------------------FIN MATLAB INPUT--------------------------------------------*/");
            	
            	
            	System.out.println("/*--------------------------------------MULTIPLO N6 INPUT--------------------------------------------*/");
            	System.out.println(" int speed_R="+vel_r1+";");
            	System.out.println(" int speed_L="+vel_l2+";");
            	System.out.println(" int tiempo_1="+tiempo_13+";");
            	System.out.println(" int tiempo_2="+tiempo_24+";");

            	System.out.println("/*----------------------------------FIN MULTIPLO N6 INPUT--------------------------------------------*/");

            }else
            {
            System.out.println("/*Error: alguna de las variables ingresadas esta fuera de los rangos permitidos*/");
            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "exprmoverocho"


    // $ANTLR start "vel_r"
    // /home/ubuntu/Descargas/multiploN6.g:42:1: vel_r returns [int vel] : INT ;
    public final int vel_r() throws RecognitionException {
        int vel = 0;

        Token INT5=null;

        try {
            // /home/ubuntu/Descargas/multiploN6.g:42:24: ( INT )
            // /home/ubuntu/Descargas/multiploN6.g:42:25: INT
            {
            INT5=(Token)match(input,INT,FOLLOW_INT_in_vel_r54); 
            vel = Integer.parseInt((INT5!=null?INT5.getText():null));

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return vel;
    }
    // $ANTLR end "vel_r"


    // $ANTLR start "vel_l"
    // /home/ubuntu/Descargas/multiploN6.g:44:1: vel_l returns [int vel] : INT ;
    public final int vel_l() throws RecognitionException {
        int vel = 0;

        Token INT6=null;

        try {
            // /home/ubuntu/Descargas/multiploN6.g:44:24: ( INT )
            // /home/ubuntu/Descargas/multiploN6.g:44:25: INT
            {
            INT6=(Token)match(input,INT,FOLLOW_INT_in_vel_l66); 
            vel = Integer.parseInt((INT6!=null?INT6.getText():null));

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return vel;
    }
    // $ANTLR end "vel_l"


    // $ANTLR start "tiempo_1"
    // /home/ubuntu/Descargas/multiploN6.g:46:1: tiempo_1 returns [int time] : INT ;
    public final int tiempo_1() throws RecognitionException {
        int time = 0;

        Token INT7=null;

        try {
            // /home/ubuntu/Descargas/multiploN6.g:46:28: ( INT )
            // /home/ubuntu/Descargas/multiploN6.g:46:29: INT
            {
            INT7=(Token)match(input,INT,FOLLOW_INT_in_tiempo_178); 
            time = Integer.parseInt((INT7!=null?INT7.getText():null));

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return time;
    }
    // $ANTLR end "tiempo_1"


    // $ANTLR start "tiempo_2"
    // /home/ubuntu/Descargas/multiploN6.g:48:1: tiempo_2 returns [int time] : INT ;
    public final int tiempo_2() throws RecognitionException {
        int time = 0;

        Token INT8=null;

        try {
            // /home/ubuntu/Descargas/multiploN6.g:48:28: ( INT )
            // /home/ubuntu/Descargas/multiploN6.g:48:29: INT
            {
            INT8=(Token)match(input,INT,FOLLOW_INT_in_tiempo_290); 
            time = Integer.parseInt((INT8!=null?INT8.getText():null));

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return time;
    }
    // $ANTLR end "tiempo_2"

    // Delegated rules


 

    public static final BitSet FOLLOW_MOVE_in_exprmoverocho24 = new BitSet(new long[]{0x0000000000000100L});
    public static final BitSet FOLLOW_LEFT_PARENT_in_exprmoverocho26 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_vel_r_in_exprmoverocho28 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_COMA_in_exprmoverocho30 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_vel_l_in_exprmoverocho32 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_COMA_in_exprmoverocho34 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_tiempo_1_in_exprmoverocho36 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_COMA_in_exprmoverocho38 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_tiempo_2_in_exprmoverocho40 = new BitSet(new long[]{0x0000000000000200L});
    public static final BitSet FOLLOW_RIGHT_PARENT_in_exprmoverocho42 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INT_in_vel_r54 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INT_in_vel_l66 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INT_in_tiempo_178 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INT_in_tiempo_290 = new BitSet(new long[]{0x0000000000000002L});

}