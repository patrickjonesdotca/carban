module Carban
  module InstructionSet
    include OpCodes

    def self.load
      compiled_set = {}
      OpCodes.constants.each do |code|
        numerical = OpCodes.const_get code
        compiled_set[numerical] = send(code.to_s.downcase.to_sym)
      end
      return compiled_set
    end

    def self.add
      Proc.new do |vm|
        left = 	@data_stack.pop
        right = 	@data_stack.pop
        @data_stack.push(left + right)
        @ip += 1
      end
    end

    def self.sub
      Proc.new do |vm|
        right = 	@data_stack.pop
        left = 	@data_stack.pop
        @data_stack.push (left - right)
        @ip += 1
      end
    end

    def self.mul
      Proc.new do |vm|
        left = 	@data_stack.pop
        right = 	@data_stack.pop
        @data_stack.push left * right
        @ip += 1
      end
    end

    def self.div
      Proc.new do |vm|
        left = 	@data_stack.pop
        right = 	@data_stack.pop
        @data_stack.push left / right
        @ip += 1
      end
    end

    def self.pop
      Proc.new do |vm|
        ret =  @data_stack.pop
        @ip += 1
        ret
      end
    end

    def self.push
      Proc.new do |vm|
        operand =  @opcodes[@ip + 1]
        @data_stack.push operand
        @ip += 2
      end
    end

    def self.equal
      Proc.new do |vm|
        left 	= @data_stack.pop
        right 	= @data_stack.pop
        result = left == right
        @data_stack.push (result).to_s.upcase.to_sym
        @ip += 1
      end
    end

    def self.greater_than
      Proc.new do |vm|
        left 	= @data_stack.pop
        right 	= @data_stack.pop
        result = left > right
        @data_stack.push (result).to_s.upcase.to_sym
        @ip += 1
      end
    end

    def self.less_than
      Proc.new do |vm|
        left 	= @data_stack.pop
        right 	= @data_stack.pop
        result = left < right
        @data_stack.push (result).to_s.upcase.to_sym
        @ip += 1
      end
    end

    def self.invert
      Proc.new do |vm|
        value = @data_stack.pop
        @data_stack.push (!value).to_s.upcase.to_sym
        @ip += 1
      end
    end

    def self.exit
      Proc.new do |vm|
        @ip = @opcodes.length
      end
    end

    def self.no_op
      Proc.new do |vm|
        @ip += 1
      end
    end

    def self.jump
      Proc.new do |vm|
        @ip = @data_stack.pop
      end
    end

    def self.jump_if
      Proc.new do |vm|
        dest = 	@data_stack.pop
        left = 	@data_stack.pop
        right = 	@data_stack.pop
        left == right ? @ip = dest : @ip += 1
      end
    end

    def self.jump_unless
      Proc.new do |vm|
        dest = 	@data_stack.pop
        left = 	@data_stack.pop
        right = 	@data_stack.pop
        left != right ? @ip = dest : @ip += 1
      end
    end

    def self.to_string
      Proc.new do |vm|
        value = @data_stack.pop
        @data_stack.push value.to_s
        @ip += 1
      end
    end

    def self.put_string
      Proc.new do |vm|
        operand = @opcodes[@ip + 1]
        @data_stack.push operand
        @ip += 2
        end
    end

    def self.dup
      Proc.new do |vm|
        @data_stack.push @data_stack.first
        @ip += 1
      end
    end

    def self.swap
      Proc.new do |vm|
        left 	= 	@data_stack.pop
        right =	@data_stack.pop
        [left, right].each { |a| @data_stack.push a }
        @ip += 1
      end
    end

    def self.over
      Proc.new do |vm|
        left 	= @data_stack.pop
        right = @data_stack.pop
        [left, right, left].each { |a| @data_stack.push a }
        @ip += 1
      end
    end

    def self.rot
      Proc.new do |vm|
        one 	= @data_stack.pop
        two	= @data_stack.pop
        three	= @data_stack.pop
        [two, three, one].each { |a| @data_stack.push a }
        @ip += 1
      end
    end

    def self.print
      Proc.new do |vm|
        puts @data_stack.pop
        @ip += 1
      end
    end

    def self.store_global
      Proc.new do |vm|
        name = @opcodes[@ip + 1]
        val = @opcodes[@ip + 2]
        @globals[name] = val
        @ip += 3
      end
    end


    def self.store_local
      Proc.new do |vm|
        name = @opcodes[@ip + 1]
        val = @opcodes[@ip + 2]
        @locals[name] = val
        @ip += 3
      end
    end

    def self.code_call
      Proc.new do |vm|
        @call_stack.push(@ip)
        @ip = @opcodes[@ip + 1]
      end
    end

    def self.code_return
      Proc.new do |vm|
        @ip = @call_stack.pop
        @ip += 1
      end
    end
  end
end
