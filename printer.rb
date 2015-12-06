require './documento.rb'

class Printer
  attr_reader :buffer
  def initialize(output,documento)
    @documento = documento
    @output = output
    if File.exists? output
      return false
    end
    @buffer = ""
  end

  def addb string
    @buffer = @buffer + string + "\n"
  end

  def printToFile
    output = File.new(@output,"w")
    output.puts @buffer
    output.close
  rescue IOError => err
    puts "Error printing to file"
    puts err
  end

  def printDoc
    addb "<html>"
    addb "  <head>"
    addb "    <title>#{@documento.nombreDocumento}</title>"
    addb "  </head>"
    addb "  <body>"
    addb "    <h1> #{@documento.nombreDocumento} </h1>"

    @documento.infoStrings.each do |infostring|
      addb infostring
    end
    printClases
    printEstructuras
    printFunciones

    addb "  </body>"
    addb "</html>"
  end

  def printClases
    if @documento.clases.empty?
      addb "<div>there is no classes in this document</div>"
      return false
    end
    @documento.clases.each do |clase|
      addb "<h2> #{clase.nombre} </h2>"
      clase.infoStrings.each do |infostring|
        addb infostring
      end
      printMetodos clase
      printAtributos clase
    end
  end

  def printMetodos clase
    if clase.metodos.empty?
      addb "<div>This class doesn't have methods</div>"
      return false
    end
    addb "<h3> Methods </h3>"
    addb "<ul>"
    clase.metodos.each do |metodo|
      addb "<li> #{metodo} </li>"
    end
    addb "</ul>"
  end

  def printAtributos clase
    if clase.atributos.empty?
      addb "<div>This class doesn't have atributes</div>"
      return false
    end
    addb "<h3> Atributes </h3>"
    addb "<ul>"
    clase.atributos.each do |atributo|
      addb "<li> #{atributo} </li>"
    end
    addb "</ul>"
  end

  def printEstructuras
    if @documento.estructuras.empty?
      addb "<div>This Document doesn't have structs</div>"
      return false
    end
    addb "<h3> Structs </h3>"
    addb "<ul>"
    @documento.estructuras.each do |estructura|
      addb "<li> #{estructura} </li>"
    end
    addb "</ul>"
  end

  def printFunciones
    if @documento.funciones.empty?
      addb "<div>This Document doesn't have functions</div>"
      return false
    end
    addb "<h3> Functions </h3>"
    addb "<ul>"
    @documento.funciones.each do |funcion|
      addb "<li> #{funcion} </li>"
    end
    addb "</ul>"
  end
end
