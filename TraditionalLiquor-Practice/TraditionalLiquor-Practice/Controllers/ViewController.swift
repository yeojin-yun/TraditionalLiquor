//
//  ViewController.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2022/12/30.
//

import UIKit

class ViewController: UIViewController {
    
    var liquorData: [TraditionalLiquor]?
    private let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPath()
        setLayout()
        setBasics()
    }


    func getPath() {
        guard let path = Bundle.main.path(forResource: "LiquorList", ofType: "json") else { return }
        
        guard let jsonString = try? String(contentsOfFile: path) else { return }
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)


        if let data = data, let liquor = try? decoder.decode([TraditionalLiquor].self, from: data) {
            liquorData = liquor
        }
    }
}

// MARK: -UI
extension ViewController {
    final private func setLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.frame
    }
    
    final private func setBasics() {
        //MARK: -Delegate, Data Source
        tableView.register(LiquorTableViewCell.self.self, forCellReuseIdentifier: LiquorTableViewCell.identifier)
        tableView.rowHeight = 230
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setConstraints() {
        
    }
    
}

//MARK: -Delegate, Data Source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LiquorTableViewCell.identifier, for: indexPath) as? UITableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
