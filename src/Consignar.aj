import java.util.List;
import java.util.Scanner;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoConsignar;
import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

public aspect Consignar {
	pointcut cargaComandos() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
	pointcut ejecutarConsignacion(Banco contexto) : call ( * ejemplo.cajero.control.Comando.ejecutar(..)) && args(contexto);

	void around(Banco contexto) throws Exception : ejecutarConsignacion(contexto) {
		System.out.println("Consignación de Dinero");
		System.out.println();
		
		// la clase Console no funciona bien en Eclipse
		Scanner console = new Scanner(System.in);			
		
		// Ingresa los datos
		System.out.println("Ingrese el número de cuenta");
		String numeroDeCuenta = console.nextLine();
		
		Cuenta cuenta = contexto.buscarCuenta(numeroDeCuenta);
		if (cuenta == null) {
			throw new Exception("No existe cuenta con el número " + numeroDeCuenta);
		}
		
		System.out.println("Ingrese el valor a consignar");
		String valor = console.nextLine();
	
		try {
			long valorNumerico = Long.parseLong(valor);
			cuenta.consignar(valorNumerico);
		
		} catch (NumberFormatException e) {
			throw new Exception("Valor a consignar no válido : " + valor);
		}
	}
	
	after() returning(List<Comando> resultado): cargaComandos() {		
		resultado.add(new ComandoConsignar());
	}
}
