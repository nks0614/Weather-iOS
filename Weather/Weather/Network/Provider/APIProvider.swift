//
//  APIProvider.swift
//  Weather
//
//  Created by nkstar on 2022/04/09.
//

import Moya
import RxSwift

class APIProivder: ProviderType {
    typealias T = API
    var provider: MoyaProvider<API>
    
    required init(plugins: [PluginType]) {
        provider = Self.consProvider(plugins)
    }
    
    private func request<D: Decodable>(type: D.Type, target: T) -> Single<D> {
        return provider.rx.request(target)
            .map(type)
    }
    
    private func request(target: T) -> Single<Void> {
        return provider.rx.request(target)
            .map { _ in Void() }
    }
    
}

extension APIProivder: APIType {
    func getShortTermWeather(date: Int, time: Int, x: Int, y: Int) -> Single<WeatherResponse<UltraSrtNcst>> {
        return request(type: WeatherResponse<UltraSrtNcst>.self, target: .getShortTermWeather(date: date, time: time, x: x, y: y))
    }
}
