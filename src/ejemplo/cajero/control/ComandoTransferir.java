package ejemplo.cajero.control;


import ejemplo.cajero.modelo.Banco;

/**
 * Comando usado para transferir dinero entre cuentas
 */
public class ComandoTransferir implements Comando {

	@Override
	public String getNombre() {
		return "Transferir dinero";
	}

	@SuppressWarnings("resource")
	@Override
	public void ejecutar(Banco contexto) throws Exception {
		System.out.println("No es posible realizar la transferencia porque la opción no se encuentra disponible para este cajero.");
	}

}
