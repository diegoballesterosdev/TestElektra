//
//  ContentView.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedItem: Producto?
    var body: some View {
        NavigationStack {
            ItemDetailsView(selectedItem: $selectedItem)
        }
    }
}

#Preview {
    ContentView()
}
