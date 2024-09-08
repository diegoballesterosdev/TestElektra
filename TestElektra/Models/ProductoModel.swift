//
//  ProductoModel.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation

// MARK: - Producto
struct Producto: Codable {
    let id: String?
    let idLinea: Int?
    let codigoCategoria: CodigoCategoria?
    let idModalidad, relevancia: Int?
    let lineaCredito: String?
    let pagoSemanalPrincipal, plazoPrincipal: Int?
    let disponibleCredito: Bool?
    let abonosSemanales: [AbonosSemanale]?
    let sku, nombre: String?
    let urlImagenes: [String]?
    let precioRegular: Int?
    let precioFinal, porcentajeDescuento: Double?
    let descuento: Bool?
    let precioCredito, montoDescuento: Double?
}
