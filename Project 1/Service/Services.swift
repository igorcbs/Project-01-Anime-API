//
//  Services.swift
//  Project 1
//
//  Created by Igor de Castro on 14/10/24.
//

import Foundation

protocol ServiceProtocol {
    func getData(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}

final class Service: ServiceProtocol {
    let endpoint: ApiManager
    
    init(endpoint: ApiManager) {
        self.endpoint = endpoint
    }
    
    func getData(url: String, completion: @escaping (Result<Data, any Error>) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            // Verificar se houve algum erro
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Verificar se a resposta é válida
            //            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            //                let statusCodeError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Resposta inválida do servidor"])
            //                completion(.failure(statusCodeError))
            //                return
            //            }
            
            // Verificar se há dados
            guard let data = data else {
                let noDataError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Nenhum dado recebido"])
                completion(.failure(noDataError))
                return
            }
            
            // Retornar os dados através da completion
            completion(.success(data))
        }
        task.resume()
    }
}
