//
//  ViewController.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2022/12/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let jsonData = load(),
            let dictData = try? JSONDecoder().decode(TraditionalLiquor.self, from: jsonData) else { return }
        print(dictData)
    }

    func load() -> Data? {
        let name: String = "LiquorList"
        let extensionType = "json"
        
        guard let fileLocation = Bundle.main.url(forResource: name, withExtension: extensionType) else { return nil }
        
        do {
            let data = try Data(contentsOf: fileLocation)
            return data
        } catch {
            return nil
        }
    }
}

