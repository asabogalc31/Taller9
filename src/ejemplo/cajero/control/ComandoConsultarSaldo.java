package ejemplo.cajero.control;

import java.util.Scanner;

import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

/**
 * Comando usado para consignar dinero
 */
public class ComandoConsultarSaldo implements Comando {

	@Override
	public String getNombre() {
		return "Consultar saldo";
	}

	@SuppressWarnings("resource")
	@Override
	public void ejecutar(Banco contexto) throws Exception {
		System.out.println("No es posible realizar consultar el saldo porque la opción no se encuentra disponible para este cajero.");
	}

}
