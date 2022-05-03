// $ANTLR 3.5.1 C:\\ANTRL\\JarvisCommand.g 2016-04-01 16:02:39

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class JarvisCommandLexer extends Lexer {
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
	// delegators
	public Lexer[] getDelegates() {
		return new Lexer[] {};
	}

	public JarvisCommandLexer() {} 
	public JarvisCommandLexer(CharStream input) {
		this(input, new RecognizerSharedState());
	}
	public JarvisCommandLexer(CharStream input, RecognizerSharedState state) {
		super(input,state);
	}
	@Override public String getGrammarFileName() { return "C:\\ANTRL\\JarvisCommand.g"; }

	// $ANTLR start "COMA"
	public final void mCOMA() throws RecognitionException {
		try {
			int _type = COMA;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\ANTRL\\JarvisCommand.g:2:6: ( ',' )
			// C:\\ANTRL\\JarvisCommand.g:2:8: ','
			{
			match(','); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "COMA"

	// $ANTLR start "FINISH"
	public final void mFINISH() throws RecognitionException {
		try {
			int _type = FINISH;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\ANTRL\\JarvisCommand.g:3:8: ( 'Terminar' )
			// C:\\ANTRL\\JarvisCommand.g:3:10: 'Terminar'
			{
			match("Terminar"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "FINISH"

	// $ANTLR start "FORWARD"
	public final void mFORWARD() throws RecognitionException {
		try {
			int _type = FORWARD;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\ANTRL\\JarvisCommand.g:4:9: ( 'Adelante' )
			// C:\\ANTRL\\JarvisCommand.g:4:11: 'Adelante'
			{
			match("Adelante"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "FORWARD"

	// $ANTLR start "INIT"
	public final void mINIT() throws RecognitionException {
		try {
			int _type = INIT;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\ANTRL\\JarvisCommand.g:5:6: ( 'Iniciar' )
			// C:\\ANTRL\\JarvisCommand.g:5:8: 'Iniciar'
			{
			match("Iniciar"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "INIT"

	// $ANTLR start "PAR1"
	public final void mPAR1() throws RecognitionException {
		try {
			int _type = PAR1;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\ANTRL\\JarvisCommand.g:6:6: ( '(' )
			// C:\\ANTRL\\JarvisCommand.g:6:8: '('
			{
			match('('); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "PAR1"

	// $ANTLR start "PAR2"
	public final void mPAR2() throws RecognitionException {
		try {
			int _type = PAR2;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\ANTRL\\JarvisCommand.g:7:6: ( ')' )
			// C:\\ANTRL\\JarvisCommand.g:7:8: ')'
			{
			match(')'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "PAR2"

	// $ANTLR start "TURN_LEFT"
	public final void mTURN_LEFT() throws RecognitionException {
		try {
			int _type = TURN_LEFT;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\ANTRL\\JarvisCommand.g:8:11: ( 'Doblar_Izq' )
			// C:\\ANTRL\\JarvisCommand.g:8:13: 'Doblar_Izq'
			{
			match("Doblar_Izq"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "TURN_LEFT"

	// $ANTLR start "TURN_RIGHT"
	public final void mTURN_RIGHT() throws RecognitionException {
		try {
			int _type = TURN_RIGHT;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\ANTRL\\JarvisCommand.g:9:12: ( 'Doblar_Der' )
			// C:\\ANTRL\\JarvisCommand.g:9:14: 'Doblar_Der'
			{
			match("Doblar_Der"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "TURN_RIGHT"

	// $ANTLR start "WHITESPACE"
	public final void mWHITESPACE() throws RecognitionException {
		try {
			int _type = WHITESPACE;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\ANTRL\\JarvisCommand.g:294:12: ( ( '\\t' | ' ' | '\\r' | '\\n' | '\\u000C' )+ )
			// C:\\ANTRL\\JarvisCommand.g:294:14: ( '\\t' | ' ' | '\\r' | '\\n' | '\\u000C' )+
			{
			// C:\\ANTRL\\JarvisCommand.g:294:14: ( '\\t' | ' ' | '\\r' | '\\n' | '\\u000C' )+
			int cnt1=0;
			loop1:
			while (true) {
				int alt1=2;
				int LA1_0 = input.LA(1);
				if ( ((LA1_0 >= '\t' && LA1_0 <= '\n')||(LA1_0 >= '\f' && LA1_0 <= '\r')||LA1_0==' ') ) {
					alt1=1;
				}

				switch (alt1) {
				case 1 :
					// C:\\ANTRL\\JarvisCommand.g:
					{
					if ( (input.LA(1) >= '\t' && input.LA(1) <= '\n')||(input.LA(1) >= '\f' && input.LA(1) <= '\r')||input.LA(1)==' ' ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					if ( cnt1 >= 1 ) break loop1;
					EarlyExitException eee = new EarlyExitException(1, input);
					throw eee;
				}
				cnt1++;
			}

			 _channel = HIDDEN; 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "WHITESPACE"

	// $ANTLR start "NUM_ENTERO"
	public final void mNUM_ENTERO() throws RecognitionException {
		try {
			int _type = NUM_ENTERO;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\ANTRL\\JarvisCommand.g:295:13: ( INTEGER )
			// C:\\ANTRL\\JarvisCommand.g:295:15: INTEGER
			{
			mINTEGER(); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "NUM_ENTERO"

	// $ANTLR start "NUM_FLOT"
	public final void mNUM_FLOT() throws RecognitionException {
		try {
			int _type = NUM_FLOT;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\ANTRL\\JarvisCommand.g:296:10: ( FLOAT )
			// C:\\ANTRL\\JarvisCommand.g:296:12: FLOAT
			{
			mFLOAT(); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "NUM_FLOT"

	// $ANTLR start "SIGN"
	public final void mSIGN() throws RecognitionException {
		try {
			// C:\\ANTRL\\JarvisCommand.g:297:16: ( ( '+' | '-' ) )
			// C:\\ANTRL\\JarvisCommand.g:
			{
			if ( input.LA(1)=='+'||input.LA(1)=='-' ) {
				input.consume();
			}
			else {
				MismatchedSetException mse = new MismatchedSetException(null,input);
				recover(mse);
				throw mse;
			}
			}

		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "SIGN"

	// $ANTLR start "FLOAT"
	public final void mFLOAT() throws RecognitionException {
		try {
			// C:\\ANTRL\\JarvisCommand.g:298:17: ( INTEGER '.' ( '0' .. '9' )+ )
			// C:\\ANTRL\\JarvisCommand.g:298:21: INTEGER '.' ( '0' .. '9' )+
			{
			mINTEGER(); 

			match('.'); 
			// C:\\ANTRL\\JarvisCommand.g:298:33: ( '0' .. '9' )+
			int cnt2=0;
			loop2:
			while (true) {
				int alt2=2;
				int LA2_0 = input.LA(1);
				if ( ((LA2_0 >= '0' && LA2_0 <= '9')) ) {
					alt2=1;
				}

				switch (alt2) {
				case 1 :
					// C:\\ANTRL\\JarvisCommand.g:
					{
					if ( (input.LA(1) >= '0' && input.LA(1) <= '9') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					if ( cnt2 >= 1 ) break loop2;
					EarlyExitException eee = new EarlyExitException(2, input);
					throw eee;
				}
				cnt2++;
			}

			}

		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "FLOAT"

	// $ANTLR start "INTEGER"
	public final void mINTEGER() throws RecognitionException {
		try {
			// C:\\ANTRL\\JarvisCommand.g:299:18: ( ( SIGN )? ( '0' .. '9' )+ )
			// C:\\ANTRL\\JarvisCommand.g:299:20: ( SIGN )? ( '0' .. '9' )+
			{
			// C:\\ANTRL\\JarvisCommand.g:299:20: ( SIGN )?
			int alt3=2;
			int LA3_0 = input.LA(1);
			if ( (LA3_0=='+'||LA3_0=='-') ) {
				alt3=1;
			}
			switch (alt3) {
				case 1 :
					// C:\\ANTRL\\JarvisCommand.g:
					{
					if ( input.LA(1)=='+'||input.LA(1)=='-' ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

			}

			// C:\\ANTRL\\JarvisCommand.g:299:28: ( '0' .. '9' )+
			int cnt4=0;
			loop4:
			while (true) {
				int alt4=2;
				int LA4_0 = input.LA(1);
				if ( ((LA4_0 >= '0' && LA4_0 <= '9')) ) {
					alt4=1;
				}

				switch (alt4) {
				case 1 :
					// C:\\ANTRL\\JarvisCommand.g:
					{
					if ( (input.LA(1) >= '0' && input.LA(1) <= '9') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					if ( cnt4 >= 1 ) break loop4;
					EarlyExitException eee = new EarlyExitException(4, input);
					throw eee;
				}
				cnt4++;
			}

			}

		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "INTEGER"

	@Override
	public void mTokens() throws RecognitionException {
		// C:\\ANTRL\\JarvisCommand.g:1:8: ( COMA | FINISH | FORWARD | INIT | PAR1 | PAR2 | TURN_LEFT | TURN_RIGHT | WHITESPACE | NUM_ENTERO | NUM_FLOT )
		int alt5=11;
		alt5 = dfa5.predict(input);
		switch (alt5) {
			case 1 :
				// C:\\ANTRL\\JarvisCommand.g:1:10: COMA
				{
				mCOMA(); 

				}
				break;
			case 2 :
				// C:\\ANTRL\\JarvisCommand.g:1:15: FINISH
				{
				mFINISH(); 

				}
				break;
			case 3 :
				// C:\\ANTRL\\JarvisCommand.g:1:22: FORWARD
				{
				mFORWARD(); 

				}
				break;
			case 4 :
				// C:\\ANTRL\\JarvisCommand.g:1:30: INIT
				{
				mINIT(); 

				}
				break;
			case 5 :
				// C:\\ANTRL\\JarvisCommand.g:1:35: PAR1
				{
				mPAR1(); 

				}
				break;
			case 6 :
				// C:\\ANTRL\\JarvisCommand.g:1:40: PAR2
				{
				mPAR2(); 

				}
				break;
			case 7 :
				// C:\\ANTRL\\JarvisCommand.g:1:45: TURN_LEFT
				{
				mTURN_LEFT(); 

				}
				break;
			case 8 :
				// C:\\ANTRL\\JarvisCommand.g:1:55: TURN_RIGHT
				{
				mTURN_RIGHT(); 

				}
				break;
			case 9 :
				// C:\\ANTRL\\JarvisCommand.g:1:66: WHITESPACE
				{
				mWHITESPACE(); 

				}
				break;
			case 10 :
				// C:\\ANTRL\\JarvisCommand.g:1:77: NUM_ENTERO
				{
				mNUM_ENTERO(); 

				}
				break;
			case 11 :
				// C:\\ANTRL\\JarvisCommand.g:1:88: NUM_FLOT
				{
				mNUM_FLOT(); 

				}
				break;

		}
	}


	protected DFA5 dfa5 = new DFA5(this);
	static final String DFA5_eotS =
		"\12\uffff\1\14\12\uffff";
	static final String DFA5_eofS =
		"\25\uffff";
	static final String DFA5_minS =
		"\1\11\6\uffff\1\157\1\uffff\1\60\1\56\1\142\2\uffff\1\154\1\141\1\162"+
		"\1\137\1\104\2\uffff";
	static final String DFA5_maxS =
		"\1\124\6\uffff\1\157\1\uffff\2\71\1\142\2\uffff\1\154\1\141\1\162\1\137"+
		"\1\111\2\uffff";
	static final String DFA5_acceptS =
		"\1\uffff\1\1\1\2\1\3\1\4\1\5\1\6\1\uffff\1\11\3\uffff\1\12\1\13\5\uffff"+
		"\1\7\1\10";
	static final String DFA5_specialS =
		"\25\uffff}>";
	static final String[] DFA5_transitionS = {
			"\2\10\1\uffff\2\10\22\uffff\1\10\7\uffff\1\5\1\6\1\uffff\1\11\1\1\1\11"+
			"\2\uffff\12\12\7\uffff\1\3\2\uffff\1\7\4\uffff\1\4\12\uffff\1\2",
			"",
			"",
			"",
			"",
			"",
			"",
			"\1\13",
			"",
			"\12\12",
			"\1\15\1\uffff\12\12",
			"\1\16",
			"",
			"",
			"\1\17",
			"\1\20",
			"\1\21",
			"\1\22",
			"\1\24\4\uffff\1\23",
			"",
			""
	};

	static final short[] DFA5_eot = DFA.unpackEncodedString(DFA5_eotS);
	static final short[] DFA5_eof = DFA.unpackEncodedString(DFA5_eofS);
	static final char[] DFA5_min = DFA.unpackEncodedStringToUnsignedChars(DFA5_minS);
	static final char[] DFA5_max = DFA.unpackEncodedStringToUnsignedChars(DFA5_maxS);
	static final short[] DFA5_accept = DFA.unpackEncodedString(DFA5_acceptS);
	static final short[] DFA5_special = DFA.unpackEncodedString(DFA5_specialS);
	static final short[][] DFA5_transition;

	static {
		int numStates = DFA5_transitionS.length;
		DFA5_transition = new short[numStates][];
		for (int i=0; i<numStates; i++) {
			DFA5_transition[i] = DFA.unpackEncodedString(DFA5_transitionS[i]);
		}
	}

	protected class DFA5 extends DFA {

		public DFA5(BaseRecognizer recognizer) {
			this.recognizer = recognizer;
			this.decisionNumber = 5;
			this.eot = DFA5_eot;
			this.eof = DFA5_eof;
			this.min = DFA5_min;
			this.max = DFA5_max;
			this.accept = DFA5_accept;
			this.special = DFA5_special;
			this.transition = DFA5_transition;
		}
		@Override
		public String getDescription() {
			return "1:1: Tokens : ( COMA | FINISH | FORWARD | INIT | PAR1 | PAR2 | TURN_LEFT | TURN_RIGHT | WHITESPACE | NUM_ENTERO | NUM_FLOT );";
		}
	}

}
