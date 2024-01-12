//
//  ApiService.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation
import Alamofire

class WeatherApiService {
    
    private let baseUrl = "http://api.openweathermap.org"
    private let applicationKey = "ef4301248bc32d17ddbdefee5fd5b72b"
    private let applicationId = "appid"
    
    
    func request(
        _ url: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default
    ) throws -> Data {
        let headers = HTTPHeaders([
            HTTPHeader(name: applicationId, value: applicationKey)
        ])
        let result = AF.request(
            baseUrl + url,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        )
        if result.response?.statusCode == 200 {
            if let data = result.data {
                return data
            }
        }
        throw CustomErrors.fetchDataRemouteError
    }
}
