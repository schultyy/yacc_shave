require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:test)


namespace :rexical do
  desc "clean the generated lexer"
  task :clean do
    `rm lib/yacc_shave/parser/lexer.rb`
  end

  desc "Regenerate the lexer grammar"
  task :regenerate do
    `rex lib/yacc_shave/parser/yacc_shave.rex -o lib/yacc_shave/parser/lexer.rb`
  end
end

namespace :racc do
  desc "It cleans the generated parser"
  task :clean do
    `rm lib/yacc_shave/parser/parser.rb`
  end

  desc "Regenerate the parser grammar"
  task :regenerate do
    `racc lib/yacc_shave/parser/yacc_shave.y -o lib/yacc_shave/parser/parser.rb`
  end
end

task :test => ["rexical:regenerate", "racc:regenerate"]
task :default => :test

