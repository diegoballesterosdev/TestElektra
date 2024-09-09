//
//  ItemsListViewModel.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation
import SwiftUI

/// `ItemsListViewModel` es una clase observable que actúa como el ViewModel
/// para manejar la lógica de negocio relacionada con la obtención de datos
/// de `ItemsList`.
///
/// Al ser `final`, la clase no puede ser heredada.
/// Utiliza la anotación `@Observable` para habilitar la reactividad en las vistas de SwiftUI que dependen de este ViewModel.

@Observable
final class ItemsListViewModel {
    
    var itemsList: ItemsList? //Variable que almacena los datos obtenidos de la API, conformados por un objeto `ItemsList`.
    var productos: [Producto]? //Array opcional que almacena los productos obtenidos a través del campo `resultado` de la respuesta.
    
    func getItemsList() async {
        do {
            /// `getItemsList()` es una función asíncrona que se encarga de obtener los
            /// datos desde un servicio web y actualiza las propiedades correspondientes.
            /// Utiliza `async` para permitir su ejecución concurrente.
            /// En caso de éxito, asigna los datos obtenidos a `itemsList` y actualiza
            /// la lista de `productos` dentro de una animación.
            /// En caso de error, imprime el mensaje de error en la consola.
            let itemsList = try await WebService.getItemsListData() // Se realiza la llamada al servicio web para obtener los datos.
            self.itemsList = itemsList // Actualiza la propiedad `itemsList` con los datos obtenidos.
            withAnimation {
                productos = itemsList.resultado?.productos // Actualiza la lista de productos con animación.
            }
            print(itemsList)
        } catch(let error) {
            print(error.localizedDescription)
        }
        
    }
}
