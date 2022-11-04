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
lw $t7,0($t6)
la $s0,Meio 
lw $s1,0($s0)  

bgt $t3,$t5, VALOR_INEXISTENTE  #acho que aqui tem que ser bgt pq deve ser maior apenas, não maior ou igual
add $s1,$t3,$t5 
div $s1,2
beq $t1,$s1,RETORNA_MID 
blt $t7,RETORNO_MID, BIANARYSEARCH 



RETORNA_MID: 
#valor do meio do vetor


BYNARYSEARCH:
#algoritmo para fazer a pesquina no vetor

bge Prim, Ult, VALOR_INEXISTENTE
add meio, Prim, Ult
div meio, mid, 2
beq meio, Valor, RETORNA_MID
bge meio, Valor, binarySearch(A, Ult, Prim-1, Valor)
bge key_value, mid, binarySearch(A, Ult+1, Prim, Valor)
RETORNA_VALOR

.data 

A:      .word -5 -1 5 9 12 15 21 29 31 58 250 325	#Array 
Prim:   .word 						#Sentinela de Início
Ult:    .word 						#Sentinela de Fim
Valor:  .word 						#Valor a ser buscado
Meio:   .word 						#Valor do Meio



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
