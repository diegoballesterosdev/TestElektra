//
//  ItemRowListView.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import SwiftUI
import Kingfisher
/// Vista que representa un ítem en una lista de productos.
/// Utiliza `Kingfisher` para la carga de imágenes desde URLs y muestra
/// información básica del producto, como su nombre, precio y categoría.
struct ItemRowListView: View {
    
    var item: Producto? // El producto que se mostrará en la vista, definido como opcional.
    
    var body: some View {
        VStack {
            HStack {
                // Si el producto tiene imágenes asociadas, se carga la primera imagen de la lista.
                if let urlImagenes = item?.urlImagenes {
                    VStack {
                        ZStack {
                            KFImage(URL(string: urlImagenes[0])) // Carga y muestra la imagen del producto desde la URL utilizando Kingfisher.
                                .resizable()
                                .scaledToFit()
                                .padding(30)
                            VStack {
                                // Si el producto está en descuento, se muestra una etiqueta de "Promoción".
                                if item?.descuento ?? false {
                                    Label("Promoción", systemImage: "tag.fill")
                                        .foregroundStyle(.white)
                                        .fontWeight(.heavy)
                                        .padding(5)
                                        .background {
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(.green)
                                        }
                                }
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
                
                VStack {
                    HStack {
                        // Muestra el nombre del producto
                        Text(item?.nombre ?? "Nombre")
                            .fontWeight(.heavy)
                            .lineLimit(3)
                        
                        Spacer()
                    }
                    .padding(.vertical, 7)
                    
                    // Muestra el precio regular del producto y el precio con descuento si aplica.
                    HStack {
                        Text("$" + formatNumber(item?.precioRegular ?? 0))
                            .strikethrough(item?.descuento ?? false)
                            .opacity(item?.descuento ?? false ? 0.6 : 1)
                            .fontWeight(.light)
                        
                        if item?.descuento ?? false {
                            Text("$" + formatNumber(Int(item?.precioFinal ?? 0)))
                                .fontWeight(.semibold)
                        }
                        Spacer()
                    }
                    
                    // Muestra la categoría del producto.
                    HStack {
                        Text("Categoría: ")
                            .fontWeight(.semibold)
                        Text("\(item?.codigoCategoria?.rawValue ?? "N/A")")
                        Spacer()
                    }
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .stroke(.black.opacity(0.3))
        )
        .frame(height: 230)
    }
    
    
    func formatNumber(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_US")
        
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        
        if let formattedNumber = formatter.string(from: NSNumber(value: value)) {
            return formattedNumber
        } else {
            return "\(value)"
        }
    }
}


#Preview {
    ItemRowListView(item: Producto(id: "34004593", idLinea: 100, codigoCategoria: .c, idModalidad: 10, relevancia: 10, lineaCredito: "", pagoSemanalPrincipal: 10, plazoPrincipal: 10, disponibleCredito: false, abonosSemanales: .none, sku: "34004593", nombre: "Motocicleta de Trabajo Italika FT125TS Azul", urlImagenes: ["https://elektraqa.vteximg.com.br/arquivos/ids/1140557/34001913.jpg?v=637522930347430000"], precioRegular: 20443, precioFinal: 19999, porcentajeDescuento: 2.171892579367025, descuento: true, precioCredito: 17999, montoDescuento: 444))
}
