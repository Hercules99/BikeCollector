//
//  ViewController.swift
//  BikeCollector
//
//  Created by Fredrik on 13.06.2017.
//  Copyright © 2017 Hercules. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var bikes : [Bike] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            bikes = try context.fetch(Bike.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
        
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bikes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let bike = bikes[indexPath.row]
        cell.textLabel?.text = bike.title
        cell.imageView?.image = UIImage(data: bike.image as! Data)
        return cell
    }

}

