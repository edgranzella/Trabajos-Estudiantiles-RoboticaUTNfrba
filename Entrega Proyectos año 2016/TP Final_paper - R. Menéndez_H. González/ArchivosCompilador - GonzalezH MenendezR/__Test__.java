import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.debug.DebugEventSocketProxy;


public class __Test__ {

    public static void main(String args[]) throws Exception {
        multiploN6Lexer lex = new multiploN6Lexer(new ANTLRFileStream("/home/ubuntu/Descargas/output/__Test___input.txt", "UTF8"));
        CommonTokenStream tokens = new CommonTokenStream(lex);

        multiploN6Parser g = new multiploN6Parser(tokens, 49100, null);
        try {
            g.exprmoverocho();
        } catch (RecognitionException e) {
            e.printStackTrace();
        }
    }
}