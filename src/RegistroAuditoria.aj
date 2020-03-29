
public aspect RegistroAuditoria {
	pointcut metodosDelModelo() : call( * ejemplo.cajero.modelo..*(..));

	// ejecución antes de ejecutar el método
	before(): metodosDelModelo() {
		System.out.println("Ejecutando");
		System.out.println("\t objeto     : " + thisJoinPoint.getTarget());
		System.out.println("\t método     : " + thisJoinPoint.getSignature());
		System.out.println("\t argumentos : " + thisJoinPoint.getArgs());
	}

	// ejecución al retornar el método
	after() returning(Object resultado): metodosDelModelo() {
		System.out.println("Retornando");
		System.out.println("\t resultado  : " + resultado);
	}

	// ejecución al retornar el método
	after() throwing(Throwable e): metodosDelModelo() {
		System.out.println("Retornando con Excepción");
		System.out.println("\t excepción : " + e.getMessage());
	}
}