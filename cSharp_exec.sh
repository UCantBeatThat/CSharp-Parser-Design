cd Parser/
bison -d cSharpParser.y &>/dev/null
flex cSharpParser.l
gcc cSharpParser.tab.c lex.yy.c -o cSharpParser
./cSharpParser $1

cd ../SymTab_Implementation
flex symTab_simulator.l
gcc lex.yy.c -o symbolTable
./symbolTable $1
