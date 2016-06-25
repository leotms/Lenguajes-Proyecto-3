# mod_bfs.rb
# Definicion del modulo BFS.
# Autores:
#     - Aldrix Marfil     #10-10940
#     - Leonardo Martinez #11-10576

module BFS

  def bfs &bloque
    bloque.(self.val)
    nodos_recorridos = []
    self.each do |nodo|
      nodos_recorridos.push(nodo)
      bloque.(nodo)
    end
  end

end
