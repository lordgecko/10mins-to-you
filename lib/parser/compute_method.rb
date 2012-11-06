#class for the computation of combine values
class ComputeMethod
  attr_accessor :var_args
  
  def initialize(variables)
    @variables = variables
    @var_args = []
  end
  
  def execute
    @variables.set_variable @var_args[0], @var_args[1]
  end
end
