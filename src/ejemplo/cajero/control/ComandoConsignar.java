package ejemplo.cajero.control;


import ejemplo.cajero.modelo.Banco;

/**
 * Comando usado para consignar dinero
 */
public class ComandoConsignar implements Comando {

	@Override
	public String getNombre() {
		return "Consignar dinero";
	}

	@SuppressWarnings("resource")
	@Override
	public void ejecutar(Banco contexto){
		System.out.println("No es posible realizar la consignación porque la opción no se encuentra disponible para este cajero.");
	}
}
