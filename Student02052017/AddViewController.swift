//
//  AddViewController.swift
//  Student02052017
//
//  Created by AlexanderYakovenko on 5/2/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

protocol CountSendDelegate {
    func userAdd(count: Int)
}


class AddViewController: UIViewController {
    
    var listArray = [Student]()
    
    var count = 0
    
    var delegate: CountSendDelegate? = nil
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    @IBAction func addButton(_ sender: Any) {
        
        count += 1
        
        
        
        let newStudent = Student()
        newStudent.name = nameTextField.text!
        newStudent.surname = surnameTextField.text!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectDate = dateFormatter.string(from: dateDatePicker.date)
        newStudent.date = selectDate
        
        listArray.append(newStudent)
        
        
        
        
        datePickerForValue(date: dateDatePicker)
        delegate?.userAdd(count: count)
        //dismiss(animated: true, completion: nil)
        
        // replace inscription "old" again "Note"
        //let timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(labelNote), userInfo: nil, repeats: true)
        
        
        
        
        
        
    }
    func labelNote() {
        noteLabel.text = "Note"
        
    }
    
    
    @IBOutlet weak var noteLabel: UILabel!
    
    func datePickerForValue(date: UIDatePicker ) {
        
        let today = NSDate()  // date of this day
        let date1 = date.date // date of birth
        let calendar = NSCalendar.current // for date component
        
        let componentY = calendar.component(.year, from: date1)
        print(componentY)
        let componentM = calendar.component(.month, from: date1)
        let componentD = calendar.component(.day, from: date1)
        
        let componentTodayY = calendar.component(.year, from: today as Date) - 18
        print(componentTodayY)
        
        let componentTodayM = calendar.component(.month, from: today as Date)
        let componentTodayD = calendar.component(.day, from: today as Date)
        
        if componentY >= componentTodayY {
            
            
        } else {
            noteLabel.text = "old"
            print("old")
            return
        }
        if componentM >= componentTodayM {
            
            
        } else {
            noteLabel.text = "old"
            print("old")
            return
            
        }
        if componentD >= componentTodayD {
            
        } else {
            noteLabel.text = "old"
            print("old")
            return
            
        }
        
        
    }
    
    
    @IBAction func toStart(_ sender: Any) {
        // go to first ViewController
         let firstStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let firstVC: ViewController = firstStoryboard.instantiateViewController(withIdentifier: "firstView") as! ViewController
         self.present(firstVC, animated: true, completion: nil)
         
         
         for item in listArray {
         print(item.name)
         }
        
        // send array to ListViewController
        Singleton.instance.SetData(value: listArray)
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC: ViewController = segue.destination as! ViewController
        destinationVC.countOfStudents.text = "1"
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
