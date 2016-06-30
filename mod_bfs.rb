# mod_bfs.rb
# Definicion del modulo BFS.
# Autores:
#     - Aldrix Marfil     #10-10940
#     - Leonardo Martinez #11-10576

module BFS

    #Método que permite recorrer árboles (binarios y rosas) aplicando BFS.
    def bfs
        nodos_recorridos = []
        nodos_recorridos.push(self)

        while (nodos_recorridos.size != 0)
            nodo = nodos_recorridos.shift
            yield nodo
            nodo.each do |hijo|
                nodos_recorridos.push(hijo)
            end
        end
    end

    #Metodo que permite recorrer árboles (binarios y rosas) aplicando BFS
    #y devolviendo los nodos que cumplen con el predicado del bloque pasado
    #de manera explicita.
    def recoger(bloque)
        nodos_correctos = []

        self.bfs do |nodo|
            if bloque.call(nodo)
                nodos_correctos.push(nodo)
            end
        end
        return nodos_correctos
    end

end
