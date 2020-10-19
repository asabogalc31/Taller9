import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoImprimirListadoOperaciones;

public aspect ImprimirListadoOperaciones {
pointcut cargaComandos() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
	
	after() returning(List<Comando> resultado): cargaComandos() {		
		resultado.add(new ComandoImprimirListadoOperaciones());
	}
}
