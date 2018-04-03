
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
	var valor = 20000 
	var esComida = false
	var esElectrodomestico = true
}

object cama {
	var valor = 8000 
	var esComida = false
	var esElectrodomestico = false
}

object tiraDeAsado {
	var valor = 350 
	var esComida = true
	var esElectrodomestico = false
}

object paqueteFideos {
	var valor = 50 
	var esComida = true
	var esElectrodomestico = false
}

object plancha {
	var valor = 1200 
	var esComida = false
	var esElectrodomestico = true
}