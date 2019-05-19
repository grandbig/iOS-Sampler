//
//  ViewController.swift
//  AnimationSample
//
//  Created by Takahiro Kato on 2019/05/19.
//  Copyright © 2019 Takahiro Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animate(withDuration: 1.0, animations: {
            self.redView.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 2.0, animations: {
                self.blueView.isHidden = false
                self.blueView.alpha = 1
            })
        }
    }
}

