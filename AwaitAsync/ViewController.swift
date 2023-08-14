//
//  ViewController.swift
//  AwaitAsync
//
//  Created by ByungHoon Ann on 2023/08/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetch()
    }

    func fetch() {
        Task {
            do {
                let dataString = try await requestFetch()
                print(dataString)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func requestFetch() async throws -> String {
        print(Thread.isMainThread) // false
        let dataString = try await NetworkManager.shared.fetchData()
        return dataString
    }
}

