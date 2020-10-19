package ejemplo.cajero.control;

import java.util.Scanner;

import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

/**
 * Comando usado para consignar dinero
 */
public class ComandoSaldoReducido implements Comando {

	@Override
	public String getNombre() {
		return "Saldo reducido";
	}

	@SuppressWarnings("resource")
	@Override
	public void ejecutar(Banco contexto) throws Exception {
		
		System.out.println("Saldo reducido");
		System.out.println();
	}
}
