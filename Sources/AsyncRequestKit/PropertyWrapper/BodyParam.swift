//
//  BodyParam.swift
//  AsyncRequestKit
//
//  Created by Asher Azeem on 01/06/2025.
//

import Foundation

@propertyWrapper
public struct BodyParam<Value: Encodable> {
    public var wrappedValue: Value

    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }

    public var jsonData: Data? {
        try? JSONEncoder().encode(wrappedValue)
    }
}

