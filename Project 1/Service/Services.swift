//
//  Services.swift
//  Project 1
//
//  Created by Igor de Castro on 14/10/24.
//

import Foundation

protocol ServiceProtocol {
    func getData(url: String, completion: @escaping (Result<Search, Error>) -> Void)
}

final class Service: ServiceProtocol {
    let endpoint: ApiManager
    let urlSession: URLSession
    
    init(
        endpoint: ApiManager,
        urlSession: URLSession = URLSession.shared
    ) {
        self.endpoint = endpoint
        self.urlSession = urlSession
    }
    
    func getData(url: String, completion: @escaping (Result<Search, any Error>) -> Void) {
        let fullURL = url + endpoint.apiKey
        guard let url = URL(string: fullURL) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = endpoint.body
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            // Verificar se houve algum erro
            if let error = error {
                completion(.failure(error))
                return
            }

            // Verificar se há dados
            guard let data = data else {
                let noDataError = NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "Nenhum dado recebido"])
                completion(.failure(noDataError))
                return
            }
            // Verifica se o response não veio False
            if let dataString = String(data: data, encoding: .utf8),
               dataString.contains("False")
            {
                let noResponseError = NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "Response without data"])
                completion(.failure(noResponseError))
                return
            }
            // Realiza decode para transforma no tipo Search
            // e depois Retornar os dados através da completion
            do {
                let decode = try JSONDecoder().decode(Search.self, from: data)
                completion(.success(decode))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
