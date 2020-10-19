import java.util.List;
import java.util.Scanner;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoConsultarSaldo;
import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

public aspect ConsultarSaldo{
	pointcut cargaComandos() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
	pointcut ejecutarConsultarSaldo(Banco contexto) : call ( * ejemplo.cajero.control.Comando.ejecutar(..)) && args(contexto);
	
	void around(Banco contexto) throws Exception : ejecutarConsultarSaldo(contexto) {

		System.out.println("Consultar saldo");
		System.out.println();
		
		// la clase Console no funciona bien en Eclipse
		Scanner console = new Scanner(System.in);			
		
		// Ingresa los datos
		System.out.println("Ingrese el número de cuenta");
		String numeroDeCuenta = console.nextLine();
		
		Cuenta cuenta = contexto.buscarCuenta(numeroDeCuenta);
		System.out.println(cuenta.getSaldo());
	}
	
	after() returning(List<Comando> resultado): cargaComandos() {		
		resultado.add(new ComandoConsultarSaldo());
	}
}
