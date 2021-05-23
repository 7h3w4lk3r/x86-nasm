### x86 NASM examples  
When i started learning x86 programming with NASM there was no straight and all-in-one guide for it, so i started reading some books and watching some videos and decided to create this repo to keep some examples of NASM programs from basic to intermediate and hopefully make something useful for anyone new to NASM as well. i tried to explain each and every line of code in the sources so you wont get stuck in a single instruction for hours ( what happend to me ). but i do recommend being familiar with the basics of assembly, registers, stack and how the CPU and RAM work together.   

### Usage  
Practice the lessons in order, all programs are well commented and you should be able to get it with a basic knowledge of registers, stack and program execution cycle. use these commands to assemble and run the programs:  
`nasm -f elf app.asm`  
`ld -m elf_i386 app.o`  
`./a.out`  

# Sources
Here are the sources for most of these examples, but remember to search for more:  
asmtutor.com  
tutorialspoint.com  
cybrary x86 assembly course  
