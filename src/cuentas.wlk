
object cuentaDePepe {
	var saldo = 0
	method saldo() = saldo
	
	method depositar(monto) { 
		saldo += monto
	} 

	method extraer(monto) { 
		saldo -= monto
	}
}

object cuentaDeJulian {
	var saldo = 0
	method saldo() = saldo
	
	method depositar(monto) {
		saldo += (monto*80/100)
	} 

	method extraer(monto) {
		if (saldo - 5 > 0) {
			saldo -= monto + 5
		}
		else saldo -= monto
	}
}

object cuentaDePapa {
	var saldoEnDolares = 0
	method saldo() = saldoEnDolares * self.precioDeCompra()
	
	method precioDeCompra() {
		return 14.70
	}
	method precioDeVenta() {
		return 15.10
	}
	
	method depositar(montoPesos) { 
		saldoEnDolares += montoPesos/self.precioDeVenta()
	} 

	method extraer(montoPesos) { 
		saldoEnDolares -= montoPesos/self.precioDeCompra()
	}
}

object cuentasCombinadas {
	var cuentaPrimaria = cuentaDeJulian
	var cuentaSecundaria = cuentaDePepe
	
	method cambiarCuentaPrimaria(cuenta) {
		cuentaPrimaria = cuenta
	}
	method cambiarCuentaSecundaria(cuenta) {
		cuentaSecundaria = cuenta
	}
	
	method saldo() {
		return cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
	}
	method depositar(monto) {
		if (cuentaSecundaria.saldo() < 1000) {
			cuentaSecundaria.depositar(monto)
		} else cuentaPrimaria.depositar(monto)
	}
	method extraer(monto) {
		
	}
}

object casaDeJulianYPepe {
	var gastos = 0
	var epoca = cuentaDeJulian
	var compras = []
	
	method comprar(cosa) {
		compras.add(cosa)
		self.gastar(cosa.valor())
	}
	method gastar(monto) {
		gastos += monto
		epoca.extraer(monto)
	}
	
	method gastos() {
		return gastos
	}
	
	method esDerrochona() {
		return gastos > 5000
	}
	
	method esBacan() {
		return epoca.saldo() > 40000
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	method compraMasCara() {
		return compras.max({compra => compra.precio() })
	}
	method electrodomesticosComprados() {
		return compras.filter({compra => compra.esElectrodomestico()})
	}
	method malaEpoca() {
		return compras.all({compra => compra.esComida()})
	}
	method queFaltaComprar(listaDeseos) {
		return listaDeseos.asSet().difference(compras.asSet())
	}
	method faltaComida() {
		return ((compras.count({compra => compra.esComida()})) < 2)
	}
	
	method tengoLaCosa(cosa) {
		return compras.contains(cosa)
	}
	method pedirDeseo(cosa) {
		if (!self.tengoLaCosa(cosa)) {
			self.comprar(cosa)
		}
	}
	method deseosCumplidos(listaDeseos) {
		return compras.filter({compra => listaDeseos.contains(compra)})
	}
	method deseosNoCumplidos(listaDeseos) {
		return compras.filter({compra => !listaDeseos.contains(compra)})
	}
	method podriamosDonar(listaDeseos) {
		return compras.filter({compra => })
	}
}

object romina {
	var deseos = #{}
	
	method desear(cosa) {
		deseos.add(cosa)
	}
	method olvidar(cosa) {
		deseos.remove(cosa)
	}
	method pedirUnaCosa(cosa) {
		casaDeJulianYPepe.pedirDeseo(cosa)
	}
	method deseosNoSatisfechos() {
		return casaDeJulianYPepe.deseosNoCumplidos(deseos)
	}
	method deseosSatisfechos() {
		return casaDeJulianYPepe.deseosCumplidos(deseos)
	}
	method cosasParaDonar() {
		return casaDeJulianYPepe.podriamosDonar(deseos)
	}
}

object heladera {
	method valor() = 20000 
	method esComida() = false
	method esElectrodomestico() = true
}

object cama {
	method valor() = 8000 
	method esComida() = false
	method esElectrodomestico() = false
}

object tiraDeAsado {
	method valor() = 350 
	method esComida() = true
	method esElectrodomestico() = false
}

object paqueteFideos {
	method valor() = 50 
	method esComida() = true
	method esElectrodomestico() = false
}

object plancha {
	method valor() = 1200 
	method esComida() = false
	method esElectrodomestico() = true
}