# nodos.rb
# Provee las definicion de los nodos y mutadores.
# Autores:
#     - Aldrix Marfil     #10-10940
#     - Leonardo Martinez #11-10576


class Fixnum

	#Método que recibe una objeto (instancia) de una clase y retorna
	#otro objeto de clase Fixnum

	def mutar(v)
		v.recibe_Fixnum(self)
	end

  #Toma el numero self y retorna una lista cuyos elementos son
  #los digitos de self individualmente.
	def digitos
		dividendo, resto = divmod(10)
		dividendo == 0 ? [resto] : [*dividendo.digitos,resto]
	end

end


class String

	#Método que recibe una objeto (instancia) de una clase y retorna
	#otro objeto de clase String
	def mutar(v)
		v.recibe_String(self)
	end
end


class Array

	#Método que recibe una objeto (instancia) de una clase y retorna
	#otro objeto de clase Array
	def mutar(v)
		v.recibe_Array(self)
	end
end



#Clase abstracta mutador.
class Mutador; end

#Mutador que recibe una clase Fixnum, String o Array y altera a la misma.
class Singular < Mutador

	#Con una instancia de Fixnum muta en la multiplicacion del último dígito
	#con la suma de los dígitos restantes.
	def Singular.recibe_Fixnum(o)
		lista_digitos = o.digitos
		n = lista_digitos.length - 1

		if n + 1 == 1
			return o
		else
			suma = 0
			for i in 0..n-1
				suma += lista_digitos[i]
			end
			return suma * lista_digitos[n]
		end
	end


	#Con una instancia de String muta en los caracteres pertenecientes a
	#"singular" en mayúscula.
	def Singular.recibe_String(o)
		n = o.length
		for i in 0..n-1
			if "singular".include?(o[i])
				o[i] = o[i].upcase
			end
		end
		return o
	end


	#Con una instancia de Array muta en todos los elementos interpolados en un
	#string separados por un espacio.
	def Singular.recibe_Array(o)
		o.flatten!
		n = o.length
		x = ""
		for i in 0..n-1
			x += o[i].to_s
			if i != n-1
				x += " "
			end
		end
		return x
	end
end


#Mutador que recibe una clase Fixnum, String o Array y altera a la misma.
class Uniforme < Mutador

	#Con una instancia de Fixnum muta en el promedio de los dígitos.
	def Uniforme.recibe_Fixnum(o)
		lista_digitos = o.digitos
		n = lista_digitos.length

		if n == 1
			return o
		else
			suma = 0
			for i in 0..n-1
				suma += lista_digitos[i]
			end
			return (suma.to_f/n).round
		end
	end


	#Con una instancia de String muta en un nuevo string con los caracteres
	#en mayúscula y minúscula intercalados.
	def Uniforme.recibe_String(o)
		n = o.length
		for i in 0..n-1
			if i % 2 == 0
				o[i] = o[i].upcase
			else
				o[i] = o[i].downcase
			end
		end
		return o
	end


	#Con una instancia de Array mutaria los elemnetos del arreglo de manera
	#uniforme.
	def Uniforme.recibe_Array(o)
		n = o.length
		for i in 0..n-1
			u = Uniforme.new
			o[i] = o[i].mutar(u)
		end
		return o
	end
end


#Mutador que recibe una clase Fixnum, String o Array y altera a la misma.
class Oscuro < Mutador

	#Con una instancia de Fixnum muta en un Fixnum sin los digitos en
	#posición impar.
	def Oscuro.recibe_Fixnum(o)
		lista_digitos = o.digitos
		n = lista_digitos.length

		if n == 1
			return o
		else
			nuevo_num = 0
			i = 0
			cant_pares = n - n/2
			while i < n
				nuevo_num += lista_digitos[i]*(10**(cant_pares-1))
				i += 2
				cant_pares -= 1
			end
			return nuevo_num
		end
	end


	#Con una instancia de String muta en los caracteres en posición impar
	#concatenados del lado izquierdo y los otros concatenados del lado derecho.
	def Oscuro.recibe_String(o)
		n = o.length
		impares = ""
		pares   = ""
		for i in 0..n-1
			if i % 2 == 0
				pares += o[i]
			else
				impares += o[i]
			end
		end
		return impares + pares
	end


	#Con una instancia de Array selecciona el 50% de los elementos del arreglo
	#de manera aleatoria y los muta de manera oscura.
	def Oscuro.recibe_Array(o)
		n = o.length
		mitad = n/2
		elementos = []
		i = 0
		while i < mitad
			x = 0 + rand(n)
			if !(elementos.include?(x))
				elementos.push(x)
			end
			i = elementos.length
		end
		for i in elementos
			osc  = Oscuro.new
			o[i] = o[i].mutar(osc)
		end
		return o
	end

end


#c = Oscuro.new
#puts ["Me",35,["Hola",25,12,456],1,4].mutar(c)
