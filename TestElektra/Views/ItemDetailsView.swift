//
//  ItemDetailsView.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import SwiftUI
import Kingfisher

struct ItemDetailsView: View {
    @State private var viewModel = ItemsListViewModel()
    @Binding var selectedItem: Producto?
    //    @Binding var producto: Producto?
    
    var body: some View {
        
        if selectedItem != nil {
            GeometryReader { geometry in
                ZStack {
                    ScrollView {
                        VStack {
                            VStack {
                                HStack {
                                    Text("SKU: \(selectedItem?.sku ?? "N/A")")
                                        .font(.subheadline)
                                        .opacity(0.3)
                                    
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Text(selectedItem?.nombre ?? "")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                }
//                                .frame(height: 50)
                                
                                HStack {
                                    Text("Categoría: ")
                                        .fontWeight(.semibold)
                                    Text("\(selectedItem?.codigoCategoria?.rawValue ?? "N/A")")
                                    Spacer()
                                }
                            }
                            .padding(.leading)
                            .padding(.top)
                            
                            TabView {
                                //                        HStack {
                                if let urlImagenes = selectedItem?.urlImagenes {
                                    ForEach(urlImagenes, id: \.self) { urlImage in
                                        KFImage(URL(string: urlImage))
                                            .resizable()
                                            .scaledToFit()
                                            .padding(60)
                                            .frame(width: geometry.size.width)
                                        
                                        
                                    }
                                }
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                            
                            .tabViewStyle(.page)
                            .indexViewStyle(.page(backgroundDisplayMode: .always))
                            .background(RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10))
                            
                            
                            
                            VStack {
                                HStack {
                                    Text("Pago de contado")
                                        .font(.title3)
                                    Spacer()
                                    Text("$" + formatNumber(selectedItem?.precioRegular ?? 0))
                                        .strikethrough(selectedItem?.descuento ?? false)
                                        .opacity(selectedItem?.descuento ?? false ? 0.6 : 1)
                                        .font(selectedItem?.descuento ?? false ? .subheadline : .title)
                                        .fontWeight(selectedItem?.descuento ?? false ? .none : .heavy)
                                    
                                }
                                .padding(.horizontal)
                                .padding(.vertical)
                                
                                if selectedItem?.descuento ?? false {
                                    HStack {
                                        Label("Promoción", systemImage: "tag.fill")
                                            .foregroundStyle(.white)
                                            .fontWeight(.heavy)
                                            .padding(5)
                                            .background {
                                                RoundedRectangle(cornerRadius: 5)
                                                    .fill(.green)
                                            }
                                        
                                        Spacer()
                                        Text("$" + formatNumber(Int(selectedItem?.precioFinal ?? 0)))
                                            .fontWeight(.heavy)
                                            .font(.title)
                                        
                                    }
                                    .padding(.horizontal)
                                    .padding(.bottom, -3)
                                    
                                }
                                
                                if selectedItem?.disponibleCredito ?? false {
                                    
                                    HStack {
                                        Label("Disponible con crédito", systemImage: "checkmark.seal.fill")
                                            .foregroundStyle(.white)
                                            .fontWeight(.heavy)
                                            .padding(5)
                                            .background {
                                                RoundedRectangle(cornerRadius: 5)
                                                    .fill(.orange)
                                        }
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                }
                                
                                Divider()
                                
                                HStack {
                                    Text("Pago semanal principal")
                                        .font(.title3)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing) {
                                        Text("$" + formatNumber(Int(selectedItem?.pagoSemanalPrincipal ?? 0)))
                                            .fontWeight(.bold)
                                            .font(.title3)
                                        Text("\(selectedItem?.plazoPrincipal ?? 0)" + " semanas")
                                            .fontWeight(.light)
                                            .opacity(0.6)
                                    }
                                    
                                    
                                }
                                .padding()
                                
                                
                            }
                            .background(.white)
                            .padding(.top, 30)
                            
                            
                            
                            Spacer()
                            
                            
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        HStack {
                            
                        }
                        .frame(height: 50)
                    }
                    .background(.gray.opacity(0.1))
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            
                            NavigationLink {
                                ItemsListView(selectedItem: $selectedItem)
                            } label: {
                                Image(systemName: "mail.and.text.magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15))
                            }
                            .padding()
                        }
                    }
                    
                    
                }
            }
            
        } else {
            ZStack {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    Text("Ningún producto ha sido seleccionado")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink {
                        ItemsListView(selectedItem: $selectedItem)
                    } label: {
                        Label("Ver lista de productos", systemImage: "mail.and.text.magnifyingglass")
                            .padding()
                            .foregroundStyle(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.blue)
                            }
                    }
                }
                .padding(40)
            }
        }
    }
    
    func formatNumber(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_US") // Use "en_US" or "es_ES" as needed
        
        formatter.minimumFractionDigits = 0 // No decimal places for Int
        formatter.maximumFractionDigits = 0 // No decimal places for Int
        
        if let formattedNumber = formatter.string(from: NSNumber(value: value)) {
            return formattedNumber
        } else {
            return "\(value)" // fallback
        }
    }
}

#Preview {
    //    ItemDetailsView(producto: .constant(Producto(id: "34004593", idLinea: 100, codigoCategoria: .c, idModalidad: 10, relevancia: 10, lineaCredito: "", pagoSemanalPrincipal: 10, plazoPrincipal: 10, disponibleCredito: false, abonosSemanales: .none, sku: "34004593", nombre: "Motocicleta de Trabajo Italika FT125TS Azul", urlImagenes: ["https://elektraqa.vteximg.com.br/arquivos/ids/1140557/34001913.jpg?v=637522930347430000"], precioRegular: 20443, precioFinal: 19999, porcentajeDescuento: 2.171892579367025, descuento: true, precioCredito: 17999, montoDescuento: 444)))
    
    ItemDetailsView(selectedItem: .constant(Producto(id: "3023051", idLinea: 5, codigoCategoria: .c, idModalidad: 21, relevancia: 10, lineaCredito: "", pagoSemanalPrincipal: 10, plazoPrincipal: 10, disponibleCredito: true, abonosSemanales: .none, sku: "34004593", nombre: "Motocicleta de Trabajo Italika FT125TS Azul", urlImagenes: ["https://elektraqa.vteximg.com.br/arquivos/ids/1140557/34001913.jpg?v=637522930347430000", "https://elektraqa.vteximg.com.br/arquivos/ids/1140557/34001913.jpg?v=637522930347430000", "https://elektraqa.vteximg.com.br/arquivos/ids/1140557/34001913.jpg?v=637522930347430000", "https://elektraqa.vteximg.com.br/arquivos/ids/1140557/34001913.jpg?v=637522930347430000"], precioRegular: 20443, precioFinal: 19999, porcentajeDescuento: 2.171892579367025, descuento: true, precioCredito: 17999, montoDescuento: 444)))
    
}
