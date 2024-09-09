//
//  ItemsListView.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import SwiftUI
import Shimmer

struct ItemsListView: View {
    @Environment (\.dismiss) var dismiss
    @State private var viewModel = ItemsListViewModel()
    @Binding var selectedItem: Producto?
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                
                if let productos = viewModel.productos {
                    ForEach(productos, id: \.id) { producto in
                        ItemRowListView(item: producto)
                        
                            .frame(height: 230)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .onTapGesture {
                                selectedItem = producto
                                dismiss()
                            }
                    }
                }
                else {
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
