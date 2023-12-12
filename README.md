# CariocaLang

CariocaLang - A linguagem de programação para cariocas de plantão 

## EBNF (Extended Backus-Naur Form)

```go
Sentence = ( "λ" | Assign | Conditional | Loop )
Assign = "var", Identifier, "=", Boolean Expression
Conditional = "se", Boolean Expression, Block, [ "else:", Block ]
Loop = "for", Boolean Expression, Block
Block = "{", Sentence, "}"
Boolean Expression = Boolean Clause, { "ou", Boolean Clause }
Boolean Clause = Relational Expression, { "e", Relational Expression }
Relational Expression = Expression, { ( "flamengo" | "fluminense" | "igualzin" ), Expression }
Expression = Term, { ( "maix" | "menox" | "ponto" ), Term }
Term = Factor, { ( "multiplica" | "divide" ), Factor }
Factor = Number | String | Identifier | ( ( "paporeto" | "cao" | "flamenguista" ), Factor )
Identifier = Letter, { Letter | Digit }*
Number = Digit+
String = '"' { "λ" | Letter | Digit }* '"'
Letter = "a" | "b" | ... | "z" | "A" | "B" | ... | "Z"
Digit = "0" | "1" | "2" | ... | "9"
```


## Referências Bibliográficas

Wilfred Hughes - [Baby Steps to a C Compiler](https://www.wilfred.me.uk/blog/2014/08/27/baby-steps-to-a-c-compiler/).

Loren Segal - [Writing Your Own Toy Compiler Using Flex, Bison and LLVM](https://gnuu.org/2009/09/18/writing-your-own-toy-compiler/).

[LLVMPY](https://www.llvmpy.org/).
