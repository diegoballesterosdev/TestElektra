//
//  ItemsListViewModel.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation
import SwiftUI

@Observable
final class ItemsListViewModel {
    
    var itemsList: ItemsList?
    var productos: [Producto]?
    
    func getItemsList() async {
        do {
            
            let itemsList = try await WebService.getItemsListData()
            self.itemsList = itemsList
            withAnimation {
                productos = itemsList.resultado?.productos
            }
            print(itemsList)
        } catch(let error) {
            print(error.localizedDescription)
        }
        
    }
}
