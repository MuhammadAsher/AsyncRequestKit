//
//  AsyncRequest+Execute.swift
//  AsyncRequestKit
//
//  Created by Asher Azeem on 01/06/2025.
//

import Foundation
import Combine

public extension AsyncRequest {
    
    func execute() async throws -> Response {
        try await RequestExecutor.execute(self)
    }
    
    func combineExecute() -> AnyPublisher<Response, Error> {
        CombineRequestExecutor.execute(self)
    }
}
