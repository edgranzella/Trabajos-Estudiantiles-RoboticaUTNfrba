import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.debug.DebugEventSocketProxy;


public class __Test__ {

    public static void main(String args[]) throws Exception {
        robotv1Lexer lex = new robotv1Lexer(new ANTLRFileStream("/home/javisank/Documents/Robotica/output/__Test___input.txt", "UTF8"));
        CommonTokenStream tokens = new CommonTokenStream(lex);

        robotv1Parser g = new robotv1Parser(tokens, 49100, null);
        try {
            g.comp();
        } catch (RecognitionException e) {
            e.printStackTrace();
        }
    }
}