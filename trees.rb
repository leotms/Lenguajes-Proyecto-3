# tress.rb
# Provee las definiciones necesarias para arboles binarios y arboles rosa.
# Autores:
#     - Aldrix Marfil     #10-10940
#     - Leonardo Martinez #11-10576
#!/usr/bin/ruby
$LOAD_PATH << '.'
require "mod_bfs"


#Implementación de la Clase Árbol Binario.
class ArbolBinario
	include BFS

	attr_accessor :valor  #Valor almacenado en el nodo.
	attr_reader   :hizq   #Referenca al hijo izquierdo.
	attr_reader   :hder   #Referencia al hijo derecho.

	#Inicialización de un árbol binario.
	# valor: valor del nodo.
	# hizq : hijo izquierdo.
	# hder : hijo derecho.
	def initialize(valor,hizq=nil,hder=nil)
		@valor = valor
		@hizq  = hizq
		@hder  = hder

	end


	def each
		yield self
		yield self.hizq if self.hizq != nil
		yield self.hder if self.hder != nil
	end

end

#Implementación de la Clase Árbol Rosa.
class ArbolRosa

  include BFS

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

  def printself
    puts self.val
  end

end


## PRUEBA ARBOLES BINARIOS
arbolB1 = ArbolBinario.new(10,ArbolBinario.new(11),ArbolBinario.new(13))

arbolB1.each {|arbol| puts arbol.valor}

## PRUEBA ARBOLES ROSA
arbolh1 = ArbolRosa.new("Hijo")
arbolR1 = ArbolRosa.new("ArbolR1",[arbolh1,arbolh1,arbolh1])

# puts arbolR1.val
arbolR1.each # { |arbol| puts arbol.val}

arbolR2 = ArbolRosa.new("arbolR2")
arbolR2.each #{ |arbol| puts arbol.val}

#arbolR1.bfs {|arbol| puts arbol.val}
arbolR1.printself
