# mod_fold.rb
# Definicion del modulo Fold.
# Autores:
#     - Aldrix Marfil     #10-10940
#     - Leonardo Martinez #11-10576

module FOLD

	#Método que permite recorrer árboles (binarios y rosas) aplicando DFS.
	def dfs
		yield self
		self.each do |nodo|
			nodo.dfs {|nodo_sig| yield nodo_sig}
		end
	end

	#Método que permite recorrer arboles (binarios y rosas) aplicando DFS
	#y llamando a un bloque con el valor de los nodos del arbol y tomando
	#un valor base para hacer la operacion del bloque.
	# base: valor base para aplicar la operacion y luego funciona como
	#       acumulador.
	def fold(base)
		self.dfs do |nodo|
			base = yield nodo, base
		end
		return base
	end

end
