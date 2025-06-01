//
//  QueryParam.swift
//  AsyncRequestKit
//
//  Created by Asher Azeem on 01/06/2025.
//

import Foundation

@propertyWrapper
public struct QueryParam<T: LosslessStringConvertible> {
    public let wrappedValue: T
    public let key: String

    public init(wrappedValue: T, _ key: String) {
        self.wrappedValue = wrappedValue
        self.key = key
    }
}
