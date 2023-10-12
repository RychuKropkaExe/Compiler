%{
    #include "parser.hpp"
    #include "logFunctions.h"
    #include <vector>
    int line_num = 1;
    bool comment = false;
%}

%option noyywrap
%option yylineno

%%

\n line_num++;

"[" RETURN_TOKEN(COMMENT_OPENING, yytext)
"]" RETURN_TOKEN(COMMENT_CLOSE, yytext)

" " 

\t 

\% RETURN_TOKEN(MODULO, yytext)

"(" RETURN_TOKEN(OP_BRACKET, yytext)

")" RETURN_TOKEN(CL_BRACKET, yytext)

"," RETURN_TOKEN(DOT, yytext)

":=" RETURN_TOKEN(ASSIGN, yytext)

"<=" RETURN_TOKEN(LEQ, yytext)

">=" RETURN_TOKEN(GEQ, yytext)

"<" RETURN_TOKEN(LT, yytext)

">" RETURN_TOKEN(GT, yytext)

"!=" RETURN_TOKEN(NEQ, yytext)

"=" RETURN_TOKEN(EQ, yytext)

";" RETURN_TOKEN(COMMAND_END, yytext)

"+" RETURN_TOKEN(ADD, yytext)

"-" RETURN_TOKEN(SUB, yytext)

"*" RETURN_TOKEN(MUL, yytext)

"/" RETURN_TOKEN(DIV, yytext)

"^" RETURN_TOKEN(POW, yytext)

"PROCEDURE" RETURN_TOKEN(PROCEDURE, yytext)

"IS" RETURN_TOKEN(IS, yytext) 

"VAR" RETURN_TOKEN(VAR, yytext)

"BEGIN" RETURN_TOKEN(BEGIN_TOKEN, yytext)

"ENDIF" RETURN_TOKEN(ENDIF, yytext)

"ENDWHILE" RETURN_TOKEN(ENDWHILE, yytext)

"END" RETURN_TOKEN(END, yytext)

"PROGRAM" RETURN_TOKEN(PROGRAM, yytext)

"IF" RETURN_TOKEN(IF, yytext)

"THEN" RETURN_TOKEN(THEN, yytext)

"ELSE" RETURN_TOKEN(ELSE, yytext)

"WHILE" RETURN_TOKEN(WHILE, yytext)

"DO" RETURN_TOKEN(DO, yytext)

"REPEAT" RETURN_TOKEN(REPEAT, yytext)

"UNTIL" RETURN_TOKEN(UNTIL, yytext)

"READ" RETURN_TOKEN(READ, yytext)

"WRITE" RETURN_TOKEN(WRITE, yytext)

[0-9]+ {if(!comment){
        yylval.num = atoll(yytext);
        LOG_PRINT(INFO_PRINT, "Lexer Token: " << yytext);
        return NUM;
    };}

[_a-z]+ {if(!comment){
    yylval.id = new std::string(yytext, yyleng);
    LOG_PRINT(INFO_PRINT, "Lexer Token: " << yytext);
    return IDENTIFIER;
    };}

. {if(!comment){
        std::cout << "ERROR UNEXPECTED TOKEN " << yytext << "\n";
    };}

%%