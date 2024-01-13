//
//  ApiService.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift

class WeatherApiService {
    
    private let baseUrl = "http://api.openweathermap.org"
    private let applicationKey = "ef4301248bc32d17ddbdefee5fd5b72b"
    private let applicationId = "appid"
    
    func request(
        _ url: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default
    ) -> Observable<Any> {
        let headers = HTTPHeaders([
            HTTPHeader(name: applicationId, value: applicationKey)
        ])
        var params: Dictionary<String, Any> = [applicationId: applicationKey]
        parameters?.forEach({ (key: String, value: Any) in
            params[key] = value
        })
        
        
        return RxAlamofire.requestJSON(
            method,
            baseUrl + url,
            parameters: params,
            encoding: encoding,
            headers: headers
        )
        .debug()
        .map({ (response, json) in
            switch response.statusCode {
            case 200: return json
            default: throw CustomErrors.fetchDataRemouteError
            }
        }).observe(on: MainScheduler.instance)
    }
}
