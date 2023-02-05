//
//  RecordSearchViewController.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2023/02/05.
//

import UIKit

class RecordSearchViewController: UIViewController {
    
    private let searchBar: UISearchBar = UISearchBar()
    private let tableView: UITableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
}

extension RecordSearchViewController: UISearchBarDelegate {
    
}

extension RecordSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
//MARK: -UI
extension RecordSearchViewController {
    final private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    

    final private func setConstraints() {
        [searchBar, tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    final private func setAttributes() {
        tableView.dataSource = self
    }
    
    private func setSearchBar() {
        searchBar.placeholder = "전통주를 검색하세요."
        searchBar.delegate = self
    }
    
    final private func addTarget() {
        
    }
}
