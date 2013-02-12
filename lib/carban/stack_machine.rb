
module Carban
  class StackMachine
    attr_accessor :opcodes, :call_stack, :data_stack, :instructions, :ip, :globals, :locals
    extend InstructionSet
    
    def initialize
      @globals = {}
      @locals = {}
      @opcodes = []
      @data_stack = []
      @call_stack = []
      @instructions = InstructionSet.load
      @ip = 0
    end
    
    def run
      @ip = 0
      while(@ip < @opcodes.length) do
        self.instance_eval &@instructions[ @opcodes[@ip] ]
      end
    end
    
    def dump
      { 
  	:opcodes => @opcodes, 
  	:data_stack => @data_stack, 
  	:instructions => @instructions, 
  	:instruction_pointer => @ip 
      }
    end
    
    def load_program(file)
      content = File.open(file).read
      @opcodes = assemble(content) 
    end
  
    def assemble(str)
      str.split("\n").map do |expr|
        line = expr.split(", ")
        keyword_opcode = OpCodes.const_get(line.first.to_sym)
        line.size > 1 ? [keyword_opcode, line.last.to_i] : keyword_opcode
      end.flatten
    end
    
  end
end
