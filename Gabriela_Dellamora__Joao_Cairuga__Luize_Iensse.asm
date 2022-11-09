# Gabriela Dellamora Paim, João Enrique Rego Cairuga, Luize Silveira Iensse
# MAIN:
# >pilha
# >empilha e desempilha aqui
# >registradores
# >binary_search()
#
# BINARY_SEARCH:
# >Algoritmo
# VERSAO 2

.text
.globl main
main:
# Armazenando valores:
	addi  $v1, $zero, -5
	addi  $a0, $zero, -1
	addi  $a1, $zero,  5
	addi  $a2, $zero,  9
	addi  $a3, $zero, 12
	addi  $t0, $zero, 15
	addi  $t1, $zero, 21
	addi  $t2, $zero, 29
	addi  $t3, $zero, 31
	addi  $t4, $zero, 58
	addi  $t5, $zero, 250
	addi  $t6, $zero, 325 #TESTE APENAS! VALOR REAL: 325
	#index = $k1
	addi $k1, $zero, 0 #índice = $ki = 0

#Montando lista para pesquisa:
	#Lista A: -5, -1, 5, 9, 12, 15, 21, 29, 31, 58, 250, 325 (elemento -5 = índice 0)
	sw $v1, A($k1) #adicionando à lista -5
	  addi $k1, $k1, 4 #atualizando index (index = index+1)    (elemento -1 = índice 4)
	sw $a0, A($k1) #adicionando à lista -1
	  addi $k1, $k1, 4 #atualizando index (index = index+1)    (elemento 5 = índice 8) 
	sw $a1, A($k1) #adicionando à lista 5
	  addi $k1, $k1, 4 #atualizando index (index = index+1)    (elemento 9 = índice 12)
	sw $a2, A($k1) #adicioando à lista 9
	  addi $k1, $k1, 4 #atualizando index (index = index+1)    (elemento 12 = índice 16)
	sw $a3, A($k1) #adicioando à lista 12
	  addi $k1, $k1, 4 #atualizando index (index = index+1)    (elemento 15= índice 20)
	sw $t0, A($k1) #adicionando à lista 15
	  addi $k1, $k1, 4 #atualizando index (index = index+1)    (elemento 21 = índice 24)
	sw $t1, A($k1) #adicionando à lista 21
	  addi $k1, $k1, 4 #atualizando index (index = index+1)    (elemento 29 = índice 28)
	sw $t2, A($k1) #adicionando à lista 29
	  addi $k1, $k1, 4 #atualizando index (index = index+1)    (elemento 31 = índice 32)
	sw $t3, A($k1) #adicionando à lista 31
	  addi $k1, $k1, 4 #atualizando index (index = index+1)    (elemento 58 = índice 36)
	sw $t4, A($k1) #adicionando à lista 58
	  addi $k1, $k1, 4 #atualizando index (index = index+1)    (elemento 250 = índice 40)
	sw $t5, A($k1) #adicionando à lista 250
	  addi $k1, $k1, 4 #atualizando index (index = index+1)    (elemento 325 = índice 44)
	sw $t6, A($k1) #adicionado à lista 325
# Terminamos nossa lista aqui! Está tudo armazenado na memória!

#começamos a empilhar os comandos! :D
	#formato = (Array, PrimeiroValor, UltimoValor, ValorChave). Deve-se armazenar de forma contrária.
	la $v1, valor
	lw $a0, 0($v1) # $v1 = valorChave
	la $a1, ult
	lw $a2, 0($a1) # $a1 = ultimoIdx
	la $a3, prim
	lw $t0, 0($a3) # $a3 = primeiroIdx
	la $t1, A
	lw $t2, 0($t1) # $t1 = Array
	
	la $sp, pilha
	

#Empilhar os inputs
	addi $k1, $zero, 0
	sw $a0, pilha($k1) #valor
	 addi $k1, $k1, 4
	sw $a2, pilha($k1) # ultimoIdx
	 addi $k1, $k1, 4
	sw $t0, pilha($k1) # primeiroIdx
	 addi $k1, $k1, 4
	sw $t1, pilha($k1) # Array address (pq é uma lista, n um valor inteiro)
	
	
	jal binary_search
	#caso dê ruim
	addi $a0, $zero, 888
	li $v0, 1
	syscall
	li $v0, 10
	syscall	
	

#Executo binary_search!

binary_search:

#Funções da binary_search
	bgt $t0, $a2, returnMenosUm
	 addu $s6, $t0, $a2 #prim + ult
	 div $s6, $s6, 2
	 mul $s6, $s6, 4 #transforma meio em idx
	lw $s4, A($s6)  # $k1 = A($s6)
	beq $a0, $s4, returnNumeroDesejado #Se
	 addi $t0, $s6, -4
	bgt $a0, $s4, binary_search #-1 no valor $s6
	 addi $t0, $s6, 0
	 addi $a2, $s6, 4
	jal  binary_search #+1 no valor meio
	#caso dê ruim
	addi $a0, $zero, 999
	li $v0, 1
	syscall
	li $v0, 10
	syscall	
	
# Funções de retorno: 
#Essa aqui retorna -1 para o terminal. É utilizada caso o valor não tenha sido encontrado.
returnMenosUm:
	addi $a0, $zero, -1 # $v0 == -1
	li $v0, 1 #loading valor de $v0 e avisando que queremos printar (comando 1)
	syscall #printando -1
	li $v0, 10 #loading valor de $v0 e avisando que queremos parar a execução (comando 10)
	syscall #força saída caso dê problema. Aqui o programa para de rodar
	
returnNumeroDesejado:
	addu $a0, $zero, $s6 #$s7 == o  que queremos printar #função feita no próprio binarySearch
	div $v0, $k1, 4
	li $v0, 1 #loading valor de $v0 e avisando que queremos printar (comando 1)
	syscall #printando -1
	li $v0, 10 #loading valor de $v0 e avisando que queremos parar a execução (comando 10)
	syscall #força saída caso dê problema. Aqui o programa para de rodar
	
		
.data
valor: .word 325       #MODIFICAR O VALOR QUE QUER ENCONTRAR AQUI!
ult: .word 11     #MODIFICAR O VALOR DO ULTIMO ÍNDICE
prim: .word 0  #MODIFICAR O VALOR DO PRIMEIRO ÍNDICE

A: .space 44                #Lista de procura  (12 elementos * 4 bits)
pilha: .space 16             #'Arr','Prim','Ult','Valor'  | Argumentos (3 integers * 4 bits + 1 char *4bits)

#nEncontrado: .ascii " Não foi encontrado." #retorna -1
#encontrado: .ascii " Foi encontrado." #retorna posição (começa em zero)
