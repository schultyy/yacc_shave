require 'spec_helper'

puts "PARSER: #{YaccShave.inspect}"

describe YaccShave::Parser, '#tokenize' do
  def tokenize(string)
    YaccShave::Parser.new.tokenize(string)
  end
  it 'tokenizes an addition' do
    expect(tokenize('43 + 3')).to eq([
      [:INTEGER, 43],
      [:ADD, '+'],
      [:INTEGER, 3]
    ])
  end
  it 'tokenizes a pattern match' do
    expect(tokenize('a = 3')).to eq([
      [:IDENTIFIER, 'a'],
      [:ASSIGN, '='],
      [:INTEGER, 3]
    ])
  end
end
