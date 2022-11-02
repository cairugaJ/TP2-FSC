# if (Prim > Ult)
# return -1; // Valor não existe
# else
# { // Invariante: Se Valor existe em A,
# // A[Prim]<=Valor<=A[Ult]
# int Meio = (Prim + Ult)/2;
# if (Valor == A[Meio])
# return Meio; // Encontrou Valor em A[Meio]
# else if (Valor<A[Meio])
# return BinSearch(A, Prim, Meio-1, Valor);
#// Recursão na metade inferior do vetor
# else
# return BinSearch(A, Meio+1, Ult, Valor);
#// Recursão na metade superior do vetor
# } // end else
#} // end BinSearch
#Gabriela Dellamora Paim, João Enrique Rego Cairuga e Luize Silveira Iensse 

.globl
.text  main
.text VALOR_INEXISTENTE
	addi %v0, $v0, -1
	syscall 0, $v0
	
.text binSearch
# if (low > high){
#	return -1
# else{
#	int mid = (high+low)//2
#	if (value == mid){
#		return A[mid]
#	else if (value < A[mid]){
#		return (binarySearch(A, high, low-1, key){
#	else
#		return(binarySearch(A, high+1, low, key)
#	}
#}
# 	
main: 
la $t0,A 
lw $t1,0($t0) 
la $t2,Prim
lw $t3,0($t2) 
la $t4,Ult 
lw $t5,0($t4)
la $t6,valor 
lw $t7,0($



bge Prim, Ult, VALOR_INEXISTENTE
add mid, Prim, Ult
div mid, mid, 2
beq mid, Valor, RETORNA_MID
bge mid, Valor, binarySearch(A, Ult, Prim-1, Valor)
bge key_value, mid, binarySearch(A, Ult+1, Prim, Valor)
RETORNA_VALOR

.data 

A:      .word -5 -1 5 9 12 15 21 29 31 58 250 325	#Array 
Prim:   .word 						#Sentinela de Início
Ult:    .word 						#Sentinela de Fim
Valor:  .word 						#Valor a ser buscado
Meio:   .word 						#Valor do Meio