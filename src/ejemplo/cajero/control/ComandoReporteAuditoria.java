package ejemplo.cajero.control;

import java.util.Scanner;

import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

/**
 * Comando usado para consignar dinero
 */
public class ComandoReporteAuditoria implements Comando {

	@Override
	public String getNombre() {
		return "Generar reporte auditoría";
	}

	@SuppressWarnings("resource")
	@Override
	public void ejecutar(Banco contexto) throws Exception {
		
		System.out.println("Generar reporte auditoría");
		System.out.println();
	}
}
