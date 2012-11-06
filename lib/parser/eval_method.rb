class EvalMethod
  attr_accessor :var_args, :log_arg
  
  def initialize(variables)
    @variables = variables
    @var_args = []
    @expression = " "
  end
  def add_arg(arg)
    if arg != true && arg !=false && arg != :UNDEFINED && arg != :AND && arg != :OR
      arg = @variables.get_value(arg)
    end
    if arg == :AND
      @expression += "&&"
      elsif arg == :OR
        @expression += "||"
      else
        @expression += arg.to_s
        var_args << arg
    end
    
  end
  def execute
    
#    if @var_args[0] != true && @var_args[0] != false && @var_args[0]!= :UNDEFINED
#      @var_args[0] = @variables.get_value @var_args[0]
#    end
#    if @var_args[1] != true && @var_args[1] != false && @var_args[1] != :UNDEFINED
#      @var_args[1] = @variables.get_value @var_args[1]
#    end
    return :UNDEFINED if @var_args.include?(:UNDEFINED)
    
    return eval @expression
    #return :UNDEFINED if @var_args[0] == :UNDEFINED || @var_args[1] == :UNDEFINED
#    return @var_args[0] && @var_args[1] if @log_arg == :AND
#    return @var_args[0] || @var_args[1] if @log_arg == :OR
   end
  
end
