import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.debug.DebugEventSocketProxy;


public class __Test__ {

    public static void main(String args[]) throws Exception {
        Compilador_RoboticaLexer lex = new Compilador_RoboticaLexer(new ANTLRFileStream("C:\\Users\\Usuario\\Documents\\MATERIAS-UTN\\ROBOTICA\\Tesis_Final_Garnica-Tuma.v1\\output\\__Test___input.txt", "UTF8"));
        CommonTokenStream tokens = new CommonTokenStream(lex);

        Compilador_RoboticaParser g = new Compilador_RoboticaParser(tokens, 49100, null);
        try {
            g.expr();
        } catch (RecognitionException e) {
            e.printStackTrace();
        }
    }
}