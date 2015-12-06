require './documento.rb'

class Parser
  def initialize nombreDocumento
    @documento = new Documento nombreDocumento
    @pattern = /{!} +([^ ]+)/
    @actualNode = @documento
  end

  def parse raw
    result = @pattern.match raw
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
    newClass = new Clase data
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
    @document.funciones.push data
  end

  def pushAtribute data
    @document.funciones.push data
  end
end