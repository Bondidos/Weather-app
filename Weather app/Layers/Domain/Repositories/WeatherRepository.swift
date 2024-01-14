//
//  WeatherRepository.swift
//  Weather app
//
//  Created by Vladimir on 11.01.24.
//

import Foundation
import RxSwift

protocol WeatherRepository {
    func fetchCurrentWeatherInLocation() throws -> Observable<CurrentWeather>
    func fetchHourlyWeatherForecast() throws -> Observable<WeatherForecast>
    func fetchCurrentWeatherByLatLng(latLng: LatLng) -> Observable<CurrentWeather>
}
