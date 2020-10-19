import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoSaldoReducido;

public aspect SaldoReducido {
pointcut cargaComandos() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
	
	after() returning(List<Comando> resultado): cargaComandos() {		
		resultado.add(new ComandoSaldoReducido());
	}
}
