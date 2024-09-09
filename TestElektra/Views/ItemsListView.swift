//
//  ItemsListView.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import SwiftUI
import Shimmer

/// `ItemsListView` es una vista que muestra una lista de productos obtenidos
/// desde el ViewModel `ItemsListViewModel`. La lista se presenta de manera
/// lazy utilizando `LazyVStack`, lo que permite una carga eficiente de
/// los productos.
struct ItemsListView: View {
    @Environment (\.dismiss) var dismiss ///`dismiss` es una función de entorno que permite descartar la vista actual, volviendo a la vista anterior.
    @State private var viewModel = ItemsListViewModel() /// `viewModel` es el ViewModel utilizado para manejar la lógica de obtención y presentación de los productos.
    @Binding var selectedItem: Producto? /// `selectedItem` es un binding que permite seleccionar un producto de la lista. Este valor se pasa desde la vista contenedora.
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                // Verifica si hay productos disponibles en el ViewModel.
                if let productos = viewModel.productos {
                    // Itera sobre los productos y muestra cada uno en `ItemRowListView`.
                    ForEach(productos, id: \.id) { producto in
                        ItemRowListView(item: producto)
                        
                            .frame(height: 230)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .onTapGesture {
                                // Asigna el producto seleccionado y cierra la vista.
                                selectedItem = producto
                                dismiss()
                            }
                    }
                }
                else {
                    // Muestra un efecto shimmer si no hay productos disponibles.
                    // Repite la misma vista simulada varias veces para crear un efecto de carga.
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 230)
                        .shimmering()
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .opacity(0.2)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 230)
                        .shimmering()
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .opacity(0.2)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 230)
                        .shimmering()
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .opacity(0.2)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 230)
                        .shimmering()
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .opacity(0.2)
                }
            }
            .navigationTitle("Productos")
            
            .onAppear {
                // Llama a la función para obtener los productos al aparecer la vista.
                Task {
                    await viewModel.getItemsList()
                }
            }
            
        }
        .background(.gray.opacity(0.1))
    }
}

#Preview {
    ItemsListView(selectedItem: .constant(.none))
}
