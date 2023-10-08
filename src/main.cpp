#include "../headers/symbolTable.hpp"
#include <iostream>
#include <list>
#include <string>

extern void run_parser(FILE *file, std::list<std::string> test);

int main(int argc, char** argv){

    if(argc < 2){
        printf("No path provided\n");
        return 0;
    }

    run_parser(NULL, std::list<std::string>());
    

}