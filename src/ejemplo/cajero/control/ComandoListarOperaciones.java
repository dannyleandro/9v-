package ejemplo.cajero.control;

import ejemplo.cajero.modelo.Banco;

/**
 * Comando usado para listar las cuentas 
 */
public class ComandoListarOperaciones implements Comando {

	@Override
	public String getNombre() {
		return "Listar Operaciones";
	}

	@Override
	public void ejecutar(Banco contexto) throws Exception {
		
		System.out.println("Listado de Operaciones");
		System.out.println();
	
		for (String op : contexto.getOperaciones()) {
			System.out.println(op);
		}

	}

}
