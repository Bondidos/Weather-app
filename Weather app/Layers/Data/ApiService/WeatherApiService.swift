//
//  ApiService.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation
import Alamofire

protocol WeatherApiService {
    func request(_ url: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders?) -> DataRequest
}

class ApiServiceImpl: WeatherApiService {
    
    private let baseUrl = "http://api.openweathermap.org"

    func request(
        _ url: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil
    ) -> DataRequest {
        return AF.request(
            baseUrl + url,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        )
    }
}
