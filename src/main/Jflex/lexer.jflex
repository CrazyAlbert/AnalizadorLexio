import java.util.ArrayList;
import java.util.List;
import java.io.FileReader;
%%
%public
%class Lexer
%standalone
        
%{
            private List<String> tokens = new ArrayList<>();
%}
        

%{
            public List<String> analizar(String archivo){
    FileReader in = null;
    try{
    in = new FileReader(archivo);
    Lexer lexer = new Lexer(in);
    while(!lexer.zzAtEOF){
    lexer.yylex();
                        }
    }catch(Exception ex){
        System.out.println("Error al analizar el archivo.");
        }finally{
                try{
                       in.close();
                   }catch(Exception ex){
                    System.out.println("Error al cerrar el archivo");
                }
           }
                return tokens;
       }
%}
        
%%
"{"     {tokens.add("{"); System.out.println("Llave Izquirda");}
">"     {tokens.add(">"); System.out.println("Mayor");}
"<"     {tokens.add("<"); System.out.println("Menor");}
"=="    {tokens.add("=="); System.out.println("Igual");}
"%%"    {tokens.add(";"); System.out.println("Porcentaje");}
_[A-Za-z]|[0-9] {tokens.add("ID"); System.out.println("Identificador");}
[0-1000000] {tokens.add("Num"); System.out.println("Numeros");}
"}"     {tokens.add("}"); System.out.println("Llave Derecha");}