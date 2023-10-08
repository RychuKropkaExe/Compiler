%{
    #include "parser.hpp"
    #include <vector>
    int line_num = 1;
    bool comment = false;
%}

%option noyywrap
%option yylineno

%%

\n line_num++;

"[" return COMMENT_OPENING;
"]" return COMMENT_CLOSE;

" " 

\t 

\% return MODULO;

"(" return OP_BRACKET;

")" return CL_BRACKET;

"," return DOT;

":=" return ASSIGN;

"<=" return LEQ;

">=" return GEQ;

"<" return LT;

">" return GT;

"!=" return NEQ;

"=" return EQ;

";" return COMMAND_END;

"+" return ADD;

"-" return SUB;

"*" return MUL;

"/" return DIV;

"^" return POW;

"PROCEDURE" return PROCEDURE;

"IS" return IS; 

"VAR" return VAR;

"BEGIN" return BEGIN_TOKEN;

"ENDIF" return ENDIF;

"ENDWHILE" return ENDWHILE;

"END" return END;

"PROGRAM" return PROGRAM;

"IF" return IF;

"THEN" return THEN;

"ELSE" return ELSE;

"WHILE" return WHILE;

"DO" return DO;

"REPEAT" return REPEAT;

"UNTIL" return UNTIL;

"READ" return READ;

"WRITE" return WRITE;

[0-9]+ {if(!comment){
        yylval.num = atoll(yytext);
        std::cout << yytext;
        return NUM;
    };}

[_a-z]+ {if(!comment){
    yylval.id = new std::string(yytext, yyleng);
    std::cout << yytext;
    return IDENTIFIER;
    };}

. {if(!comment){
        std::cout << "ERROR UNEXPECTED TOKEN " << yytext << "\n";
    };}

%%