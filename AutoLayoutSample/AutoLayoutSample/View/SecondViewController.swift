//
//  SecondViewController.swift
//  AutoLayoutSample
//
//  Created by Takahiro Kato on 2019/04/07.
//  Copyright © 2019 Takahiro Kato. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private let labels = ["これはラベルです",
                          "短文",
                          "長文：あいうえおかきくけこさしすせそたちつてとなにぬねの"]
    private let subLabels = ["GOOD",
                             "GOOD",
                             "GOOD"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib.init(nibName: "SecondCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "secondCustomTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCustomTableViewCell", for: indexPath)
        
        if let customCell = cell as? SecondCustomTableViewCell {
            customCell.titleLabel.text = labels[indexPath.row]
            customCell.subTitleLabel.text = subLabels[indexPath.row]
            
            switch indexPath.row {
            case 0:
                customCell.hiddenStackView1()
            case 1:
                customCell.hiddenStackView2()
            default:
                break
            }
            
            return customCell
        }
        
        return cell
    }
}
