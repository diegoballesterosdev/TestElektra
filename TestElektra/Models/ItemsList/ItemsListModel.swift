//
//  ItemsListModel.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation

// MARK: - ItemsList
/// `ItemsList` es una estructura que representa la respuesta de la API.
/// Esta estructura es conforme al protocolo `Codable`, lo que permite
/// su codificación y decodificación para trabajar con datos JSON.

struct ItemsList: Codable {
    let mensaje, advertencia: String? // Un mensaje opcional proporcionado en la respuesta (String). Un mensaje de advertencia opcional (String).
    let resultado: Resultado? //Un objeto opcional de tipo `Resultado` que contiene la información principal de la respuesta.
}
