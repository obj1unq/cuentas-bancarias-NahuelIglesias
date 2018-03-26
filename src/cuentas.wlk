
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