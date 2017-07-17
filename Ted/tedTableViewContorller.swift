//
//  tedTableViewContorller.swift
//  Ted
//
//  Created by tedliu on 2017/6/20.
//  Copyright © 2017年 Tedliu. All rights reserved.
//  主畫面的程式碼 在這個畫面會先上firebase database 把所有檔案下載下來

import UIKit
import Firebase
import FirebaseStorageUI
import FirebaseStorage
import FirebaseDatabase
import SDWebImage


class teddTableViewController: UITableViewController {
    let ref = FIRDatabase.database().reference()  //firebase string
    
    var dataDic:[String:Any]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        ref.observeSingleEvent(of: .value, with: {(snapshot) in
            self.dataDic = snapshot.value as? [String:Any]
            self.navigationItem.rightBarButtonItem?.isEnabled = true

        })
        
    
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    //定義到下一畫面的線條
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if dataDic  != nil {
            performSegue(withIdentifier: "Ted", sender: nil)

        }
        
    }
    
    // MARK: - Table view data source
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.destination is TedViewController {
            let controller = segue.destination as! TedViewController
            
            let cell = tableView.cellForRow(at: tableView.indexPathForSelectedRow!)
            
            
            let label = cell?.viewWithTag(1) as! UILabel
            let labelEng = cell?.viewWithTag(2) as! UILabel

            
            controller.topic = label.text
            controller.topicc = labelEng.text
            
            
            let dic = dataDic["篇章"] as! [String:Any]
            controller.dataArray = dic[controller.topic!] as! [[String:String]]
            print("dataArray \(controller.dataArray)")
            
            
        }
        else {
            let controller = segue.destination as! SearchTableViewController
            controller.dataDic = dataDic["篇章"] as! [String:Any]
            
        }
    
        
        
}
}
