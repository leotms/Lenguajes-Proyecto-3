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

  	attr_accessor :valor  #Valor almacenado en el nodo.
  	attr_reader   :hijos  #Arreglo de referencias a los hijos.

  	#Inicialización de un árbol rosa.
  	# valor  : valor del nodo.
  	# hijos: arreglo de arboles rosa.
  	def initialize(valor, *hijos)
    	@valor   = valor
    	@hijos = Array.new(hijos)
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
