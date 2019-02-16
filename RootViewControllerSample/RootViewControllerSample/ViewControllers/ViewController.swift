//
//  ViewController.swift
//  RootViewControllerSample
//
//  Created by Takahiro Kato on 2019/02/16.
//  Copyright © 2019 Takahiro Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Factory Methods
    static func make() -> ViewController{
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            as? ViewController else {
                fatalError("cannot get ViewController from Storyboard")
        }
        return viewController
    }
}

