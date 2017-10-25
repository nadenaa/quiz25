//
//  ViewController.swift
//  quiz25
//
//  Created by yusronadena on 10/25/17.
//  Copyright © 2017 yusron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etPhoneMerk: UITextField!
    @IBOutlet weak var etSeriesPhone: UITextField!
    @IBOutlet weak var etTypePhone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func etSave(_ sender: Any) {
        let context = (UIApplication.shared.delegate as!
        AppDelegate) .persistentContainer.viewContext
        
        let nameTask = Task(context: context)
        nameTask.type_phone = etTypePhone.text
        nameTask.series_phone = etSeriesPhone.text
        nameTask.phone_merk = etPhoneMerk.text
        
        if etTypePhone.text == ""{
        
        let alert = UIAlertController(title: "warning",
                                      message: "Task can not be empty",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    if etSeriesPhone.text == ""{
    //kondisi ketika kosong
    //tampil alert dialog
    let alert = UIAlertController(title: "WARNING",message:
    "Task can not be empty",preferredStyle:
    UIAlertControllerStyle.alert)
    //meenambahkan aksi ke button
    alert.addAction(UIAlertAction(title: "ok",
    style: .default,handler: nil))
    self.present(alert, animated: true, completion: nil)
    }else{
    //ketika kondisi teks taks ya tdk kosong
    //data disimpan ke core data
    
    (UIApplication.shared.delegate as!
    AppDelegate).saveContext()
    
    _ = navigationController?.popViewController(animated:
    true)
    
    //mencetak kalau data berhasil ditambahkan
    print("Data berhasil Disimpan")
    
    
    }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

