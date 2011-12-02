require 'sprockets'
require 'closure-compiler'

class Shoehorn < Thor
  desc "compile", "compiles javascripts and css into a project template"
  def compile
    environment = Sprockets::Environment.new
    environment.append_path 'assets/javascripts'
    environment.append_path 'assets/stylesheets'

    File.open('output/javascripts/lib/base.js', 'w') {|f| f.write(environment['base.js']) }
    environment.js_compressor = Closure::Compiler.new

    File.open('output/javascripts/lib/base.min.js', 'w') {|f| f.write(environment['base.js']) }

    File.open('output/README.markdown', 'w') { |f| f.write("A Generic Project Template") }

    FileUtils.cp Dir.glob('assets/stylesheets/*'), 'output/stylesheets/lib/'
    FileUtils.cp_r 'assets/images/', 'output'

    FileUtils.cp 'index.html', 'output/index.html'
  end
end

