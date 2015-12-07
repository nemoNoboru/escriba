class Clase
  attr_reader :infoStrings, :nombre , :metodos , :atributos
  def initialize nombreClase
    @nombre = nombreClase
    @infoStrings = Array.new
    @metodos     = Array.new
    @atributos   = Array.new
  end

  def pushMetodo metodo
    if metodo
      @metodo.push metodo
      return true
    end
    return false
  end

  def pushAtributo atributo
    if atributo
      @atributos.push atributo
      retun true
    end
    return false
  end

  def pushInfoString infoString
    if infoString
      @infoStrings.push infoString
      return true
    end
    return false
  end
end
