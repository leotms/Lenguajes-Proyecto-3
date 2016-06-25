# tress.rb
# Provee las definiciones necesarias para arboles binarios y arboles rosa.
# Autores:
#     - Aldrix Marfil     #10-10940
#     - Leonardo Martinez #11-10576

class ArbolRosa

  attr_accessor   :val
  attr_reader     :hijos

  def initialize(val, hijos=[nil])
    @val   = val
    @hijos = hijos
  end

  def each
    i = 0
    while hijos[i] !=  nil
      yield hijos[i]
      i += 1
    end
  end

end


## PRUEBA ARBOLES ROSA
arbolh1 = ArbolRosa.new("Hijo")
arbolR1 = ArbolRosa.new("ArbolR1",[arbolh1,arbolh1,arbolh1])

puts arbolR1.val
arbolR1.each { |arbol| puts arbol.val}

arbolR2 = ArbolRosa.new("arbolR2")
arbolR2.each { |arbol| puts arbol.val}
