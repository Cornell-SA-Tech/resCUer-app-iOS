//
//  MainGuideViewController.swift
//  ResCUer
//
//  Created by Raymone Radi  on 12/3/16.
//  Copyright © 2016 Raymone Radi . All rights reserved.
//

import UIKit

class GuideSection
    
{
    
    var title: String
    var text: String
    
    init(title: String, text: String)
    {
        self.title = title
        self.text = text
    }
    
}



class MainGuideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    let topics = ["Active Shooter", "Animal Incidents", "Bomb Threat", "Building Evacuation", "Crime", "Earthquake", "Elevator Emergency",
                  "Facility or Utility Problem", "Fire, Smoke, Explosion", "Hazardous Materials", "Medical/Health Emergency", "Severe Weather",
                  "Suspicious Mail or Package", "Workplace Violence"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .white
        
        
        self.navigationItem.title = "Emergency Guide"
                
        tableView = UITableView(frame: view.frame)
        //tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.register(BookTableViewCell.self, forCellReuseIdentifier: bookCellReuseIdentifier)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.addSubview(tableView)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Reuse")
        cell.textLabel?.text = topics[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let guideDetailViewController = ViewController()
        guideDetailViewController.library = GuideText(indexPath.row).value
        
        let backButton = UIBarButtonItem(title: "Guide", style:.plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        
        navigationController?.pushViewController(guideDetailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
