//
//  HeaderParam.swift
//  AsyncRequestKit
//
//  Created by Asher Azeem on 01/06/2025.
//

import Foundation

@propertyWrapper
public struct HeaderParam {
    public let wrappedValue: String
    public let key: String

    public init(wrappedValue: String, _ key: String) {
        self.wrappedValue = wrappedValue
        self.key = key
    }
}
