//
//  AbonoSemanaleModel.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation

// MARK: - AbonosSemanale
struct AbonosSemanale: Codable {
    let plazo, montoAbono, montoDescuentoAbono, montoUltimoAbono: Int
    let montoFinalCredito, idPromocion, montoDescuentoElektra, montoDescuentoBanco: Int
    let precio, montoAbonoDigital: Int
}

