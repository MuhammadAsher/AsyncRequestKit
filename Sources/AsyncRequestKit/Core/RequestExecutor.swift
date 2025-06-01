//
//  RequestExecutor.swift
//  AsyncRequestKit
//
//  Created by Asher Azeem on 01/06/2025.
//

import Foundation

public struct RequestExecutor {
    public static func execute<R: AsyncRequest>(_ request: R) async throws -> R.Response {
        var urlComponents = URLComponents(url: request.baseURL.appendingPathComponent(request.path), resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = request.queryItems

        guard let finalURL = urlComponents?.url else {
            throw URLError(.badURL)
        }

        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        return try request.decode(data)
    }
}
