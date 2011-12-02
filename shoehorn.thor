require 'sprockets'
require 'closure-compiler'

class Shoehorn < Thor
  desc "compile", "compiles javascripts and css"
  def compile
    environment = Sprockets::Environment.new
    environment.append_path 'assets/javascripts'

    File.open('output/base.js', 'w') {|f| f.write(environment['base.js']) }
    environment.js_compressor = Closure::Compiler.new

    File.open('output/base.min.js', 'w') {|f| f.write(environment['base.js']) }

  end
end

