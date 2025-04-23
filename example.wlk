object paquete {
  method puedeSerEntregado() {

  }
}

object brooklyn {
  method puedePasar(mensajero){
    return(
      mensajero.peso() <= 1000
    )
  }
}

object matrix {
 method puedePasar(mensajero) {
   return(
    mensajero.puedeLlamar()
   )
 } 
}

object roberto {
  var vehiculo = null
  method pesoTotal(){
    90 + vehiculo.peso()
  }
  method vehiculo(unVehiculo) {
    vehiculo = unVehiculo
  }
  method puedeLlamar() {
    return(
      false
    )
  }
}

object bicicleta {
  method peso(){
    return(
      5
    )
  }
}

object camion {
  var peso = 500 
  method acoplarAlCamion(unaCantidad){
    peso = peso + 500*unaCantidad
  }
}

object chuckNorris {
  method peso(){
    return(
      90
    )
  }
  method puedeLlamar(){
    return(
      true
    )
  }
}

object neo {
  var cantidadDeCreditos = 0
  method peso() {
    return(
      0
    )
  }
  method puedeLlamar(){
    return(
      self.tieneCredito()
    )
  }
  method tieneCredito(){
    return(
      cantidadDeCreditos > 0
    )
  }
}