
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

object casaDeJulian {
	var gastos = 0
	var epoca = cuentaDeJulian
	var compras = #{}
	
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