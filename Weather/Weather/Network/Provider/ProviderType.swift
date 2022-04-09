//
//  ProviderType.swift
//  Weather
//
//  Created by nkstar on 2022/04/09.
//

import Moya
import RxSwift

public protocol ProviderType: AnyObject {
    associatedtype T: TargetType
    
    var provider: MoyaProvider<T> { get set }
    init(plugins: [PluginType])
}

public extension ProviderType {
    
    static func consProvider(_ plugins: [PluginType]) -> MoyaProvider<T> {
        return MoyaProvider<T>(
            endpointClosure: { (target: T) -> Endpoint in
                MoyaProvider<T>.defaultEndpointMapping(for: target).adding(newHTTPHeaderFields: target.headers!)
            },
            plugins: plugins
        )
    }
    
}
