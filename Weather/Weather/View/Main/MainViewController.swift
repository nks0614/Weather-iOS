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
        // Do any additional setup after loading the view.
        
        var date = Date()
        
        
        self.reactor?.action.onNext(.getShortTermWeather(<#T##Int#>, <#T##Int#>, <#T##Int#>, <#T##Int#>))
    }
}

extension MainViewController: ReactorKit.View {
    func bind(reactor: MainReactor) {
        
    }
}
