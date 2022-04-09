//
//  API.swift
//  Weather
//
//  Created by nkstar on 2022/04/09.
//

import Moya

enum API {
    case getShortTermWeather(date: Int, time: Int, x: Int, y: Int)
}

extension API: TargetType {
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }

    var baseURL: URL {
        let weatherURL = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0"
        var url: String = ""
        
        switch self {
        case .getShortTermWeather:
            url = weatherURL
        }
        
        return URL(string: url)!
    }
    
    var path: String {
        switch self {
        case .getShortTermWeather:
            return "/getUltraSrtNcst"
        }
    }
    
    var method: Method {
        switch self {
        case .getShortTermWeather:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        let serviceKey = "0TyMx1Q8WW25XKmCzZvNSdPzBm48gqSw4nTP86UaiojpUbL5M/DWXF9qWTUXB4LMWzR29MIo8JLl5W5YR8jNRA=="
        switch self {
        case .getShortTermWeather(let date, let time, let x, let y):
            let params: [String : Any] = [
                "serviceKey" : serviceKey,
                "pageNo" : 1,
                "numOfRows" : 1000,
                "dataType" : "JSON",
                "base_date" : date,
                "base_time" : time,
                "nx" : x,
                "ny" : y
            ]
            
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
        
    }
}
