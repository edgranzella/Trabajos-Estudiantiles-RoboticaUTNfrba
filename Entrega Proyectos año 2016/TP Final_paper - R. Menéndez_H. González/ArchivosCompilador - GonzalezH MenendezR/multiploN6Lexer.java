// $ANTLR 3.3 Nov 30, 2010 12:45:30 /home/ubuntu/Descargas/multiploN6.g 2016-09-12 00:25:57

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class multiploN6Lexer extends Lexer {
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

    public multiploN6Lexer() {;} 
    public multiploN6Lexer(CharStream input) {
        this(input, new RecognizerSharedState());
    }
    public multiploN6Lexer(CharStream input, RecognizerSharedState state) {
        super(input,state);

    }
    public String getGrammarFileName() { return "/home/ubuntu/Descargas/multiploN6.g"; }

    // $ANTLR start "MOVE"
    public final void mMOVE() throws RecognitionException {
        try {
            int _type = MOVE;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/ubuntu/Descargas/multiploN6.g:3:6: ( 'mover_ocho' )
            // /home/ubuntu/Descargas/multiploN6.g:3:8: 'mover_ocho'
            {
            match("mover_ocho"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "MOVE"

    // $ANTLR start "ID"
    public final void mID() throws RecognitionException {
        try {
            int _type = ID;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/ubuntu/Descargas/multiploN6.g:51:5: ( ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' ) )
            // /home/ubuntu/Descargas/multiploN6.g:51:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )
            {
            if ( (input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

            if ( (input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}


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
            // /home/ubuntu/Descargas/multiploN6.g:54:5: ( ( '0' .. '9' )+ )
            // /home/ubuntu/Descargas/multiploN6.g:54:7: ( '0' .. '9' )+
            {
            // /home/ubuntu/Descargas/multiploN6.g:54:7: ( '0' .. '9' )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( ((LA1_0>='0' && LA1_0<='9')) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // /home/ubuntu/Descargas/multiploN6.g:54:7: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

            	    }
            	    break;

            	default :
            	    if ( cnt1 >= 1 ) break loop1;
                        EarlyExitException eee =
                            new EarlyExitException(1, input);
                        throw eee;
                }
                cnt1++;
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "INT"

    // $ANTLR start "COMA"
    public final void mCOMA() throws RecognitionException {
        try {
            int _type = COMA;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/ubuntu/Descargas/multiploN6.g:56:6: ( ',' )
            // /home/ubuntu/Descargas/multiploN6.g:56:8: ','
            {
            match(','); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "COMA"

    // $ANTLR start "LEFT_PARENT"
    public final void mLEFT_PARENT() throws RecognitionException {
        try {
            int _type = LEFT_PARENT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/ubuntu/Descargas/multiploN6.g:59:5: ( '(' )
            // /home/ubuntu/Descargas/multiploN6.g:59:9: '('
            {
            match('('); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "LEFT_PARENT"

    // $ANTLR start "RIGHT_PARENT"
    public final void mRIGHT_PARENT() throws RecognitionException {
        try {
            int _type = RIGHT_PARENT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/ubuntu/Descargas/multiploN6.g:63:5: ( ')' )
            // /home/ubuntu/Descargas/multiploN6.g:63:9: ')'
            {
            match(')'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "RIGHT_PARENT"

    // $ANTLR start "COMMENT"
    public final void mCOMMENT() throws RecognitionException {
        try {
            int _type = COMMENT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/ubuntu/Descargas/multiploN6.g:67:5: ( '//' (~ ( '\\n' | '\\r' ) )* ( '\\r' )? '\\n' | '/*' ( options {greedy=false; } : . )* '*/' )
            int alt5=2;
            int LA5_0 = input.LA(1);

            if ( (LA5_0=='/') ) {
                int LA5_1 = input.LA(2);

                if ( (LA5_1=='/') ) {
                    alt5=1;
                }
                else if ( (LA5_1=='*') ) {
                    alt5=2;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 5, 1, input);

                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 5, 0, input);

                throw nvae;
            }
            switch (alt5) {
                case 1 :
                    // /home/ubuntu/Descargas/multiploN6.g:67:9: '//' (~ ( '\\n' | '\\r' ) )* ( '\\r' )? '\\n'
                    {
                    match("//"); 

                    // /home/ubuntu/Descargas/multiploN6.g:67:14: (~ ( '\\n' | '\\r' ) )*
                    loop2:
                    do {
                        int alt2=2;
                        int LA2_0 = input.LA(1);

                        if ( ((LA2_0>='\u0000' && LA2_0<='\t')||(LA2_0>='\u000B' && LA2_0<='\f')||(LA2_0>='\u000E' && LA2_0<='\uFFFF')) ) {
                            alt2=1;
                        }


                        switch (alt2) {
                    	case 1 :
                    	    // /home/ubuntu/Descargas/multiploN6.g:67:14: ~ ( '\\n' | '\\r' )
                    	    {
                    	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='\t')||(input.LA(1)>='\u000B' && input.LA(1)<='\f')||(input.LA(1)>='\u000E' && input.LA(1)<='\uFFFF') ) {
                    	        input.consume();

                    	    }
                    	    else {
                    	        MismatchedSetException mse = new MismatchedSetException(null,input);
                    	        recover(mse);
                    	        throw mse;}


                    	    }
                    	    break;

                    	default :
                    	    break loop2;
                        }
                    } while (true);

                    // /home/ubuntu/Descargas/multiploN6.g:67:28: ( '\\r' )?
                    int alt3=2;
                    int LA3_0 = input.LA(1);

                    if ( (LA3_0=='\r') ) {
                        alt3=1;
                    }
                    switch (alt3) {
                        case 1 :
                            // /home/ubuntu/Descargas/multiploN6.g:67:28: '\\r'
                            {
                            match('\r'); 

                            }
                            break;

                    }

                    match('\n'); 
                    _channel=HIDDEN;

                    }
                    break;
                case 2 :
                    // /home/ubuntu/Descargas/multiploN6.g:68:9: '/*' ( options {greedy=false; } : . )* '*/'
                    {
                    match("/*"); 

                    // /home/ubuntu/Descargas/multiploN6.g:68:14: ( options {greedy=false; } : . )*
                    loop4:
                    do {
                        int alt4=2;
                        int LA4_0 = input.LA(1);

                        if ( (LA4_0=='*') ) {
                            int LA4_1 = input.LA(2);

                            if ( (LA4_1=='/') ) {
                                alt4=2;
                            }
                            else if ( ((LA4_1>='\u0000' && LA4_1<='.')||(LA4_1>='0' && LA4_1<='\uFFFF')) ) {
                                alt4=1;
                            }


                        }
                        else if ( ((LA4_0>='\u0000' && LA4_0<=')')||(LA4_0>='+' && LA4_0<='\uFFFF')) ) {
                            alt4=1;
                        }


                        switch (alt4) {
                    	case 1 :
                    	    // /home/ubuntu/Descargas/multiploN6.g:68:42: .
                    	    {
                    	    matchAny(); 

                    	    }
                    	    break;

                    	default :
                    	    break loop4;
                        }
                    } while (true);

                    match("*/"); 

                    _channel=HIDDEN;

                    }
                    break;

            }
            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "COMMENT"

    // $ANTLR start "WS"
    public final void mWS() throws RecognitionException {
        try {
            int _type = WS;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /home/ubuntu/Descargas/multiploN6.g:71:5: ( ( ' ' | '\\t' | '\\r' | '\\n' ) )
            // /home/ubuntu/Descargas/multiploN6.g:71:9: ( ' ' | '\\t' | '\\r' | '\\n' )
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

    public void mTokens() throws RecognitionException {
        // /home/ubuntu/Descargas/multiploN6.g:1:8: ( MOVE | ID | INT | COMA | LEFT_PARENT | RIGHT_PARENT | COMMENT | WS )
        int alt6=8;
        alt6 = dfa6.predict(input);
        switch (alt6) {
            case 1 :
                // /home/ubuntu/Descargas/multiploN6.g:1:10: MOVE
                {
                mMOVE(); 

                }
                break;
            case 2 :
                // /home/ubuntu/Descargas/multiploN6.g:1:15: ID
                {
                mID(); 

                }
                break;
            case 3 :
                // /home/ubuntu/Descargas/multiploN6.g:1:18: INT
                {
                mINT(); 

                }
                break;
            case 4 :
                // /home/ubuntu/Descargas/multiploN6.g:1:22: COMA
                {
                mCOMA(); 

                }
                break;
            case 5 :
                // /home/ubuntu/Descargas/multiploN6.g:1:27: LEFT_PARENT
                {
                mLEFT_PARENT(); 

                }
                break;
            case 6 :
                // /home/ubuntu/Descargas/multiploN6.g:1:39: RIGHT_PARENT
                {
                mRIGHT_PARENT(); 

                }
                break;
            case 7 :
                // /home/ubuntu/Descargas/multiploN6.g:1:52: COMMENT
                {
                mCOMMENT(); 

                }
                break;
            case 8 :
                // /home/ubuntu/Descargas/multiploN6.g:1:60: WS
                {
                mWS(); 

                }
                break;

        }

    }


    protected DFA6 dfa6 = new DFA6(this);
    static final String DFA6_eotS =
        "\11\uffff\1\2\1\uffff";
    static final String DFA6_eofS =
        "\13\uffff";
    static final String DFA6_minS =
        "\1\11\1\60\7\uffff\1\166\1\uffff";
    static final String DFA6_maxS =
        "\2\172\7\uffff\1\166\1\uffff";
    static final String DFA6_acceptS =
        "\2\uffff\1\2\1\3\1\4\1\5\1\6\1\7\1\10\1\uffff\1\1";
    static final String DFA6_specialS =
        "\13\uffff}>";
    static final String[] DFA6_transitionS = {
            "\2\10\2\uffff\1\10\22\uffff\1\10\7\uffff\1\5\1\6\2\uffff\1\4"+
            "\2\uffff\1\7\12\3\7\uffff\32\2\4\uffff\1\2\1\uffff\14\2\1\1"+
            "\15\2",
            "\12\2\7\uffff\32\2\4\uffff\1\2\1\uffff\16\2\1\11\13\2",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "\1\12",
            ""
    };

    static final short[] DFA6_eot = DFA.unpackEncodedString(DFA6_eotS);
    static final short[] DFA6_eof = DFA.unpackEncodedString(DFA6_eofS);
    static final char[] DFA6_min = DFA.unpackEncodedStringToUnsignedChars(DFA6_minS);
    static final char[] DFA6_max = DFA.unpackEncodedStringToUnsignedChars(DFA6_maxS);
    static final short[] DFA6_accept = DFA.unpackEncodedString(DFA6_acceptS);
    static final short[] DFA6_special = DFA.unpackEncodedString(DFA6_specialS);
    static final short[][] DFA6_transition;

    static {
        int numStates = DFA6_transitionS.length;
        DFA6_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA6_transition[i] = DFA.unpackEncodedString(DFA6_transitionS[i]);
        }
    }

    class DFA6 extends DFA {

        public DFA6(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 6;
            this.eot = DFA6_eot;
            this.eof = DFA6_eof;
            this.min = DFA6_min;
            this.max = DFA6_max;
            this.accept = DFA6_accept;
            this.special = DFA6_special;
            this.transition = DFA6_transition;
        }
        public String getDescription() {
            return "1:1: Tokens : ( MOVE | ID | INT | COMA | LEFT_PARENT | RIGHT_PARENT | COMMENT | WS );";
        }
    }
 

}