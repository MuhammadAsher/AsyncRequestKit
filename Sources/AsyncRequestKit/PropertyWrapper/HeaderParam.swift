//
//  HeaderParam.swift
//  AsyncRequestKit
//
//  Created by Asher Azeem on 01/06/2025.
//

import Foundation

@propertyWrapper
public struct HeaderParam {
    public var wrappedValue: String?
    public var key: String

    public init(wrappedValue: String?, _ key: String) {
        self.wrappedValue = wrappedValue
        self.key = key
    }

    public var header: (String, String)? {
        guard let value = wrappedValue else { return nil }
        return (key, value)
    }
}
