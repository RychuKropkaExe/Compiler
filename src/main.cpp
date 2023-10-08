#include "../headers/symbolTable.hpp"
#include <iostream>
#include <vector>
#include <string>

extern void run_parser(FILE *file, std::vector<std::string> &test);

int main(int argc, char** argv){

    if(argc < 2){
        printf("No path provided\n");
        return 0;
    }
    std::vector<std::string> testList;
    run_parser(NULL, testList);

}