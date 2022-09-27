//
//  ViewController.swift
//  TimePractica
//
//  Created by Mauricio Juárez on 27/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var hourField: UITextField!
    @IBOutlet var birthdayField: UITextField!
    //Creando
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
    }
    //Creando Toolbar
    func createToolBar() -> UIToolbar{
        //Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func createDatePicker(){
        
        datePicker.preferredDatePickerStyle = .wheels // Darle formato de wheels a la fecha
        datePicker.datePickerMode = .date
        birthdayField.inputView = datePicker
        birthdayField.inputAccessoryView = createToolBar()
        
    }
    
    
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        //Extraemos el texto de la fecha
        //self.birthdayField.text = "\(datePicker.date)"
        birthdayField.textAlignment = .center
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.birthdayField.text = dateFormatter.string(from: datePicker.date)
        print(self.birthdayField.text!)
        self.view.endEditing(true)
    }

}

