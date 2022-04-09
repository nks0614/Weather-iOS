//
//  APIService.swift
//  Weather
//
//  Created by nkstar on 2022/04/09.
//

import RxSwift

class APIService {
    static let shared = APIService()
    
    private let provider: APIType = APIProivder(plugins: [RequestLogginPlugin()])
    
    func getShortTermWeather(date: Int, time: Int, x: Int, y: Int) -> Single<WeatherResponse<UltraSrtNcst>> {
        return provider.getShortTermWeather(date: date, time: time, x: x, y: y)
    }
}
