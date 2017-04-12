//
//  ViewController.swift
//  MVVMUITableViewCell
//
//  Created by Eric Giannini on 4/7/17.
//  Copyright © 2017 Unicorn Mobile, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableData = [Contact]()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ContactCell.self, forCellReuseIdentifier: ContactCell.cellIdentifier)
        
        // Do any additional setup after loading the view, typically from a nib
        
        tableView.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height)
        
        view.addSubview(tableView)
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        loadInitialData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    func loadInitialData() {
        
        for index in 1...200 {
            
            let contact = Contact(name: "Name \(index)", number: "Number \(index)", information: "Information \(index)")
            
            tableData.append(contact)
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        guard let cell: ContactCell = tableView.dequeueReusableCell(withIdentifier: ContactCell.cellIdentifier, for: indexPath) as? ContactCell else {
            let cell = ContactCell(style: .default, reuseIdentifier: ContactCell.cellIdentifier)
            return cell
        }
        
        let contact = tableData[indexPath.row]
        
        cell.contact = contact
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
}
