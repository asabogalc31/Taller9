import java.util.List;
import java.util.Scanner;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoTransferir;
import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

public aspect Transferir {
	pointcut cargaComandos() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
	pointcut ejecutarTransferencia(Banco contexto) : call ( * ejemplo.cajero.control.Comando.ejecutar(Banco)) && args(contexto);

	void around(Banco contexto) throws Exception : ejecutarTransferencia(contexto) {

		System.out.println("Transferencia de Dinero");
		System.out.println();
		
		// la clase Console no funciona bien en Eclipse
		Scanner console = new Scanner(System.in);			
		
		// Ingresa los datos
		System.out.println("Ingrese el número de cuenta origen");
		String numeroCuentaOrigen = console.nextLine();
		
		Cuenta cuentaOrigen = contexto.buscarCuenta(numeroCuentaOrigen);
		if (cuentaOrigen == null) {
			throw new Exception("No existe cuenta con el número " + numeroCuentaOrigen);
		}

		System.out.println("Ingrese el número de cuenta destino");
		String numeroCuentaDestino = console.nextLine();
		
		Cuenta cuentaDestino = contexto.buscarCuenta(numeroCuentaDestino);
		if (cuentaDestino == null) {
			throw new Exception("No existe cuenta con el número " + numeroCuentaDestino);
		}
		
		System.out.println("Ingrese el valor a transferir");
		String valor = console.nextLine();
	
		try {
			
			// se retira primero y luego se consigna
			// si no se puede retirar, no se hace la consignación
			
			long valorNumerico = Long.parseLong(valor);
			cuentaOrigen.retirar(valorNumerico);
			cuentaDestino.consignar(valorNumerico);
		
		} catch (NumberFormatException e) {
			throw new Exception("Valor a transferir no válido : " + valor);
		}
	}
	
	after() returning(List<Comando> resultado): cargaComandos() {		
		resultado.add(new ComandoTransferir());
	}
}
