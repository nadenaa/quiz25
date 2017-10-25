//
//  AddTableViewController.swift
//  quiz25
//
//  Created by yusronadena on 10/25/17.
//  Copyright © 2017 yusron. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController {
    var tasks: [Task] = [] //task ini di panggil dari entiti yg sudah di buat
    
    //deklarasi context untuk persistent container
    let context = (UIApplication.shared.delegate as!
        AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celltable", for: indexPath) as! NoteTableViewCell
        
        
        let datatask = tasks[indexPath.row]
        //mengambil data dengan atributs index dari taks
        if let myDataTask = datatask.type_phone
        {
            //menampilkan data ke kabel
            cell.labeltypePhone.text = myDataTask
        }
        
        if let myDataTask1 = datatask.series_phone
        {
            //menampilkan data ke kabel
            cell.labelSeries.text = myDataTask1
        }
        
        if let myDataTask2 = datatask.phone_merk
        {
            //menampilkan data ke kabel
            cell.labelPhoneMerk.text = myDataTask2
        }

        // Configure the cell...

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method data()
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    
    //method data
    func getData() {
        //mencetak apakah ada error aatau tidak
        do {
            //kondisi kalau tidak ada eror
            //maka akan request download data
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
            //kondisi apabila eror fetchdata
            print("Fetching Failed")
            
            
        }
    }
    
    //menambahkan data untuk delete data
    override func tableView(_ tableView: UITableView, commit
        editingStyle: UITableViewCellEditingStyle, forRowAt
        indexPath: IndexPath) {
        //mengecek menu swipe apabila editing stylenya delete
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            //delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                //retrieve data
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch {
                print("Feching Filed")
            }
        }
        //load data lagi
        tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
