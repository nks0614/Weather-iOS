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

struct UltraSrtNcst: Codable {
    let dataType: String
    let items: UltraSrtNcstItems
    let pageNo: Int
    let numOfRows: Int
    let totalCount: Int
}

struct UltraSrtNcstItems: Codable {
    let item: [UltraSrtNcstItem]
}

//
//                        "baseDate": "20220407",
//                        "baseTime": "1900",
//                        "category": "PTY",
//                        "nx": 60,
//                        "ny": 125,
//                        "obsrValue": "0"

struct UltraSrtNcstItem: Codable {
    let baseDate: String
    let baseTime: String
    let category: String
    let nx: Int
    let ny: Int
    let obsrValue: String
}

