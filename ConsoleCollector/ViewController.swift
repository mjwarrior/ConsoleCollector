//
//  ViewController.swift
//  ConsoleCollector
//
//  Created by Marc Streeter on 3/23/17.
//  Copyright © 2017 Developer Warriors. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var consoles : [GameConsole] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        
     do {
        consoles = try context.fetch(GameConsole.fetchRequest())
     tableView.reloadData()
     } catch {
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return consoles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = UITableViewCell()
     let console = consoles[indexPath.row]
     cell.textLabel?.text = console.title
        cell.imageView?.image = UIImage(data: console.image as! Data)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let console = consoles[indexPath.row]
     performSegue(withIdentifier: "consoleSegue", sender: console)
    
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! ConsoleViewController
        nextVC.console = sender as? GameConsole
    }
    
    
    
}

