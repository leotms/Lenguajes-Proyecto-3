# tress.rb
# Provee las definiciones necesarias para arboles binarios y arboles rosa.
# Autores:
#     - Aldrix Marfil     #10-10940
#     - Leonardo Martinez #11-10576

#!/usr/bin/ruby
$LOAD_PATH << '.'
require "mod_bfs"
require "mod_fold"
require "nodos"


#Implementación de la Clase Árbol Binario.
class ArbolBinario
	include BFS
	include FOLD

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

	#Muta el valor del nodo y lo reasigna al mismo nodo.
	def mutar(m)
		@valor = @valor.mutar(m)
	end

end


#Implementación de la Clase Árbol Rosa.
class ArbolRosa
  	include BFS

  	attr_accessor :valor    #Valor almacenado en el nodo.
  	attr_reader   :hijos  #Arreglo de referencias a los hijos.

  	#Inicialización de un árbol rosa.
  	# valor  : valor del nodo.
  	# hijos: arreglo de arboles rosa.
  	def initialize(valor, hijos=[nil])
    	@valor   = valor
    	@hijos = hijos
  	end

  	#Metodo que itera sobre los nodos hijos y aplica un bloque sobre ellos.
  	def each
    	i = 0
    	while hijos[i] !=  nil
      		yield hijos[i]
     		i += 1
    	end
  	end

		#Muta el valor del nodo y lo reasigna al mismo nodo.
		def mutar(m)
			@valor = @valor.mutar(m)
		end
end


#PRUEBA ARBOLES BINARIOS
arbolB1 = ArbolBinario.new(17,ArbolBinario.new(15,ArbolBinario.new(11)),ArbolBinario.new(13,nil,ArbolBinario.new(10)))
arbolB2 = ArbolBinario.new(20)
arbolB3 = ArbolBinario.new(25,nil,ArbolBinario.new(30))
arbolB4 = ArbolBinario.new(1,ArbolBinario.new(2,ArbolBinario.new(4),ArbolBinario.new(5)),ArbolBinario.new(3,ArbolBinario.new(6),ArbolBinario.new(7)))

u = Uniforme.new
s = Singular.new
o = Oscuro.new

puts "BFS"
#arbolB1.bfs {|arbol| arbol.valor=arbol.valor.mutar(u); puts arbol.valor}
arbolB1.bfs {|arbol| puts arbol.valor}

puts "DFS"
arbolB1.dfs {|arbol| puts arbol.valor}

puts "FOLD1"
sol = arbolB1.fold(0) {|arbol,acum| arbol.valor + acum}
puts sol
puts "FOLD2"
#arbolB1.fold2(1) {|arbol,acum| arbol.valor - acum}
#
# ## PRUEBA ARBOLES ROSA
# arbolh1 = ArbolRosa.new("Hijo")
# arbolR1 = ArbolRosa.new("ArbolR1",[arbolh1,arbolh1,arbolh1])
# arbolR2 = ArbolRosa.new("ArbolR2")
# arbolR3 = ArbolRosa.new("ArbolR3",[ArbolRosa.new("Hijo1",[ArbolRosa.new("Hijo5"),ArbolRosa.new("Hijo4")]),ArbolRosa.new("Hijo2"),ArbolRosa.new("Hijo3")])
#
# arbolR1.bfs {|arbol| arbol.valor=arbol.valor.mutar(u); puts arbol.valor}
