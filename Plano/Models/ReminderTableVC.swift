//
//  ReminderTableVC.swift
//  Plano
//
//  Created by Rayhan Martiza Faluda on 09/04/20.
//  Copyright © 2020 Mini Challenge 1 - Group 7. All rights reserved.
//

import UIKit

class ReminderTableVC: UITableViewController {

    //var reminderItemNone = ["None"]
    var reminderItem = ["None", "At time of event", "30 minutes before", "1 hour before", "2 hour before", "1 day before", "2 day before"]
    var selectedIndexes = [[IndexPath.init(row: 0, section: 0)], [IndexPath.init(row: 0, section: 1)], [IndexPath.init(row: 0, section: 2)], [IndexPath.init(row: 0, section: 3)], [IndexPath.init(row: 0, section: 4)], [IndexPath.init(row: 0, section: 5)], [IndexPath.init(row: 0, section: 6)]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return " "
//        }
//        else {
//            return " "
//        }
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        if section == 0 {
//            return 1
//        }
//        else {
//            return 6
//        }
        
        return reminderItem.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell2", for: indexPath) as! ReminderCell

        // Configure the cell...
//        if indexPath.section == 0 {
//            cell.reminderLabel.text = reminderItem[0]
//        }
//        else {
//            cell.reminderLabel.text = reminderItem[indexPath.row.advanced(by: 1)]
//        }
        cell.reminderLabel.text = reminderItem[indexPath.row]
        cell.selectionStyle = .none
        
        let selectedSectionIndexes = self.selectedIndexes[indexPath.section]
        if selectedSectionIndexes.contains(indexPath) {
            cell.accessoryType = .checkmark
            print(selectedReminder)
        }
        else {
            cell.accessoryType = .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        let cell = tableView.cellForRow(at: indexPath)

        // If current cell is not present in selectedIndexes
        if !self.selectedIndexes[indexPath.section].contains(indexPath) {
            // mark it checked
            cell?.accessoryType = .checkmark

            // Remove any previous selected indexpath
            self.selectedIndexes[indexPath.section].removeAll()
            selectedReminder.removeAll()

            // add currently selected indexpath
            self.selectedIndexes[indexPath.section].append(indexPath)
            selectedReminder.append(reminderItem[indexPath.row])

            tableView.reloadData()
            print(selectedReminder)
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
