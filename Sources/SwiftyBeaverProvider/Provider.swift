//
//  Provider.swift
//  SwiftyBeaverProvider
//

import Service
import Vapor
import Foundation

public final class SwiftyBeaverProvider: Provider {
    /// See Provider.repositoryName
    public static let repositoryName = "swiftybeaver-provider"

    let destinations: [DestinationConfig]
    
    /// Create a new Local provider
    public init(destinations arr: [DestinationConfig]) throws {
        destinations = arr
    }

    /// See Provider.register
    public func register(_ services: inout Services) throws {
        services.register(Logger.self) { container -> SwiftyBeaverLogger in
            return try SwiftyBeaverLogger(configs: self.destinations)
        }
    }

    /// See Provider.boot
    public func didBoot(_ container: Container) throws -> Future<Void> {
        return .done(on: container)
    }
}
