//Rey Fernando Castrejón Fernández 2708299
import UIKit

class Juego {
    var reinas = [Reina]()
    var limites: Int
    
    init(limites: Int) {
        self.limites = limites
    }
    
    struct Reina {
        var fila: Int
        var columna: Int
    }
    
    func Posicion (cordenada fila: Int, columna: Int) -> Bool {
        for reina in reinas {
            if reina.fila == fila { return false }
            if reina.columna == columna { return false }
            if abs(reina.fila-fila) == abs(reina.columna-columna) { return false }
        }
        return true
    }
    func Jugar() {
        Busqueda(cordenada: 0)
    }
    
    func Busqueda(cordenada fila: Int) {
        if reinas.count < limites {
            for columna in 0...limites-1 {
                if Posicion(cordenada: fila, columna: columna) {
                    let reina = Reina(fila: fila, columna: columna)
                    reinas.append(reina)
                    Busqueda(cordenada: fila=1)
                    if reinas.count == limites {
                        print(Resultado())
                    }
                    reinas.removeLast()
                }
            }
        }
    }
 
    func Resultado() -> String {
        var espacio = ""
        for lugar in reinas {
            espacio += "(\(lugar.fila),\(lugar.columna))"
        }
        return espacio
    }
}

let tablero = Juego(limites: 4)
tablero.Jugar()
