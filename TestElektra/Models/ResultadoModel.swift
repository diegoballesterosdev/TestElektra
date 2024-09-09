//
//  ResultadoModel.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation

// MARK: - Resultado
/// `Resultado` es una estructura que representa los datos principales
/// devueltos en la respuesta de la API. Conforma el protocolo `Codable`,
/// lo que facilita la codificación y decodificación de JSON.
///
/// - Parameters:
///   - paginacion: Un objeto opcional de tipo `Paginacion` que contiene
///     información sobre la paginación de los resultados.
///   - categoria: Una cadena opcional que indica la categoría del resultado.
///   - productos: Un arreglo opcional de objetos `Producto` que representan
///     los productos obtenidos en la respuesta.
struct Resultado: Codable {
    let paginacion: Paginacion?
    let categoria: String?
    let productos: [Producto]?
}
