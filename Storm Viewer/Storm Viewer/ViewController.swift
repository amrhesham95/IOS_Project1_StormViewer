//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Amr Hesham on 12/17/19.
//  Copyright © 2019 Amr Hesham. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        //this line will make the title bigger and will shrink when we scroll down
        //according to apple guidlines this should be done in the first screen only so we have to disable it in the details screen
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        let fm=FileManager.default
        let path=Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        pictures = pictures.sorted()
        print(pictures)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController =  self.storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailedViewController{
            detailViewController.selectedImage = pictures[indexPath.row]
            detailViewController.totalNumbers = pictures.count
            detailViewController.selectedNumber = indexPath.row + 1
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
        
    }
}

