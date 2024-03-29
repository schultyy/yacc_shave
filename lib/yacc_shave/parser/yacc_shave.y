class YaccShave::Parser
  token INTEGER
  token ADD
  token NEWLINE
  token IDENTIFIER
  token ASSIGN
  token LCBRA
  token RCBRA
  token COMMA
  token DOT

  prechigh
    left ADD SUBTRACT
  preclow

  options no_result_var
rule
  root : program

  program : /* nothing */ { AST::Program.new( filename, lineno, [])}
          | expressions { AST::Program.new( filename, lineno, val[0])}

  number : INTEGER { AST::IntegerNode.new( filename, lineno, val[0])}

  variable_access : IDENTIFIER { AST::VariableAccessNode.new( filename, lineno, val[0])}

  variable_assignment : IDENTIFIER ASSIGN expression {AST::VariableAssignmentNode.new( filename, lineno, val[0], val[2]) }

  elements : expression { [val[0]] }
           | elements COMMA expression { val[0] << val[2] }

  expression : number
             | binary_operation
             | variable_access
             | variable_assignment


  binary_operation : expression ADD expression {AST::AddNode.new( filename, lineno, val[0], val[2])}

  expressions : expression { [val[0]] }
              | expressions terminator expression { val[0] << val[2] }

  terminator : NEWLINE


end

---- header ----
require_relative 'lexer'

---- inner ----

def filename
  @filename
end

alias_method :parse_string, :scan_str

def pre_exe
  []
end

def on_error(t, val, vstack)
  raise ParseError, sprintf("\nparse error on value %s (%s) #{@filename}:#{@line}",
      val.inspect, token_to_str(t) || '?')
end

---- footer ----

