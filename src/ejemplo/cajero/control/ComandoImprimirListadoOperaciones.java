package ejemplo.cajero.control;

import java.util.Scanner;

import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

/**
 * Comando usado para consignar dinero
 */
public class ComandoImprimirListadoOperaciones implements Comando {

	@Override
	public String getNombre() {
		return "Imprimir listado de operaciones al final del día";
	}

	@SuppressWarnings("resource")
	@Override
	public void ejecutar(Banco contexto) throws Exception {
		
		System.out.println("Imprimir listado de operaciones al final del día");
		System.out.println();
	}

}
