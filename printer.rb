require './documento.rb'

class Printer
  attr_reader :buffer
  def initialize(output,documento)
    @documento = documento
    if File.exists output
      return false
    end
    @output = File.new(output,"w")
    @buffer = ""
  end

  def addb string
    @buffer = @buffer + string + "\n"
  end

  def printDoc
    addb "<html>"
    addb "  <head>"
    addb "    <title>#{@documento.nombreDocumento}</title">
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
      addb "there is no classes in this document"
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
      addb "This class doesn't have methods"
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
      addb "This class doesn't have atributes"
      return false
    end
    addb "<h3> Atributes </h3>"
    addb "<ul>"
    clase.atributos.each do |atributo|
      addb "<li> #{atributo} </li>"
    end
    addb "</ul>"
  end
