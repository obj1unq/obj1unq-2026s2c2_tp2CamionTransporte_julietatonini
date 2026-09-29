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
}
