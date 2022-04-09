//
//  APIType.swift
//  Weather
//
//  Created by nkstar on 2022/04/06.
//

import RxSwift

protocol APIType {
    func getShortTermWeather(date: Int, time: Int, x: Int, y: Int) -> Single<WeatherResponse<UltraSrtNcst>>
}
