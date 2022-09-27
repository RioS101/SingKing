//
//  Constants.swift
//  SingKing
//
//  Created by RS on 27.09.22.
//

import Foundation

class SimpleAPICaller {
    static func fetch<T: Codable>(from url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch {
                completion(.failure(APIError.invalidData))
            }
        }
        
        task.resume()
    }
}
