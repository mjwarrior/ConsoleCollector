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
    var console : GameConsole? = nil
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var addupdatebutton: UIButton!
    
    @IBOutlet weak var titleTextField: UITextField!
   
    @IBOutlet weak var consoleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       imagePicker.delegate = self
     
        if console != nil {
        consoleImageView.image = UIImage(data: console!.image as! Data)
        titleTextField.text = console!.title
        
        addupdatebutton.setTitle("Update", for: .normal)
            
        } else {
          deleteButton.isHidden = true 
        }
    }

    @IBAction func photosTapped(_ sender: Any) {
    
    imagePicker.sourceType = .photoLibrary
        
    present(imagePicker, animated: true, completion: nil)
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    
    consoleImageView.image = image
        
    imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
  
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let console = GameConsole(context: context)
        console.title = titleTextField.text
        console.image =  UIImagePNGRepresentation(consoleImageView.image!) as NSData?
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
        navigationController!.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
