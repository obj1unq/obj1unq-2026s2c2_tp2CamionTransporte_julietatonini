import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		self.validarCargar(unaCosa)    // esta bien que de error si ya esta cargado o lo tengo que ignorar?
		cosas.add(unaCosa)
	}


	method validarCargar(unaCosa){
		if (cosas.contains(unaCosa)) {
			self.error("El elemento ya se encuentra cargado")
		}
	}


	method descargar(unaCosa) {
		self.validarDescargar(unaCosa) 
		cosas.remove(unaCosa)
	}


	method validarDescargar(unaCosa) {
		if (not cosas.contains(unaCosa)) {
			self.error("El elemento no se encuentra cargado")
		}
	}


	method todoPesoPar(){
		return cosas.all({cosa => cosa.peso() % 2 == 0}) 
	}


	method algunoQuePesa(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}


	method pesoTotal(){
		return 1000 + cosas.sum({cosa => cosa.peso()})
	}


	method estaExcedido(){
		return self.pesoTotal() > 2500 
	}


	method cargaDeNivel(nivelPeligrosidad){
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad})
	}


	method conExcesoDePeligrosidad(nivelPeligrosidad){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivelPeligrosidad})
	}


	method masPeligrosasQue(otraCosa){
		return self.conExcesoDePeligrosidad(otraCosa.nivelPeligrosidad())
	}


	method puedeCircular(nivelPeligrosidad){		
		return not self.estaExcedido() && self.conExcesoDePeligrosidad(nivelPeligrosidad).isEmpty()
	}

	
	method tieneAlgoEntre(peso1, peso2){
		return cosas.any({cosa => cosa.peso() >= peso1 && cosa.peso() <= peso2})
	}


	method elMasPesado(){
		return cosas.max({cosa => cosa.peso()})
	}


	method pesos(){
		return cosas.map({cosa => cosa.peso()})     // map siempre devuelve una lista, no importa el tipo de coleccion que tome.
	}


	method cantidadTotalDeBultos(){
		return cosas.sum({cosa => cosa.cantidadBultos()}) 
	}
}
