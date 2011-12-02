require 'sprockets'
require 'closure-compiler'

class Shoehorn < Thor
  desc "compile", "compiles javascripts and css"
  def compile
    environment = Sprockets::Environment.new
 #   environment.js_compressor = Closure::Compiler.new
    environment.append_path 'assets/javascripts'
    File.open('base.js', 'w') {|f| f.write(environment['base.js']) }
    environment.js_compressor = Closure::Compiler.new

    File.open('base.min.js', 'w') {|f| f.write(environment['base.js']) }

  end
end

