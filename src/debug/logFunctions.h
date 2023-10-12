#ifndef DEBUG_FUNCTIONS_H
#define DEBUG_FUNCTIONS_H

#include <iostream>
#include <fstream>

#define INFO_PRINT "[INFO] "
#define ERROR_PRINT "[ERROR] "

using std::ofstream;

extern ofstream logFile;

void closeLogFile();
void initLogFile(std::string filename);

#define RETURN_TOKEN(TOKEN, YYTEXT) \
        {\
            logFile << INFO_PRINT << "Lexer Token: " << YYTEXT << "\n";\
            return yylval.token = TOKEN;\
        }

#define LOG_PRINT(TYPE, TEXT) \
        {\
            logFile << TYPE << TEXT << "\n";\
        }

#endif 