import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoTransferir;

public aspect Transferencias {
	
	pointcut metodoCargaComandos() : call ( * ejemplo.cajero.Cajero.cargaComandos());

	after() returning(Object resultado): metodoCargaComandos() {

		((List<Comando>) resultado).add(new ComandoTransferir());
	}
}