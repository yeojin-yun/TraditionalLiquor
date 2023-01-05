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
    private let searchController: UISearchController = UISearchController(searchResultsController: nil)
    private var filterdLiquorList: [TraditionalLiquor] = []
    private var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    private var isFiltering: Bool {
        return !isSearchBarEmpty && searchController.isActive
    }
    
    
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
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setSearchController() {
        self.searchController.searchBar.placeholder = "전통주를 검색하세요"
        self.searchController.automaticallyShowsCancelButton = true
//        self.searchController.obscuresBackgroundDuringPresentation = true
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchResultsUpdater = self
    }
}

//MARK: - SearchController Delegate
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text)
        
        filterdLiquorList = liquorData.filter({ liquor in
            return liquor.liquorName.contains(searchController.searchBar.text ?? "")
        })
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController, selecting searchSuggestion: UISearchSuggestion) {
        print(searchSuggestion.localizedDescription)
    }
    
}

//MARK: -Delegate, Data Source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filterdLiquorList.count
        }
        return liquorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let liquor: TraditionalLiquor
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LiquorTableViewCell.identifier, for: indexPath) as? LiquorTableViewCell else { return UITableViewCell() }
        if isFiltering {
            liquor = filterdLiquorList[indexPath.row]
        } else {
            liquor = liquorData[indexPath.row]
        }
        cell.title.text = liquor.liquorName
        cell.alcohol.text = String(liquor.percentageOfAlcohol)
        cell.volume.text = liquor.volume
        cell.manufacturer.text = liquor.manufacturer
        cell.mainIngredient.text = liquor.mainIngredient

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            print(filterdLiquorList[indexPath.row])
        } else {
            print(liquorData[indexPath.row])
        }
    }
    
}
