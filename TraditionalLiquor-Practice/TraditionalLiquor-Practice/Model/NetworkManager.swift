//
//  NetworkManager.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2023/01/09.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    // 네트워킹 요청하는 함수 (음악데이터 가져오기)
    func fetchImage(title: String, display: Int, completion: @escaping (Result<[Item], NetworkError>) -> Void) {
        let baseURL = "https://openapi.naver.com/v1/search/encyc.json?query=\(title)&display=\(display)"
        
        guard let safeURL = baseURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }

        guard let url = URL(string: safeURL) else { return }

        performRequest(with: url) { result in
            completion(result)
        }
        
    }
    
    func performRequest(with urlString: URL, completion: @escaping (Result<[Item], NetworkError>) -> Void) {
        

        var request = URLRequest(url: urlString)
        
        request.httpMethod = "GET"
        request.setValue("TUWSiHEpK6xMQCi8Jqrq", forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue("1dLbA5yVLN", forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { data, response, error in
            if error != nil {
                print(error)
                completion(.failure(.networkingError))
            }
            
            guard let safeData = data else {
                completion(.failure(.dataError))
                return
            }
            
            if let results = self.parseJSON(safeData) {
//                print("parse 실행", results)
                completion(.success(results))
            } else {
//                print("parse 실패")
                completion(.failure(.parseError))
            }
        }.resume()
    }
    
    func parseJSON(_ resultData: Data) -> [Item]? {
        do {
            let results = try JSONDecoder().decode(Results.self, from: resultData)
//            print("parse결과", results.items, results.items.count)
            return results.items
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
