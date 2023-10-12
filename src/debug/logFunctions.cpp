#include "logFunctions.h"

ofstream logFile;

void initLogFile(std::string filename){
    logFile.open(filename, std::ios::out);
}

void closeLogFile(){
    logFile.close();
}