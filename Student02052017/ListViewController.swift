//
//  ListViewController.swift
//  Student02052017
//
//  Created by AlexanderYakovenko on 5/2/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var array = [Student]()
    //let student1 = Student()
    //let student2 = Student()
    var array2 = [Student]()
    
    @IBAction func goToFirst(_ sender: Any) {
        
        
        let firstStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let firstVC: ViewController = firstStoryboard.instantiateViewController(withIdentifier: "firstView") as! ViewController
        self.present(firstVC, animated: true, completion: nil)
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(array.count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.nameLabel.text = array[indexPath.row].name
        cell.surnameLabel.text = array[indexPath.row].surname
        cell.dateLabel.text = array[indexPath.row].date
        return(cell)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //array.append(student1)
        //array.append(student2)
        
        array = Singleton.instance.GetData()
        
        for item in array2 {
            print(item.surname)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
