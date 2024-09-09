//
//  ItemsListModel.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation

// MARK: - ItemsList
struct ItemsList: Codable {
    let mensaje, advertencia: String?
    let resultado: Resultado?
}
