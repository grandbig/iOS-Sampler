//
//  SplashViewController.swift
//  RootViewControllerSample
//
//  Created by Takahiro Kato on 2019/02/16.
//  Copyright © 2019 Takahiro Kato. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        judgeDestination()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Other Methods
    private func judgeDestination() {
        if UserDefaults.standard.bool(forKey: "isLogin") {
            AppDelegate.shared.routeViewController.route(from: self, destination: .main)
            return
        }
        AppDelegate.shared.routeViewController.route(from: self, destination: .login)
    }
}
