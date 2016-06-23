
//
//  ListViewController.swift
//  GenHao
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 LingFeng. All rights reserved.
//

import UIKit


class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let table: UITableView = UITableView()
    let cellID :String = "cellIDD"
    
    var width: NSMutableArray = NSMutableArray(capacity: 44)
    var height: NSMutableArray = NSMutableArray(capacity: 44)
    var scale: NSMutableArray = NSMutableArray(capacity: 44)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.frame = UIScreen.mainScreen().bounds
        table.delegate = self
        table.dataSource = self
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        self.view.addSubview(table)
        
        
        let hello:Model = Model();
        hello.createModel()
//        let obj:NSArray = hello.width
        let ud:NSUserDefaults = NSUserDefaults.standardUserDefaults();
        ud.objectForKey("scale")
        
        width.addObjectsFromArray(ud.objectForKey("width") as! [String])
        height.addObjectsFromArray(ud.objectForKey("height") as! [String])
        scale.addObjectsFromArray(ud.objectForKey("scale") as! [String])
        
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return width.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        
        if nil == cell {
            cell? = UITableViewCell(style: .Subtitle, reuseIdentifier: cellID)
            
        }
        cell?.textLabel?.text = NSString(format: "%@x%@", width[indexPath.row] as! String, height[indexPath.row] as! String) as String
//        if (scale[indexPath.row] as! String) {
            cell?.detailTextLabel?.text = scale[indexPath.row] as? String
//        }
        
        return cell!
    }
    
    func msgSend(w: String, h: String, s: String) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = self.navigationController?.viewControllers[0] as! ViewController
        vc.msgSend(width[indexPath.row] as! String, h: height[indexPath.row] as! String)
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
