//
//  ViewController.swift
//  AutoLayoutSample
//
//  Created by Takahiro Kato on 2019/04/07.
//  Copyright © 2019 Takahiro Kato. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

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

        tableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath)
        
        if let customCell = cell as? CustomTableViewCell {
            customCell.titleLabel.text = labels[indexPath.row]
            customCell.goodLabel.text = subLabels[indexPath.row]
            
            return customCell
        }
        
        return cell
    }
}
