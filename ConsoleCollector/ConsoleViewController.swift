//
//  ConsoleViewController.swift
//  ConsoleCollector
//
//  Created by Marc Streeter on 3/23/17.
//  Copyright © 2017 Developer Warriors. All rights reserved.
//

import UIKit

class ConsoleViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

   var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var titleTextField: UITextField!
   
    @IBOutlet weak var consoleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       imagePicker.delegate = self
     
    }

    @IBAction func photosTapped(_ sender: Any) {
    
    imagePicker.sourceType = .photoLibrary
        
    present(imagePicker, animated: true, completion: nil)
    
    }
  
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    
}
