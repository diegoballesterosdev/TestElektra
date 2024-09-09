//
//  WebService.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation
/// Clase responsable de realizar solicitudes a la API para obtener datos de la lista de ítems.
final class WebService {
    
    /// Función asíncrona que realiza una solicitud para obtener datos de la lista de ítems.
    static func getItemsListData() async throws -> ItemsList {
        // URL del servicio web que proporciona los datos de los ítems.
        let urlString = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/apps/moviles/caso-practico/plp" 
        
        // Se intenta crear un objeto URL a partir de la cadena de URL. Si falla, se lanza un error.
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidURL
        }
        // Se realiza la solicitud de datos de manera asíncrona utilizando URLSession.
        let (data, response) = try await URLSession.shared.data(from: url)
       
        // Se valida la respuesta para asegurarse de que es un código de estado 200 (OK).
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }
        
        // Se intenta decodificar los datos obtenidos en un objeto `ItemsList`.
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ItemsList.self, from: data)
        } catch {
            throw ErrorCases.invalidData
        }
    }
}
