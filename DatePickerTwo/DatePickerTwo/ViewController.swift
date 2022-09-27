//
//  ViewController.swift
//  DatePickerTwo
//
//  Created by Mauricio Juárez on 27/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var birthDateTxt: UITextField!
    
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDatePicker()
    }
    func createDatePicker(){
        //create toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        //Assign toolbar
        birthDateTxt.inputAccessoryView = toolbar
        
        //assign date picker to text field
        birthDateTxt.inputView = datePicker

        //Modifica el tipo de fecha
        datePicker.datePickerMode = .date
    }
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        //Formato de mes en cadena para recibir en base de datos
        formatter.dateFormat = "yyyy-MM-dd"
        birthDateTxt.text = formatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
        
    }
}

