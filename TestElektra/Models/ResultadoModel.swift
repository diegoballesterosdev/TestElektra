//
//  ResultadoModel.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation

// MARK: - Resultado
struct Resultado: Codable {
    let paginacion: Paginacion?
    let categoria: String?
    let productos: [Producto]?
}
