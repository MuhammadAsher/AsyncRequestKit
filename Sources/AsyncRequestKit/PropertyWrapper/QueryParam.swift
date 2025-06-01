//
//  QueryParam.swift
//  AsyncRequestKit
//
//  Created by Asher Azeem on 01/06/2025.
//

import Foundation

@propertyWrapper
public struct QueryParam<Value: LosslessStringConvertible> {
    public var wrappedValue: Value?
    public var key: String
    
    public init(wrappedValue: Value?, _ key: String) {
        self.wrappedValue = wrappedValue
        self.key = key
    }
    
    public var queryItem: URLQueryItem? {
        guard let value = wrappedValue else { return nil }
        return URLQueryItem(name: key, value: String(value))
    }
}
