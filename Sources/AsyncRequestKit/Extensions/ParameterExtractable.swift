//
//  ParameterExtractable.swift
//  AsyncRequestKit
//
//  Created by Asher Azeem on 01/06/2025.
//

import Foundation

public protocol ParameterExtractable {}

public extension ParameterExtractable {
    var queryItems: [URLQueryItem] {
        Mirror(reflecting: self).children.compactMap { child in
            (child.value as? QueryParamRepresentable)?.queryItem
        }
    }

    var headers: [String: String] {
        Dictionary(uniqueKeysWithValues:
            Mirror(reflecting: self).children.compactMap { child in
                (child.value as? HeaderParamRepresentable)?.header
            }
        )
    }

    var bodyData: Data? {
        Mirror(reflecting: self).children.compactMap {
            ($0.value as? any BodyParamRepresentable)?.jsonData
        }.first
    }
}

protocol QueryParamRepresentable {
    var queryItem: URLQueryItem? { get }
}

protocol HeaderParamRepresentable {
    var header: (String, String)? { get }
}

protocol BodyParamRepresentable {
    var jsonData: Data? { get }
}

extension QueryParam: QueryParamRepresentable {}
extension HeaderParam: HeaderParamRepresentable {}
extension BodyParam: BodyParamRepresentable {}
