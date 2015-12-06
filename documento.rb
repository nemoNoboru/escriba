require './clase.rb'

class Documento
  attr_reader :nombreDocumento, :infoStrings , :clases, :funciones, :estructuras
  def initialize nombreDocumento
    @nombreDocumento = nombreDocumento
    @infoStrings = Array.new
    @clases =      Array.new
    @funciones =   Array.new
    @estructuras = Array.new
  end

  def pushInfoString infoString
    if infoString
      @infoStrings.push infoString
      return true
    end
    return false
  end

  def pushClase clase
    if clase
      @clases.push clase
      return true
    end
    return false
  end

  def pushFuncion funcion
    if funcion
      @funciones.push funcion
      return true
    end
    return false
  end

  def pushEstructura estructura
    if estructura
      @estructura.push estructura
      return true
    end
    return false
  end
end
