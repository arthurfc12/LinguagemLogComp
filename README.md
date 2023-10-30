# CariocaLang

CariocaLang - A linguagem de programação para cariocas de plantão 

## EBNF (Extended Backus-Naur Form)

```
Program = (λ | Declaration);

Declaration = ("numero" | "texxto" | "cao"), Identifier, "(", { ("numero" | "texxto"), Identifier, { "," | ("numero" | "texxto"), Identifier} }, ")", Block;

Block = ("[", Statement, "]" | "[", "]");

Statement =  (((λ | Assignment | Print | Var_Type | Return), ";") | (Block | If | While));

Factor = Int | String | (Identifier, { "(", { Relexpression, { "," | Relexpression } } ")" }) | ("maix" | "menox" | "flamenguista" Factor) | "(", Relexpression, ")" | Scan;

Term = Factor, { ("multiplica" | "divide" | "tambem"), Factor };

Expression = Term, { ("maix" | "meno" | "ou"), Term } ;

Relexpression = EXPRESSION , {("flamengo" | "fluminense" | igualzin") , Expression } ;

While = "ainda", "(", Relexpression ,")", Statement;

If = "se", "(", Relexpression ,")", Statement, (("senao", Statement) | λ );

Assignment = ("aquelaparada", Identifier, "igualzinho", Relexpression) | ( "(", { Relexpression, { "," | Relexpression } }, ")" );

Return = "brota" , "(", Relexpression, ")";

Print  "paporeto", "(", Relexpression, ")";

Scan = "falae", "(", ")";

Identifier = Letter, { Letter | Digit | "_" };

Digit = (0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9);

Int = Digit, { Digit };

Var_Type = ("numero" | "texxto") , Identifier , (λ | {"," , Identifier });

String = """, (Letter | Digit), """;

LETTER = ( a | ... | z | A | ... | Z ) ;
```

## Referências Bibliográficas

Wilfred Hughes - [Baby Steps to a C Compiler](https://www.wilfred.me.uk/blog/2014/08/27/baby-steps-to-a-c-compiler/).

Loren Segal - [Writing Your Own Toy Compiler Using Flex, Bison and LLVM](https://gnuu.org/2009/09/18/writing-your-own-toy-compiler/).

[LLVMPY](https://www.llvmpy.org/).
