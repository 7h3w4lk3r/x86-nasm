### A few simple programs written in assembly with NASM
I created this repo to keep some of the things i learn about intel IA-32 architecture. these are probably not useful anywhere but might help anyone who wants to learn intel x86 assembly programming. 

### Compiling and Linking
to create the object file and link the programs you can use these commands:  
`nasm -f elf app.asm -o app.o`  
`ld -s -o app app.o -m elf_386`  
