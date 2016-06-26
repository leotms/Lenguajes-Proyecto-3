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

	#Metodo que itera sobre los nodos hijos y aplica un bloque sobre ellos.
	def each
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
arbolB1 = ArbolBinario.new(17,ArbolBinario.new(15,ArbolBinario.new(11)),ArbolBinario.new(13,nil,ArbolBinario.new(10)))
arbolB2 = ArbolBinario.new(20)
arbolB3 = ArbolBinario.new(25,nil,ArbolBinario.new(30))
arbolB4 = ArbolBinario.new(1,ArbolBinario.new(2,ArbolBinario.new(4),ArbolBinario.new(5)),ArbolBinario.new(3,ArbolBinario.new(6),ArbolBinario.new(7)))

## PRUEBA ARBOLES ROSA
arbolh1 = ArbolRosa.new("Hijo")
arbolR1 = ArbolRosa.new("ArbolR1",[arbolh1,arbolh1,arbolh1])
arbolR2 = ArbolRosa.new("ArbolR2")
arbolR3 = ArbolRosa.new("ArbolR3",[ArbolRosa.new("Hijo1",[ArbolRosa.new("Hijo5"),ArbolRosa.new("Hijo4")]),ArbolRosa.new("Hijo2"),ArbolRosa.new("Hijo3")])
