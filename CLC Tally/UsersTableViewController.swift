//
//  UsersTableViewController.swift
//  CLC Tally
//
//  Created by Illya Starikov on 2/23/17.
//  Copyright © 2017 Illya Starikov. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var userCount: UILabel!
    @IBOutlet weak var time: UILabel!
}

class UsersTableViewController: UITableViewController {
    public var users = [(Int, Int, Int)]()
    
    private var hourCounts: [Int: Int] {
        var hours = [Int: Int]()
        
        for (hour, _, _) in users {
            hours[hour] = (hours[hour] ?? 0) + 1
        }
        
        return hours
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hourCounts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! UserTableViewCell
        
        let row = indexPath.row
        let hour = Array(hourCounts.keys).reversed()[row]
        
        cell.userCount.text = String("Number of Users: \(hourCounts[hour]!)")
        cell.time.text = String("At Hour: \(hour)")

        return cell
    }

    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
