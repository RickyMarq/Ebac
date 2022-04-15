//
//  NetworkManager.swift
//  Exercício 14
//
//  Created by Henrique Marques on 13/04/22.
//

import Foundation

enum ResultNewsError: Error {
    case badURL, noData, invalidJSON
    
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    struct Constants {
        
        static let newsAPI = URL(string: "https://web-ebac.herokuapp.com/home")
    }
    
    private init() { }
    
    func getNews(completion: @escaping (Result<[ResultNews], ResultNewsError>) -> Void) {
        
        // Setup URL
        
        guard let url = Constants.newsAPI else {
            completion(.failure(.badURL))
            return
        }
        
        // Criar uma configuração
        
        let configuration = URLSessionConfiguration.default
                
        // Criar uma seção
        
        let session = URLSession(configuration: configuration)
        
        // Criar uma tarefa
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data =
                data else {
                completion(.failure(.invalidJSON))
                return
            }
                    
            do {
              let decoder = JSONDecoder()
              let result = try decoder.decode(ResponseElement.self, from: data)
              completion(.success(result.home.results))
            } catch {
              print("Error info: \(error.localizedDescription)")
                completion(.failure(.noData))
            }
        }
            task.resume()
    }
}
