//
//  PaginacionModel.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation

// MARK: - Paginacion
struct Paginacion: Codable {
    let pagina, totalPaginas, totalRegistros, totalRegistrosPorPagina: Int
}


