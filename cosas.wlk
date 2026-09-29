object knightRider {
	
	method peso(){ 
		return 500 }


	method nivelPeligrosidad(){ 
		return 10 }

	method cantidadBultos(){
		return 1
	}
}



object arena{

	var peso = 0


	method peso(){
		return peso
	}


	method peso(nuevoPeso){
		peso = nuevoPeso
	}


	method nivelPeligrosidad(){
		return 1
	}

	method cantidadBultos(){
		return 1
	}
}




object bumblebee {

	var estado = auto

	method peso(){
		return 800
	}


	method nivelPeligrosidad(){
		if (estado == auto) {
			return auto.nivelPeligrosidad()
		} else {
			return robot.nivelPeligrosidad()
		}
	}


	method actualizarEstado(nuevoEstado){
		estado = nuevoEstado
	}


	method cantidadBultos(){
		return 2
	}
}






object auto {

	method nivelPeligrosidad(){
		return 15
	}
}






object robot {

	method nivelPeligrosidad(){
		return 30
	}
}





object paqueteLadrillos {

	var cantidadLadrillos = 0 


	method cantidadLadrillos(){
		return cantidadLadrillos
	}


	method cantidadLadrillos(nuevaCantidad){
		cantidadLadrillos = nuevaCantidad
	}


	method peso(){
		return cantidadLadrillos * 2
	}


	method nivelPeligrosidad(){
		return 2
	}


	method cantidadBultos(){
		if (self.cantidadLadrillos() <= 100) {
			return 1
		} else if (self.cantidadLadrillos() <= 300) {
			return 2
		} else {
			return 3
		}
	}
}




object bateriaAntiaerea {

	var misiles = true


	method misiles(){
		return misiles
	}


	method actualizarMisiles(){
		misiles = not misiles
	}


	method peso(){
		if (misiles) {
			return 300
		} else {
			return 200
		}
	}


	method nivelPeligrosidad(){
		if (misiles) {
			return 100
		} else {
			return 0
		}
	}


	method cantidadBultos(){
		if (misiles) {
			return 2
		} else {
			return 1
		}
	}
}




object residuos {

	var peso = 0 

	
	method peso(){
		return peso
	}


	method peso(nuevoPeso){
		peso = nuevoPeso
	}


	method nivelPeligrosidad(){
		return 200
	}


	method cantidadBultos(){
		return 1
	}
}





object contenedor {

	const property cosas = #{}


	method cargar(unaCosa) {
		self.validarCargar(unaCosa)
		cosas.add(unaCosa)
	}


	method validarCargar(unaCosa){
		if (cosas.contains(unaCosa)) {
			self.error("El elemento ya se encuentra cargado")
		}
	}


	method peso(){
		return 100 + cosas.sum({cosa => cosa.peso()})
	}


	method nivelPeligrosidad(){
		if (cosas.isEmpty()){
			return 0 
		} else {
		return cosas.map({cosa => cosa.nivelPeligrosidad()}).max()
		}
	}


	method cantidadBultos(){
		return 1 + cosas.sum({cosa => cosa.cantidadBultos()})
	}
}






object embalaje {

	var envuelveA = null 


	method envuelveA(){
		return envuelveA
	}


	method envuelveA(unaCosa){
		envuelveA = unaCosa
	}


	method peso(){
		return envuelveA.peso() 
	}


	method nivelPeligrosidad(){
		return envuelveA.nivelPeligrosidad() / 2
	}


	method cantidadBultos(){
		return 2
	}
}