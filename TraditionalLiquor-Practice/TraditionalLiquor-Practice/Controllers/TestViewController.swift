//
//  TestViewController.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2023/01/18.
//

import UIKit

class TestViewController: UIViewController {
    
    var tableView: UITableView = UITableView()
    
    var itemArray: [String] = ["얼떨결에", "이화백주", "도구막걸리", "동해동동주"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setUp()
        setupDatas()
    }
    
    func setupTableView() {
        tableView.register(TestTableViewCell.self.self, forCellReuseIdentifier: TestTableViewCell.identifier)
        tableView.rowHeight = 230
        tableView.dataSource = self
    }
    
    func setUp() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setupDatas() {
        itemArray.forEach {
            NetworkManager.shared.fetchImage(title: $0, display: 1) { results in
                print(results)
            }
        }
    }
}

extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.identifier, for: indexPath) as? TestTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}
