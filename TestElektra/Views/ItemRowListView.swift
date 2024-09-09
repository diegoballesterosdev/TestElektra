//
//  ItemRowListView.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import SwiftUI
import Kingfisher

struct ItemRowListView: View {
    
    @State private var viewModel = ItemsListViewModel()
    var item: Producto?
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    if let urlImagenes = item?.urlImagenes {
                        VStack {
                            
                            ZStack {
                                KFImage(URL(string: urlImagenes[0]))
                                    .resizable()
                                    .scaledToFit()
                                    .padding(30)
                                VStack {
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
                            Text(item?.nombre ?? "Nombre")
                                .fontWeight(.heavy)
                                .lineLimit(3)
                            
                            Spacer()
                        }
                        .padding(.vertical, 7)
                        
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
