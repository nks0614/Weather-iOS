//
//  MainReactor.swift
//  Weather
//
//  Created by nkstar on 2022/04/09.
//

import Foundation
import ReactorKit

class MainReactor: Reactor {
    
    let service = APIService.shared
    
    enum Action {
        case getShortTermWeather(Int, Int, Int, Int)
    }
    
    enum Mutation {
        case getShortTermWeather(WeatherResponse<UltraSrtNcst>)
        case setIsLoading(Bool)
        case setError(Error)
    }
    
    struct State {
        var shortTermWeather: WeatherResponse<UltraSrtNcst>?
        var isLoading: Bool
        var error: Error?
    }
    
    let initialState: State
    
    init() {
        self.initialState = State(
            shortTermWeather: nil,
            isLoading: false,
            error: nil
        )
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .getShortTermWeather(let date, let time, let x, let y):
            return .concat([
                .just(Mutation.setIsLoading(true)),
                service.getShortTermWeather(date: date, time: time, x: x, y: y)
                    .asObservable()
                    .map { Mutation.getShortTermWeather($0) },
                .just(Mutation.setIsLoading(false))
            ]).catch { .just(Mutation.setError($0)) }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        state.error = nil
        
        switch mutation {
        case .getShortTermWeather(let shortTermWeather):
            state.shortTermWeather = shortTermWeather
        case .setIsLoading(let isLoading):
            state.isLoading = isLoading
        case .setError(let error):
            state.error = error
        }
        
        return state
    }
    
    
}
