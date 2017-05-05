//
//  ViewController.swift
//  Student02052017
//
//  Created by AlexanderYakovenko on 5/2/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CountSendDelegate {
    
    
    

    @IBOutlet weak var countOfStudents: UILabel!
    
    
    func userAdd(count: Int) {
        
        countOfStudents.text = String(count)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goToList(_ sender: Any) {
      
        let listStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let listVC: ListViewController = listStoryboard.instantiateViewController(withIdentifier: "listView") as! ListViewController
        self.present(listVC, animated: true, completion: nil)
        
    }

    @IBAction func goToAddStudent(_ sender: Any) {
       
        let addStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC: AddViewController = addStoryboard.instantiateViewController(withIdentifier: "addView") as! AddViewController
        self.present(addVC, animated: true, completion: nil)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendingVC: AddViewController = segue.destination as! AddViewController
        sendingVC.delegate = self
    }
    
    
    
        
    
}

