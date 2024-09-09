//
//  ProductoModel.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation

// MARK: - Producto
/// `Producto` es una estructura que representa un producto en la respuesta de la API.
/// Conforma el protocolo `Codable`, lo que facilita su codificación y decodificación
/// para su uso con datos en formato JSON.
///
struct Producto: Codable {
    let id: String? // Identificador único del producto
    let idLinea: Int? // Identificador de la línea del producto
    let codigoCategoria: CodigoCategoria? // Código de la categoría del producto
    let idModalidad, relevancia: Int? // Identificadores de la modalidad y relevancia
    let lineaCredito: String? // Línea de crédito asociada al producto
    let pagoSemanalPrincipal, plazoPrincipal: Int? // Monto del pago semanal y plazo en semanas
    let disponibleCredito: Bool? // Indica si el crédito está disponible
    let abonosSemanales: [AbonosSemanale]? // Lista de abonos semanales del producto
    let sku, nombre: String? // SKU y nombre del producto
    let urlImagenes: [String]? // Lista de URLs de las imágenes del producto
    let precioRegular: Int? // Precio regular del producto
    let precioFinal, porcentajeDescuento: Double? // Precio final y porcentaje de descuento aplicado
    let descuento: Bool? // Indica si el producto tiene descuento
    let precioCredito, montoDescuento: Double? // Precio del producto al usar crédito y monto de descuento
}

// MARK: - CodigoCategoria
/// `CodigoCategoria` es un enumerado que representa las diferentes categorías de productos.
enum CodigoCategoria: String, Codable {
    case c = "C"
    case ma = "MA"
    case tl = "TL"
}
