/*
 * Los sabores
 */
object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }




/*
 * Golosinas
 */

class Golosina {  //creamos una herencia para que todas las clases hereden los mismos metodos
	var property peso = 15
	var property libreGluten = true
	var property precio
	var property sabor	
}

class Bombon inherits Golosina{
	method initialize(){
		precio = 5
		sabor = frutilla
	}
	
	method mordisco() { peso = peso * 0.8 - 1 }
}

class BombonDuro inherits Bombon{
	method initialize(){
		precio = 5
		sabor = frutilla
	}
	
	override method mordisco() { peso = peso - 1 } //cuando se comporta de otra forma se pone asi
	
	method gradoDureza(){
		
	}
}

class Alfajor inherits Golosina{
	
	method initialize(){ // aca cambio los valores que no coincide con los predeterminados o asigno valores
		libreGluten = false
		precio = 12
		sabor = chocolate
	}

	method mordisco() { peso = peso * 0.8 }
}

class Caramelo inherits Golosina{
	
	method initialize(){
		peso = 5
		precio = 12
		sabor = frutilla
	}
	
	method mordisco() { peso = peso - 1 }
}


class Chupetin inherits Golosina{
	
	method initialize(){
		peso = 7
		precio = 2
		sabor = naranja
	}
	
	method mordisco() { 
		if (peso >= 2) {
			peso = peso * 0.9
		}
	}
}

class Oblea inherits Golosina{
	
	method initialize(){
		libreGluten = false
		precio = 5
		sabor = vainilla
	}
	
	method mordisco() {
		if (peso >= 70) {
			// el peso pasa a ser la mitad
			peso = peso * 0.5
		} else { 
			// pierde el 25% del peso
			peso = peso - (peso * 0.25)
		}
	}	
}

class Chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var comido = 0
	
	method pesoInicial(unPeso) { pesoInicial = unPeso }
	method precio() { return pesoInicial * 0.50 }
	method peso() { return (pesoInicial - comido).max(0) }
	method mordisco() { comido = comido + 2 }
	method sabor() { return chocolate }
	method libreGluten() { return false }

}

class GolosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method golosinaInterior(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() { return golosinaInterior.precio() + 2 }
	method peso() { return golosinaInterior.peso() + pesoBanio }
	method mordisco() {
		golosinaInterior.mordisco()
		pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method sabor() { return golosinaInterior.sabor() }
	method libreGluten() { return golosinaInterior.libreGluten() }	
}


class Tuttifrutti {
	var libreDeGluten
	var sabores = [frutilla, chocolate, naranja]
	var saborActual = 0
	
	method mordisco() { saborActual += 1 }	
	method sabor() { return sabores.get(saborActual % 3) }	

	method precio() { return (if(self.libreGluten()) 7 else 10) }
	method peso() { return 5 }
	method libreGluten() { return libreDeGluten }	
	method libreGluten(valor) { libreDeGluten = valor }
}
