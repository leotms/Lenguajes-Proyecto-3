# mod_bfs.rb
# Definicion del modulo BFS.
# Autores:
#     - Aldrix Marfil     #10-10940
#     - Leonardo Martinez #11-10576

module BFS

    def bfs 
        yield self
        nodos_recorridos = []
        self.each do |nodo|
            nodos_recorridos.push(nodo)
        end
        for nodo in nodos_recorridos
            yield nodo
        end
    end

  def recoger(&bloque)

    nodos_correctos = []
    self.dfs do |nodo|
      if bloque.call(nodo) do
        nodos_correctos.push(nodo)
      end
    end

    return nodos_correctos

end
