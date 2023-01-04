//
//  ViewController.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2022/12/30.
//

import UIKit

class ViewController: UIViewController {
    
    
    var liquorData: [TraditionalLiquor]!
    private let tableView: UITableView = UITableView()
    private let searchBar: UISearchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPath()
        setLayout()
        setBasics()
        setNavigation()
        setSearchController()
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
    
    private func setNavigation() {
        self.title = "전통주🍹"
        self.navigationItem.searchController = searchBar
    }
    
    private func setSearchController() {
        self.searchBar.searchBar.placeholder = "전통주를 검색하세요"
        self.searchBar.automaticallyShowsCancelButton = true
        self.searchBar.obscuresBackgroundDuringPresentation = true
        self.searchBar.hidesNavigationBarDuringPresentation = false
        self.searchBar.searchResultsUpdater = self
    }
}

//MARK: - SearchController Delegate
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
        print(searchController.searchBar.text)
//        print(searchSuggestion)
    }
    
}

//MARK: -Delegate, Data Source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return liquorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LiquorTableViewCell.identifier, for: indexPath) as? LiquorTableViewCell else { return UITableViewCell() }
        cell.title.text = liquorData[indexPath.item].liquorName
        cell.alcohol.text = String(liquorData[indexPath.item].percentageOfAlcohol)
        cell.volume.text = liquorData[indexPath.item].volume
        cell.manufacturer.text = liquorData[indexPath.item].manufacturer
        cell.mainIngredient.text = liquorData[indexPath.item].mainIngredient
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
