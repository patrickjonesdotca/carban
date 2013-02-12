module Carban
  module OpCodes
  
  	ADD  		= 00
  	SUB 		= 01
  	MUL		= 02
  	DIV 		= 03
  	
  	POP		= 14
  	PUSH		= 15
  	
  	EQUAL		= 26
  	GREATER_THAN	= 27
  	LESS_THAN	= 28
  	INVERT		= 29
  	
  	EXIT		= 40
  	NO_OP		= 41
  	
  	JUMP		= 50
  	JUMP_IF		= 51
  	JUMP_UNLESS	= 52
  	
  	PUT_STRING	= 60
  	TO_STRING	= 61
  	
  	DUP		= 70
  	SWAP		= 71
  	OVER		= 72
  	ROT		= 73
    
    	PRINT           = 80
  
    	STORE_GLOBAL    = 90
    	STORE_LOCAL     = 100
  
    	CODE_CALL       = 110
    	CODE_RETURN     = 111
  end
end
