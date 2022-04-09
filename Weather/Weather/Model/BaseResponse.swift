//
//  BaseResponse.swift
//  Weather
//
//  Created by nkstar on 2022/04/06.
//

import Foundation

struct WeatherResponse<T: Codable>: Codable {
    let response: BaseResponse<T>
}

struct BaseResponse<T: Codable>: Codable {
    let header: WeatherHeader
    let body: T
}

struct WeatherHeader: Codable {
    let resultCode: String
    let resultMsg: String
}



