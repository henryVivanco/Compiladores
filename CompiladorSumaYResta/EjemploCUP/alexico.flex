

package ejemplocup;

import java_cup.runtime.*;
import java.io.Reader;
      
%% 

%class AnalizadorLexico


%line
%column
%cup

%{
    
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}


Salto = \r|\n|\r\n

Espacio     = {Salto} | [ \t\f]

Entero = [0-9][0-9]


%% 
   
<YYINITIAL> {
  
    "h"                 { return symbol(sym.FINLINEA); }

    "MAS"               {  System.out.print(" MAS ");
                          return symbol(sym.SUMA); }

    "MENOS"             {  System.out.print(" MENOS ");
                          return symbol(sym.RESTA); } 

    "Imp"               { return symbol(sym.IMPRIMIR); }    
 

    {Entero}   {   System.out.print(yytext()); 
                      return symbol(sym.ENTERO, new Integer(yytext())); }


    {Espacio}       { /* ignora el espacio */ } 
    
}

[^] { System.err.println("Caracter Ilegal: " + "<<"+ yytext() + ">>" + "[" + yyline + ":" + yycolumn + "]"); }
