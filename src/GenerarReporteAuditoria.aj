import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoConsultarSaldo;
import ejemplo.cajero.control.ComandoReporteAuditoria;

public aspect GenerarReporteAuditoria {
	pointcut cargaComandos() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
	
	after() returning(List<Comando> resultado): cargaComandos() {		
		resultado.add(new ComandoReporteAuditoria());
	}
}
