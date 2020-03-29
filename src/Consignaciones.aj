import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoConsignar;

public aspect Consignaciones {
	pointcut metodoCargaComandos() : call ( * ejemplo.cajero.Cajero.cargaComandos());

	after() returning(Object resultado): metodoCargaComandos() {

		System.out.println("comandos " + resultado);
		((List<Comando>) resultado).add(new ComandoConsignar());
	}
}