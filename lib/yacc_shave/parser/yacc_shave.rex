class YaccShave::Parser
macro
  #macros go here
rule

# Literals
  \d+        { [:INTEGER, text.to_i] }

# Identifier
  [a-z_?!]+  { [:IDENTIFIER, text]}

# Operators
  \+      { [:ADD, text] }
  \=      { [:ASSIGN, text]}
  \{      { [:LCBRA, text]}
  \}      { [:RCBRA, text]}
  \,      { [:COMMA, text]}
  \.      { [:DOT, text]}



# NewLines
  \n      { [:NEWLINE, text]}

# CatchAll
  .       # no action

inner
  # here we put any ruby code we want to extend our lexer with.
  # for example, our own tokenize method.
  def tokenize(code)
    scan_setup(code)
    tokens = []
    while token = next_token
      tokens << token
    end
    tokens
  end
end
