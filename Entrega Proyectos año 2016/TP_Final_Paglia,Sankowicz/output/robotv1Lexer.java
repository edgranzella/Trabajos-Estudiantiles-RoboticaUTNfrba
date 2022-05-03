// $ANTLR 3.3 Nov 30, 2010 12:45:30 /home/javisank/Documents/Robotica/robotv1.g 2016-09-10 10:43:33

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class robotv1Lexer extends Lexer {
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

    public robotv1Lexer() {;} 
    public robotv1Lexer(CharStream input) {
        this(input, new RecognizerSharedState());
    }
    public robotv1Lexer(CharStream input, RecognizerSharedState state) {
        super(input,state);

    }
    public String getGrammarFileName() { return "/home/javisank/Documents/Robotica/robotv1.g"; }

    // $ANTLR start "INIT"
    public final void mINIT() throws RecognitionException {
        try {
            int _type = INIT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:3:6: ( 'init' )
            // /home/javisank/Documents/Robotica/robotv1.g:3:8: 'init'
            {
            match("init"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "INIT"

    // $ANTLR start "END"
    public final void mEND() throws RecognitionException {
        try {
            int _type = END;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:4:5: ( 'end' )
            // /home/javisank/Documents/Robotica/robotv1.g:4:7: 'end'
            {
            match("end"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "END"

    // $ANTLR start "MOVC"
    public final void mMOVC() throws RecognitionException {
        try {
            int _type = MOVC;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:5:6: ( 'movc' )
            // /home/javisank/Documents/Robotica/robotv1.g:5:8: 'movc'
            {
            match("movc"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "MOVC"

    // $ANTLR start "MOVL"
    public final void mMOVL() throws RecognitionException {
        try {
            int _type = MOVL;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:6:6: ( 'movl' )
            // /home/javisank/Documents/Robotica/robotv1.g:6:8: 'movl'
            {
            match("movl"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "MOVL"

    // $ANTLR start "WAIT"
    public final void mWAIT() throws RecognitionException {
        try {
            int _type = WAIT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:7:6: ( 'wait' )
            // /home/javisank/Documents/Robotica/robotv1.g:7:8: 'wait'
            {
            match("wait"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "WAIT"

    // $ANTLR start "T__21"
    public final void mT__21() throws RecognitionException {
        try {
            int _type = T__21;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:8:7: ( '(' )
            // /home/javisank/Documents/Robotica/robotv1.g:8:9: '('
            {
            match('('); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__21"

    // $ANTLR start "T__22"
    public final void mT__22() throws RecognitionException {
        try {
            int _type = T__22;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:9:7: ( ',' )
            // /home/javisank/Documents/Robotica/robotv1.g:9:9: ','
            {
            match(','); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__22"

    // $ANTLR start "T__23"
    public final void mT__23() throws RecognitionException {
        try {
            int _type = T__23;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:10:7: ( ')' )
            // /home/javisank/Documents/Robotica/robotv1.g:10:9: ')'
            {
            match(')'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__23"

    // $ANTLR start "ID"
    public final void mID() throws RecognitionException {
        try {
            int _type = ID;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:152:5: ( ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )* )
            // /home/javisank/Documents/Robotica/robotv1.g:152:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
            {
            if ( (input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

            // /home/javisank/Documents/Robotica/robotv1.g:152:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( ((LA1_0>='0' && LA1_0<='9')||(LA1_0>='A' && LA1_0<='Z')||LA1_0=='_'||(LA1_0>='a' && LA1_0<='z')) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // /home/javisank/Documents/Robotica/robotv1.g:
            	    {
            	    if ( (input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "ID"

    // $ANTLR start "INT"
    public final void mINT() throws RecognitionException {
        try {
            int _type = INT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:155:5: ( ( '0' .. '9' )+ )
            // /home/javisank/Documents/Robotica/robotv1.g:155:7: ( '0' .. '9' )+
            {
            // /home/javisank/Documents/Robotica/robotv1.g:155:7: ( '0' .. '9' )+
            int cnt2=0;
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);

                if ( ((LA2_0>='0' && LA2_0<='9')) ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // /home/javisank/Documents/Robotica/robotv1.g:155:7: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

            	    }
            	    break;

            	default :
            	    if ( cnt2 >= 1 ) break loop2;
                        EarlyExitException eee =
                            new EarlyExitException(2, input);
                        throw eee;
                }
                cnt2++;
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "INT"

    // $ANTLR start "DIGIT"
    public final void mDIGIT() throws RecognitionException {
        try {
            // /home/javisank/Documents/Robotica/robotv1.g:159:16: ( ( '0' .. '9' )+ )
            // /home/javisank/Documents/Robotica/robotv1.g:159:18: ( '0' .. '9' )+
            {
            // /home/javisank/Documents/Robotica/robotv1.g:159:18: ( '0' .. '9' )+
            int cnt3=0;
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);

                if ( ((LA3_0>='0' && LA3_0<='9')) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // /home/javisank/Documents/Robotica/robotv1.g:159:19: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

            	    }
            	    break;

            	default :
            	    if ( cnt3 >= 1 ) break loop3;
                        EarlyExitException eee =
                            new EarlyExitException(3, input);
                        throw eee;
                }
                cnt3++;
            } while (true);


            }

        }
        finally {
        }
    }
    // $ANTLR end "DIGIT"

    // $ANTLR start "FLOAT"
    public final void mFLOAT() throws RecognitionException {
        try {
            int _type = FLOAT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:163:5: ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT )
            int alt10=3;
            alt10 = dfa10.predict(input);
            switch (alt10) {
                case 1 :
                    // /home/javisank/Documents/Robotica/robotv1.g:163:9: ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
                    {
                    // /home/javisank/Documents/Robotica/robotv1.g:163:9: ( '0' .. '9' )+
                    int cnt4=0;
                    loop4:
                    do {
                        int alt4=2;
                        int LA4_0 = input.LA(1);

                        if ( ((LA4_0>='0' && LA4_0<='9')) ) {
                            alt4=1;
                        }


                        switch (alt4) {
                    	case 1 :
                    	    // /home/javisank/Documents/Robotica/robotv1.g:163:10: '0' .. '9'
                    	    {
                    	    matchRange('0','9'); 

                    	    }
                    	    break;

                    	default :
                    	    if ( cnt4 >= 1 ) break loop4;
                                EarlyExitException eee =
                                    new EarlyExitException(4, input);
                                throw eee;
                        }
                        cnt4++;
                    } while (true);

                    match('.'); 
                    // /home/javisank/Documents/Robotica/robotv1.g:163:25: ( '0' .. '9' )*
                    loop5:
                    do {
                        int alt5=2;
                        int LA5_0 = input.LA(1);

                        if ( ((LA5_0>='0' && LA5_0<='9')) ) {
                            alt5=1;
                        }


                        switch (alt5) {
                    	case 1 :
                    	    // /home/javisank/Documents/Robotica/robotv1.g:163:26: '0' .. '9'
                    	    {
                    	    matchRange('0','9'); 

                    	    }
                    	    break;

                    	default :
                    	    break loop5;
                        }
                    } while (true);

                    // /home/javisank/Documents/Robotica/robotv1.g:163:37: ( EXPONENT )?
                    int alt6=2;
                    int LA6_0 = input.LA(1);

                    if ( (LA6_0=='E'||LA6_0=='e') ) {
                        alt6=1;
                    }
                    switch (alt6) {
                        case 1 :
                            // /home/javisank/Documents/Robotica/robotv1.g:163:37: EXPONENT
                            {
                            mEXPONENT(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // /home/javisank/Documents/Robotica/robotv1.g:164:9: '.' ( '0' .. '9' )+ ( EXPONENT )?
                    {
                    match('.'); 
                    // /home/javisank/Documents/Robotica/robotv1.g:164:13: ( '0' .. '9' )+
                    int cnt7=0;
                    loop7:
                    do {
                        int alt7=2;
                        int LA7_0 = input.LA(1);

                        if ( ((LA7_0>='0' && LA7_0<='9')) ) {
                            alt7=1;
                        }


                        switch (alt7) {
                    	case 1 :
                    	    // /home/javisank/Documents/Robotica/robotv1.g:164:14: '0' .. '9'
                    	    {
                    	    matchRange('0','9'); 

                    	    }
                    	    break;

                    	default :
                    	    if ( cnt7 >= 1 ) break loop7;
                                EarlyExitException eee =
                                    new EarlyExitException(7, input);
                                throw eee;
                        }
                        cnt7++;
                    } while (true);

                    // /home/javisank/Documents/Robotica/robotv1.g:164:25: ( EXPONENT )?
                    int alt8=2;
                    int LA8_0 = input.LA(1);

                    if ( (LA8_0=='E'||LA8_0=='e') ) {
                        alt8=1;
                    }
                    switch (alt8) {
                        case 1 :
                            // /home/javisank/Documents/Robotica/robotv1.g:164:25: EXPONENT
                            {
                            mEXPONENT(); 

                            }
                            break;

                    }


                    }
                    break;
                case 3 :
                    // /home/javisank/Documents/Robotica/robotv1.g:165:9: ( '0' .. '9' )+ EXPONENT
                    {
                    // /home/javisank/Documents/Robotica/robotv1.g:165:9: ( '0' .. '9' )+
                    int cnt9=0;
                    loop9:
                    do {
                        int alt9=2;
                        int LA9_0 = input.LA(1);

                        if ( ((LA9_0>='0' && LA9_0<='9')) ) {
                            alt9=1;
                        }


                        switch (alt9) {
                    	case 1 :
                    	    // /home/javisank/Documents/Robotica/robotv1.g:165:10: '0' .. '9'
                    	    {
                    	    matchRange('0','9'); 

                    	    }
                    	    break;

                    	default :
                    	    if ( cnt9 >= 1 ) break loop9;
                                EarlyExitException eee =
                                    new EarlyExitException(9, input);
                                throw eee;
                        }
                        cnt9++;
                    } while (true);

                    mEXPONENT(); 

                    }
                    break;

            }
            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "FLOAT"

    // $ANTLR start "WS"
    public final void mWS() throws RecognitionException {
        try {
            int _type = WS;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:168:5: ( ( ' ' | '\\t' | '\\r' | '\\n' ) )
            // /home/javisank/Documents/Robotica/robotv1.g:168:9: ( ' ' | '\\t' | '\\r' | '\\n' )
            {
            if ( (input.LA(1)>='\t' && input.LA(1)<='\n')||input.LA(1)=='\r'||input.LA(1)==' ' ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

            _channel=HIDDEN;

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "WS"

    // $ANTLR start "STRING"
    public final void mSTRING() throws RecognitionException {
        try {
            int _type = STRING;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:176:5: ( '\"' ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )* '\"' )
            // /home/javisank/Documents/Robotica/robotv1.g:176:8: '\"' ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )* '\"'
            {
            match('\"'); 
            // /home/javisank/Documents/Robotica/robotv1.g:176:12: ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )*
            loop11:
            do {
                int alt11=3;
                int LA11_0 = input.LA(1);

                if ( (LA11_0=='\\') ) {
                    alt11=1;
                }
                else if ( ((LA11_0>='\u0000' && LA11_0<='!')||(LA11_0>='#' && LA11_0<='[')||(LA11_0>=']' && LA11_0<='\uFFFF')) ) {
                    alt11=2;
                }


                switch (alt11) {
            	case 1 :
            	    // /home/javisank/Documents/Robotica/robotv1.g:176:14: ESC_SEQ
            	    {
            	    mESC_SEQ(); 

            	    }
            	    break;
            	case 2 :
            	    // /home/javisank/Documents/Robotica/robotv1.g:176:24: ~ ( '\\\\' | '\"' )
            	    {
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='!')||(input.LA(1)>='#' && input.LA(1)<='[')||(input.LA(1)>=']' && input.LA(1)<='\uFFFF') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    break loop11;
                }
            } while (true);

            match('\"'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "STRING"

    // $ANTLR start "CHAR"
    public final void mCHAR() throws RecognitionException {
        try {
            int _type = CHAR;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/javisank/Documents/Robotica/robotv1.g:179:5: ( '\\'' ( ESC_SEQ | ~ ( '\\'' | '\\\\' ) ) '\\'' )
            // /home/javisank/Documents/Robotica/robotv1.g:179:8: '\\'' ( ESC_SEQ | ~ ( '\\'' | '\\\\' ) ) '\\''
            {
            match('\''); 
            // /home/javisank/Documents/Robotica/robotv1.g:179:13: ( ESC_SEQ | ~ ( '\\'' | '\\\\' ) )
            int alt12=2;
            int LA12_0 = input.LA(1);

            if ( (LA12_0=='\\') ) {
                alt12=1;
            }
            else if ( ((LA12_0>='\u0000' && LA12_0<='&')||(LA12_0>='(' && LA12_0<='[')||(LA12_0>=']' && LA12_0<='\uFFFF')) ) {
                alt12=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 12, 0, input);

                throw nvae;
            }
            switch (alt12) {
                case 1 :
                    // /home/javisank/Documents/Robotica/robotv1.g:179:15: ESC_SEQ
                    {
                    mESC_SEQ(); 

                    }
                    break;
                case 2 :
                    // /home/javisank/Documents/Robotica/robotv1.g:179:25: ~ ( '\\'' | '\\\\' )
                    {
                    if ( (input.LA(1)>='\u0000' && input.LA(1)<='&')||(input.LA(1)>='(' && input.LA(1)<='[')||(input.LA(1)>=']' && input.LA(1)<='\uFFFF') ) {
                        input.consume();

                    }
                    else {
                        MismatchedSetException mse = new MismatchedSetException(null,input);
                        recover(mse);
                        throw mse;}


                    }
                    break;

            }

            match('\''); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "CHAR"

    // $ANTLR start "EXPONENT"
    public final void mEXPONENT() throws RecognitionException {
        try {
            // /home/javisank/Documents/Robotica/robotv1.g:183:10: ( ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+ )
            // /home/javisank/Documents/Robotica/robotv1.g:183:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
            {
            if ( input.LA(1)=='E'||input.LA(1)=='e' ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

            // /home/javisank/Documents/Robotica/robotv1.g:183:22: ( '+' | '-' )?
            int alt13=2;
            int LA13_0 = input.LA(1);

            if ( (LA13_0=='+'||LA13_0=='-') ) {
                alt13=1;
            }
            switch (alt13) {
                case 1 :
                    // /home/javisank/Documents/Robotica/robotv1.g:
                    {
                    if ( input.LA(1)=='+'||input.LA(1)=='-' ) {
                        input.consume();

                    }
                    else {
                        MismatchedSetException mse = new MismatchedSetException(null,input);
                        recover(mse);
                        throw mse;}


                    }
                    break;

            }

            // /home/javisank/Documents/Robotica/robotv1.g:183:33: ( '0' .. '9' )+
            int cnt14=0;
            loop14:
            do {
                int alt14=2;
                int LA14_0 = input.LA(1);

                if ( ((LA14_0>='0' && LA14_0<='9')) ) {
                    alt14=1;
                }


                switch (alt14) {
            	case 1 :
            	    // /home/javisank/Documents/Robotica/robotv1.g:183:34: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

            	    }
            	    break;

            	default :
            	    if ( cnt14 >= 1 ) break loop14;
                        EarlyExitException eee =
                            new EarlyExitException(14, input);
                        throw eee;
                }
                cnt14++;
            } while (true);


            }

        }
        finally {
        }
    }
    // $ANTLR end "EXPONENT"

    // $ANTLR start "HEX_DIGIT"
    public final void mHEX_DIGIT() throws RecognitionException {
        try {
            // /home/javisank/Documents/Robotica/robotv1.g:186:11: ( ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' ) )
            // /home/javisank/Documents/Robotica/robotv1.g:186:13: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
            {
            if ( (input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='F')||(input.LA(1)>='a' && input.LA(1)<='f') ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}


            }

        }
        finally {
        }
    }
    // $ANTLR end "HEX_DIGIT"

    // $ANTLR start "ESC_SEQ"
    public final void mESC_SEQ() throws RecognitionException {
        try {
            // /home/javisank/Documents/Robotica/robotv1.g:190:5: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' ) | UNICODE_ESC | OCTAL_ESC )
            int alt15=3;
            int LA15_0 = input.LA(1);

            if ( (LA15_0=='\\') ) {
                switch ( input.LA(2) ) {
                case '\"':
                case '\'':
                case '\\':
                case 'b':
                case 'f':
                case 'n':
                case 'r':
                case 't':
                    {
                    alt15=1;
                    }
                    break;
                case 'u':
                    {
                    alt15=2;
                    }
                    break;
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                    {
                    alt15=3;
                    }
                    break;
                default:
                    NoViableAltException nvae =
                        new NoViableAltException("", 15, 1, input);

                    throw nvae;
                }

            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 15, 0, input);

                throw nvae;
            }
            switch (alt15) {
                case 1 :
                    // /home/javisank/Documents/Robotica/robotv1.g:190:9: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' )
                    {
                    match('\\'); 
                    if ( input.LA(1)=='\"'||input.LA(1)=='\''||input.LA(1)=='\\'||input.LA(1)=='b'||input.LA(1)=='f'||input.LA(1)=='n'||input.LA(1)=='r'||input.LA(1)=='t' ) {
                        input.consume();

                    }
                    else {
                        MismatchedSetException mse = new MismatchedSetException(null,input);
                        recover(mse);
                        throw mse;}


                    }
                    break;
                case 2 :
                    // /home/javisank/Documents/Robotica/robotv1.g:191:9: UNICODE_ESC
                    {
                    mUNICODE_ESC(); 

                    }
                    break;
                case 3 :
                    // /home/javisank/Documents/Robotica/robotv1.g:192:9: OCTAL_ESC
                    {
                    mOCTAL_ESC(); 

                    }
                    break;

            }
        }
        finally {
        }
    }
    // $ANTLR end "ESC_SEQ"

    // $ANTLR start "OCTAL_ESC"
    public final void mOCTAL_ESC() throws RecognitionException {
        try {
            // /home/javisank/Documents/Robotica/robotv1.g:197:5: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
            int alt16=3;
            int LA16_0 = input.LA(1);

            if ( (LA16_0=='\\') ) {
                int LA16_1 = input.LA(2);

                if ( ((LA16_1>='0' && LA16_1<='3')) ) {
                    int LA16_2 = input.LA(3);

                    if ( ((LA16_2>='0' && LA16_2<='7')) ) {
                        int LA16_4 = input.LA(4);

                        if ( ((LA16_4>='0' && LA16_4<='7')) ) {
                            alt16=1;
                        }
                        else {
                            alt16=2;}
                    }
                    else {
                        alt16=3;}
                }
                else if ( ((LA16_1>='4' && LA16_1<='7')) ) {
                    int LA16_3 = input.LA(3);

                    if ( ((LA16_3>='0' && LA16_3<='7')) ) {
                        alt16=2;
                    }
                    else {
                        alt16=3;}
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 16, 1, input);

                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 16, 0, input);

                throw nvae;
            }
            switch (alt16) {
                case 1 :
                    // /home/javisank/Documents/Robotica/robotv1.g:197:9: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
                    {
                    match('\\'); 
                    // /home/javisank/Documents/Robotica/robotv1.g:197:14: ( '0' .. '3' )
                    // /home/javisank/Documents/Robotica/robotv1.g:197:15: '0' .. '3'
                    {
                    matchRange('0','3'); 

                    }

                    // /home/javisank/Documents/Robotica/robotv1.g:197:25: ( '0' .. '7' )
                    // /home/javisank/Documents/Robotica/robotv1.g:197:26: '0' .. '7'
                    {
                    matchRange('0','7'); 

                    }

                    // /home/javisank/Documents/Robotica/robotv1.g:197:36: ( '0' .. '7' )
                    // /home/javisank/Documents/Robotica/robotv1.g:197:37: '0' .. '7'
                    {
                    matchRange('0','7'); 

                    }


                    }
                    break;
                case 2 :
                    // /home/javisank/Documents/Robotica/robotv1.g:198:9: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
                    {
                    match('\\'); 
                    // /home/javisank/Documents/Robotica/robotv1.g:198:14: ( '0' .. '7' )
                    // /home/javisank/Documents/Robotica/robotv1.g:198:15: '0' .. '7'
                    {
                    matchRange('0','7'); 

                    }

                    // /home/javisank/Documents/Robotica/robotv1.g:198:25: ( '0' .. '7' )
                    // /home/javisank/Documents/Robotica/robotv1.g:198:26: '0' .. '7'
                    {
                    matchRange('0','7'); 

                    }


                    }
                    break;
                case 3 :
                    // /home/javisank/Documents/Robotica/robotv1.g:199:9: '\\\\' ( '0' .. '7' )
                    {
                    match('\\'); 
                    // /home/javisank/Documents/Robotica/robotv1.g:199:14: ( '0' .. '7' )
                    // /home/javisank/Documents/Robotica/robotv1.g:199:15: '0' .. '7'
                    {
                    matchRange('0','7'); 

                    }


                    }
                    break;

            }
        }
        finally {
        }
    }
    // $ANTLR end "OCTAL_ESC"

    // $ANTLR start "UNICODE_ESC"
    public final void mUNICODE_ESC() throws RecognitionException {
        try {
            // /home/javisank/Documents/Robotica/robotv1.g:204:5: ( '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT )
            // /home/javisank/Documents/Robotica/robotv1.g:204:9: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
            {
            match('\\'); 
            match('u'); 
            mHEX_DIGIT(); 
            mHEX_DIGIT(); 
            mHEX_DIGIT(); 
            mHEX_DIGIT(); 

            }

        }
        finally {
        }
    }
    // $ANTLR end "UNICODE_ESC"

    public void mTokens() throws RecognitionException {
        // /home/javisank/Documents/Robotica/robotv1.g:1:8: ( INIT | END | MOVC | MOVL | WAIT | T__21 | T__22 | T__23 | ID | INT | FLOAT | WS | STRING | CHAR )
        int alt17=14;
        alt17 = dfa17.predict(input);
        switch (alt17) {
            case 1 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:10: INIT
                {
                mINIT(); 

                }
                break;
            case 2 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:15: END
                {
                mEND(); 

                }
                break;
            case 3 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:19: MOVC
                {
                mMOVC(); 

                }
                break;
            case 4 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:24: MOVL
                {
                mMOVL(); 

                }
                break;
            case 5 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:29: WAIT
                {
                mWAIT(); 

                }
                break;
            case 6 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:34: T__21
                {
                mT__21(); 

                }
                break;
            case 7 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:40: T__22
                {
                mT__22(); 

                }
                break;
            case 8 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:46: T__23
                {
                mT__23(); 

                }
                break;
            case 9 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:52: ID
                {
                mID(); 

                }
                break;
            case 10 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:55: INT
                {
                mINT(); 

                }
                break;
            case 11 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:59: FLOAT
                {
                mFLOAT(); 

                }
                break;
            case 12 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:65: WS
                {
                mWS(); 

                }
                break;
            case 13 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:68: STRING
                {
                mSTRING(); 

                }
                break;
            case 14 :
                // /home/javisank/Documents/Robotica/robotv1.g:1:75: CHAR
                {
                mCHAR(); 

                }
                break;

        }

    }


    protected DFA10 dfa10 = new DFA10(this);
    protected DFA17 dfa17 = new DFA17(this);
    static final String DFA10_eotS =
        "\5\uffff";
    static final String DFA10_eofS =
        "\5\uffff";
    static final String DFA10_minS =
        "\2\56\3\uffff";
    static final String DFA10_maxS =
        "\1\71\1\145\3\uffff";
    static final String DFA10_acceptS =
        "\2\uffff\1\2\1\1\1\3";
    static final String DFA10_specialS =
        "\5\uffff}>";
    static final String[] DFA10_transitionS = {
            "\1\2\1\uffff\12\1",
            "\1\3\1\uffff\12\1\13\uffff\1\4\37\uffff\1\4",
            "",
            "",
            ""
    };

    static final short[] DFA10_eot = DFA.unpackEncodedString(DFA10_eotS);
    static final short[] DFA10_eof = DFA.unpackEncodedString(DFA10_eofS);
    static final char[] DFA10_min = DFA.unpackEncodedStringToUnsignedChars(DFA10_minS);
    static final char[] DFA10_max = DFA.unpackEncodedStringToUnsignedChars(DFA10_maxS);
    static final short[] DFA10_accept = DFA.unpackEncodedString(DFA10_acceptS);
    static final short[] DFA10_special = DFA.unpackEncodedString(DFA10_specialS);
    static final short[][] DFA10_transition;

    static {
        int numStates = DFA10_transitionS.length;
        DFA10_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA10_transition[i] = DFA.unpackEncodedString(DFA10_transitionS[i]);
        }
    }

    class DFA10 extends DFA {

        public DFA10(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 10;
            this.eot = DFA10_eot;
            this.eof = DFA10_eof;
            this.min = DFA10_min;
            this.max = DFA10_max;
            this.accept = DFA10_accept;
            this.special = DFA10_special;
            this.transition = DFA10_transition;
        }
        public String getDescription() {
            return "162:1: FLOAT : ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT );";
        }
    }
    static final String DFA17_eotS =
        "\1\uffff\4\10\4\uffff\1\22\4\uffff\4\10\1\uffff\1\10\1\30\2\10\1"+
        "\34\1\uffff\1\35\1\36\1\37\4\uffff";
    static final String DFA17_eofS =
        "\40\uffff";
    static final String DFA17_minS =
        "\1\11\2\156\1\157\1\141\4\uffff\1\56\4\uffff\1\151\1\144\1\166\1"+
        "\151\1\uffff\1\164\1\60\1\143\1\164\1\60\1\uffff\3\60\4\uffff";
    static final String DFA17_maxS =
        "\1\172\2\156\1\157\1\141\4\uffff\1\145\4\uffff\1\151\1\144\1\166"+
        "\1\151\1\uffff\1\164\1\172\1\154\1\164\1\172\1\uffff\3\172\4\uffff";
    static final String DFA17_acceptS =
        "\5\uffff\1\6\1\7\1\10\1\11\1\uffff\1\13\1\14\1\15\1\16\4\uffff\1"+
        "\12\5\uffff\1\2\3\uffff\1\1\1\3\1\4\1\5";
    static final String DFA17_specialS =
        "\40\uffff}>";
    static final String[] DFA17_transitionS = {
            "\2\13\2\uffff\1\13\22\uffff\1\13\1\uffff\1\14\4\uffff\1\15\1"+
            "\5\1\7\2\uffff\1\6\1\uffff\1\12\1\uffff\12\11\7\uffff\32\10"+
            "\4\uffff\1\10\1\uffff\4\10\1\2\3\10\1\1\3\10\1\3\11\10\1\4\3"+
            "\10",
            "\1\16",
            "\1\17",
            "\1\20",
            "\1\21",
            "",
            "",
            "",
            "",
            "\1\12\1\uffff\12\11\13\uffff\1\12\37\uffff\1\12",
            "",
            "",
            "",
            "",
            "\1\23",
            "\1\24",
            "\1\25",
            "\1\26",
            "",
            "\1\27",
            "\12\10\7\uffff\32\10\4\uffff\1\10\1\uffff\32\10",
            "\1\31\10\uffff\1\32",
            "\1\33",
            "\12\10\7\uffff\32\10\4\uffff\1\10\1\uffff\32\10",
            "",
            "\12\10\7\uffff\32\10\4\uffff\1\10\1\uffff\32\10",
            "\12\10\7\uffff\32\10\4\uffff\1\10\1\uffff\32\10",
            "\12\10\7\uffff\32\10\4\uffff\1\10\1\uffff\32\10",
            "",
            "",
            "",
            ""
    };

    static final short[] DFA17_eot = DFA.unpackEncodedString(DFA17_eotS);
    static final short[] DFA17_eof = DFA.unpackEncodedString(DFA17_eofS);
    static final char[] DFA17_min = DFA.unpackEncodedStringToUnsignedChars(DFA17_minS);
    static final char[] DFA17_max = DFA.unpackEncodedStringToUnsignedChars(DFA17_maxS);
    static final short[] DFA17_accept = DFA.unpackEncodedString(DFA17_acceptS);
    static final short[] DFA17_special = DFA.unpackEncodedString(DFA17_specialS);
    static final short[][] DFA17_transition;

    static {
        int numStates = DFA17_transitionS.length;
        DFA17_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA17_transition[i] = DFA.unpackEncodedString(DFA17_transitionS[i]);
        }
    }

    class DFA17 extends DFA {

        public DFA17(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 17;
            this.eot = DFA17_eot;
            this.eof = DFA17_eof;
            this.min = DFA17_min;
            this.max = DFA17_max;
            this.accept = DFA17_accept;
            this.special = DFA17_special;
            this.transition = DFA17_transition;
        }
        public String getDescription() {
            return "1:1: Tokens : ( INIT | END | MOVC | MOVL | WAIT | T__21 | T__22 | T__23 | ID | INT | FLOAT | WS | STRING | CHAR );";
        }
    }
 

}