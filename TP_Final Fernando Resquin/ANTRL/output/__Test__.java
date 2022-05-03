import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.debug.DebugEventSocketProxy;


public class __Test__ {

    public static void main(String args[]) throws Exception {
        JarvisCommandLexer lex = new JarvisCommandLexer(new ANTLRFileStream("C:\\ANTRL\\Trayectoria1.prg", "UTF8"));
        CommonTokenStream tokens = new CommonTokenStream(lex);

        JarvisCommandParser g = new JarvisCommandParser(tokens, 49100, null);
        try {
            g.expr_init();
        } catch (RecognitionException e) {
            e.printStackTrace();
        }
    }
}