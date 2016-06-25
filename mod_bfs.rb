# mod_bfs.rb
# Definicion del modulo BFS.
# Autores:
#     - Aldrix Marfil     #10-10940
#     - Leonardo Martinez #11-10576

module BFS

  def bfsaux(nodos_recorridos,nodos_faltantes, &bloque)
    if !(self in nodos_recorridos)
      nodos_recorridos.push(self)
      self.each do |nodo|
          nodos_faltantes.push(nodo)
      end
      yield self
    end
  end

  def bfs
      nodos_recorridos = []
      nodos_faltantes  = []
      nodos_recorridos.push(self)
      yield self
      self.each do |nodo|
          nodos_faltantes.push(nodo)
      end
      for nodo in nodos_faltantes do
          nodo.bfsaux (nodos_recorridos, nodos_faltantes) {|sig_nodo| yield sig_nodo}
      end
  end

  def recoger(&bloque)

    nodos_correctos = []
    self.dfs do |nodo|
      if bloque.call(nodo)
        nodos_correctos.push(nodo)
      end
    end

    return nodos_correctos
  end

end
