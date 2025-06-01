//
//  Untitled.swift
//  AsyncRequestKit
//
//  Created by Asher Azeem on 01/06/2025.
//


import Foundation
import Combine

public struct CombineRequestExecutor {
    public static func execute<R: AsyncRequest>(_ request: R) -> AnyPublisher<R.Response, Error> {
        var urlComponents = URLComponents(url: request.baseURL.appendingPathComponent(request.path), resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = request.queryItems

        guard let finalURL = urlComponents?.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .tryMap { try request.decode($0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
