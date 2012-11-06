#class for declaration of variables
class DeclareMethod
  attr_accessor :var_args
  
  def initialize(variables)
    @variables = variables
    @var_args = []
  end
  
  def execute
#    if @variables.has_variable?(@var_args[0])
#comment-out to not allow multiple declarations      
#      puts @var_args[0] + " already declared"
#    else
      @variables.set_variable @var_args[0], @var_args[1]
#    end
  end
  
end
