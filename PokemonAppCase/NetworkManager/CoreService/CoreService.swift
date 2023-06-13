//
//  CoreService.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import Foundation
import Alamofire

protocol CoreServiceProtokol: AnyObject {
    func makeRequest<T: Decodable>(endPoint: HTTPEndpoint, completion: @escaping (Result<T, CustomError>) -> Void)
}

final class CoreService: CoreServiceProtokol {
    func makeRequest<T>(endPoint: HTTPEndpoint, completion: @escaping (Result<T, CustomError>) -> Void) where T : Decodable {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.path
        urlComponents.queryItems = endPoint.query
        
        guard let url = urlComponents.url else {
            return completion(.failure(.invalidURL))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method.rawValue
        
        AF.request(urlRequest).validate(statusCode: 200..<300).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(_ ):
                completion(.failure(.unableToParseFromJSON))
            }
        }
    }
}
