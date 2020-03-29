import ejemplo.cajero.modelo.Cuenta;

public aspect SaldoReducido {
	pointcut metodoRetirar() : call ( * ejemplo.cajero.modelo.Cuenta.retirar(*));

	void around() throws Exception : metodoRetirar() {

		long saldo = ((Cuenta) thisJoinPoint.getTarget()).getSaldo();
		long valor = (long) thisJoinPoint.getArgs()[0];
		
		// solo se hace el retiro si el valor es mayor que cero
		// y el valor es mayor que el saldo actual
		if (valor < 0) {
			throw new Exception("No se puede retirar un valor negativo");
		}
		if (valor > saldo) {
			throw new Exception("No se puede retirar un valor mayor al saldo");
		}
		if ( valor > saldo - 200000) {
			throw new Exception("Ninguna cuenta se puede quedar con un saldo menor a $200.000");
		}
		((Cuenta) thisJoinPoint.getTarget()).setSaldo(saldo-valor);
	}
}