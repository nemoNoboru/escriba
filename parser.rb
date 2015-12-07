require './documento.rb'

class Parser
  attr_reader :documento
  def initialize nombreDocumento
    @documento = Documento.new(nombreDocumento)
    @pattern = /{!} +([^ ]+) +(.+)/
    @actualNode = @documento
  end

  def parse raw
    result = @pattern.match raw
    if result == nil
      return false
    end
    case result[1]
    when "class"
      pushClass result[2]
    when "method"
      pushMethod result[2]
    when "atribute"
      pushAtribute result[2]
    when "info"
      pushInfo result[2]
    when "function"
      pushFunction result[2]
    when "struct"
      pushStruct result[2]
    else
      return false
    end
    return true
  end

  def pushClass data
    newClass = Clase.new data
    @actualNode = newClass
    @documento.clases.push newClass
  end

  def pushMethod data
    if @actualNode == @documento
      data = "Error, method with no class"
    end
    @actualNode.metodos.push data
  end

  def pushAtribute data
    if @actualNode == @documento
      data = "Error, atribute with no class"
    end
    @actualNode.atributos.push data
  end

  def pushInfo data
    @actualNode.infoStrings.push data
  end

  def pushFunction data
    @documento.funciones.push data
  end
end
