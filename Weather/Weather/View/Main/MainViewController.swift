//
//  MainViewController.swift
//  Weather
//
//  Created by nkstar on 2022/04/06.
//

import UIKit
import RxSwift
import ReactorKit

class MainViewController: UIViewController {
    
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.reactor = MainReactor()
        
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let date: Int = Int(dateFormatter.string(from: nowDate))!
        dateFormatter.dateFormat = "HHmm"
        let time: Int = Int(dateFormatter.string(from: nowDate))!
        
        self.reactor?.action.onNext(.getShortTermWeather(date, getValidTime(time: time), 60, 125))
    }
    
    func getValidTime(time: Int) -> Int {
        var time = time
        let min = time % 100

        if min > 30 {
            time -= time % 100
        }
        else {
            time -= 70 + time % 100
        }
        
        return time
    }
}

extension MainViewController: ReactorKit.View {
    func bind(reactor: MainReactor) {
        reactor.state.map { $0.shortTermWeather }
            .filter { $0 != nil }
            .map { $0! }
            .subscribe(onNext: { [weak self] data in
                guard let self = self else { return }
                print(data.response.body)
            })
            .disposed(by: disposeBag)
    }
}
