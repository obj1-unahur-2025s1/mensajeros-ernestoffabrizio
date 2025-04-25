object paquetito{
  method puedeSerEntregadoPor_A(unMensajero, unDestino){
    return(true)
  }
  method precio(){
    return(
      100
    )
  }
}
object paquetonViajero{
  var precio = 50
  var estaPago = false
  const destinos = ["españa", "francia", "argentina"]
  method pagarPaquete(){
    estaPago = true
  }
  method puedeSerEntregadoPor_A(unMensajero, unDestino){
    precio = destinos.size()*100
    return(
      unDestino.puedePasar(unMensajero) and estaPago
    )
  }
  method precio(){
    return(
      precio
    )
  }
}
object empresa{
  var facturacion = 0
  var contratados = []
  const paquetesPendientes = []
  method paquetesPendientes(){
    return (paquetesPendientes)
  }
  method contratarA(unMensajero){
    contratados.add(unMensajero)
  }
  method despedirA(unMensajero){
    contratados.remove(unMensajero)
  }
  method despedirATodos(){
    contratados = []
  }
  method laMensajeriaEsGrande(){
    return(
      contratados.size() > 2
    )
  }
  method puedeSerEntregadoPorPrimerEmpleadoA(unDestino){
    return(paquete.puedeSerEntregadoPor_A(contratados.first(), unDestino))
  }
  method pesoDelUltimoMensajero(){
    return(contratados.last().peso())
  }
  method listaDeContratados(){
    return(
      contratados
    )
  }
  method alguienPuedeEntregarElPaqueteA(unDestino, unPaquete){
    return contratados.any {
      contratados => unPaquete.puedeSerEntregadoPor_A(contratados, unDestino)
    }
  }
  method quienesPuedenEntregarElPaqueteA(unDestino, unPaquete){
    return contratados.filter {
      contratados => unPaquete.puedeSerEntregadoPor_A(contratados, unDestino)
    }
  }
 method promedioPesoContratados() {
    var totalPeso = 0
    contratados.forEach { contratado =>
        totalPeso = totalPeso + contratado.peso()
    }
    return totalPeso / contratados.size()
}
  method tieneSobrepeso(){
    return(
    self.promedioPesoContratados() > 500
    )
  }
  method enviarPaqueteSiEsPosibleA(unPaquete, unDestino){
    if (self.alguienPuedeEntregarElPaqueteA(unDestino, unPaquete)){
      facturacion = facturacion + unPaquete.precio()
      return("Se envió correctamente")
      if (unPaquete.in(paquetesPendientes)){
        paquetesPendientes.remove(unPaquete)
      }
    }
    else
    paquetesPendientes.add(unPaquete)
    return("No se pudo enviar y se añadió a pendientes")
  }
  method facturacionTotal(){
    return(facturacion)
  }
  method enviarConjuntoDePaquetesA(paquetes, unDestino) {
  paquetes.forEach { paquete =>
    self.enviarPaqueteSiEsPosibleA(paquete, unDestino)
  }
}
method paquetePendienteMasCaro() {
  var masCaro = paquetesPendientes.first()
  paquetesPendientes.forEach { paquete =>
    if (paquete.precio() > masCaro.precio()) {
      masCaro = paquete
    }
  }
  return (masCaro)
}
}
object paquete {
  var estaPago = true
  method noEstaPago(){
    estaPago = false
  }
  method puedeSerEntregadoPor_A(unMensajero, unDestino) {
    return(
      unDestino.puedePasar(unMensajero) and estaPago
    )
  }
  method precio(){
    return(
      150
    )
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
  var vehiculoActual = bicicleta
  method peso(){
    return(
    90 + vehiculoActual.peso()
    )
  }
  method vehiculo(unVehiculo) {
    vehiculoActual = unVehiculo
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
  var peso = 100
  method acoplarAlCamion(unaCantidad){
    peso = peso + 500*unaCantidad
  }
  method peso(){
    return(peso)
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
  method cargarCreditos(unaCantidad){
    cantidadDeCreditos = cantidadDeCreditos + unaCantidad
  }
  method tieneCredito(){
    return(
      cantidadDeCreditos > 0
    )
  }
}
object jesus{
  var estaVivo = false
  method peso(){
    if (estaVivo){
      return(10)
    }
    else
    return(0)
  }
  method puedeLlamar(){
    return(estaVivo)
  }
  method resucitar(){
    estaVivo = true
  }
  method vive(){
    return (estaVivo)
  }
}
object cajaDivina {
  method puedeSerEntregadoPor_A(unMensajero, unDestino) {
    return(
      unDestino.puedePasar(unMensajero) and jesus.vive()
    )
  }
  method precio(){
    return(
      0
    )
  }
}