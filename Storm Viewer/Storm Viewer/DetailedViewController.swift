//
//  DetailedViewController.swift
//  Storm Viewer
//
//  Created by Amr Hesham on 12/17/19.
//  Copyright © 2019 Amr Hesham. All rights reserved.
//

import Foundation
import UIKit
class DetailedViewController:UIViewController  {
    @IBOutlet var imageView: UIImageView!
    var selectedImage:String?
    var totalNumbers = 0
    var selectedNumber = 0
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        //this line disable the large title 
        navigationItem.largeTitleDisplayMode = .never
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
            title = "\(selectedNumber) / \(totalNumbers)"
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
  
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        //this line is just for ipad because ipad need to connect the popped over view to whatever presented it ..i guess because they show extra content from the prev screen or something and it has no effect on iphones
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
