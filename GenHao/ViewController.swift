//
//  ViewController.swift
//  GenHao
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 LingFeng. All rights reserved.
//

import UIKit
//public protocol VCdelegate: NSObjectProtocol {
//    func msgSend(w:String, h:String, s:String)
//}
class ViewController: UIViewController {
    
    let ht: CGFloat = 40
//    let wt: CGFloat = 40;
    let endValue: UILabel = UILabel()
    let hight: UITextField = UITextField()
    let width: UITextField = UITextField()
    let bouns: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let kSelfW:CGFloat = self.view.frame.width - ht*2
        self.title = "PPI"
        
        let label1: UILabel = UILabel(frame: CGRectMake(ht, 70, 150, 20))
        label1.text = "屏幕宽度"
        self.view.addSubview(label1)
        
        width.frame = CGRectMake(ht, label1.frame.origin.y+30, kSelfW, 40)
        width.addTarget(self, action: "changeEnd", forControlEvents: .EditingChanged)
        width.borderStyle = .RoundedRect
        width.text = "1920"
        width.keyboardType = .NumbersAndPunctuation
        self.view.addSubview(width)
        
        let label: UILabel = UILabel(frame: CGRectMake(ht, width.frame.origin.y+50, 150, 20))
        label.text = "屏幕高度"
        self.view.addSubview(label)
        
        hight.frame = CGRectMake(ht, label.frame.origin.y+30, kSelfW, 40)
        hight.addTarget(self, action: "changeEnd", forControlEvents: .EditingChanged)
        hight.borderStyle = .RoundedRect
        hight.text = "1080"
        hight.keyboardType = .NumbersAndPunctuation
        self.view.addSubview(hight)
        
        let label2: UILabel = UILabel(frame: CGRectMake(ht, hight.frame.origin.y+50, 150, 20))
        label2.text = "屏幕大小"
        self.view.addSubview(label2)
        
        bouns.frame = CGRectMake(ht, label2.frame.origin.y+30, kSelfW, 40)
        bouns.addTarget(self, action: "changeEnd", forControlEvents: .EditingChanged)
        bouns.borderStyle = .RoundedRect
        bouns.text = "24"
        bouns.keyboardType = .NumbersAndPunctuation
        self.view.addSubview(bouns)
        
        let label3: UILabel = UILabel(frame: CGRectMake(ht, bouns.frame.origin.y+50, 150, 20))
        label3.text = "PPI"
        self.view.addSubview(label3)
        
//        endValue.layer.cornerRadius = 6
        endValue.layer.borderWidth = 0.8
        endValue.layer.borderColor = UIColor(red: 193/255.0, green: 193/255.0, blue: 193/255.0, alpha: 1).CGColor
        endValue.frame = CGRectMake(ht, label3.frame.origin.y+30, kSelfW, 30)
        endValue.backgroundColor = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1)
        self.view.addSubview(endValue)
        
        let h: Double = CDouble(hight.text!)!
        let w: Double = CDouble(width.text!)!
        let b: Double = CDouble(bouns.text!)!
        let value:Double = sqrt(pow(h, 2) + pow(w, 2))/b
        endValue.text = NSString(format: "%.2f", value) as String
    
    }
    
    func msgSend (w:String, h:String) -> Void {
        width.text = w
        hight.text = h
        self.performSelector("changeEnd")
    }
    
    func changeEnd() {
//        let value:Double = sqrt(pow(960, 2) + pow(640, 2))/3.5
        
        let ww = Model.isValidatePassword(width.text!) 
        let hh = Model.isValidatePassword(hight.text)
        let bb = Model.isValidatePassword(bouns.text)
        if !hh {
            return
        }
        if !ww {
            return
        }
        if !bb {
            return
        }
        
        
        let h: Double
        let w: Double
        let b: Double
        if ("" == hight.text) {
            h = 0
            endValue.text = "0"
            return;
        }else {
            h = CDouble(hight.text!)!
        }
        
        if ("" == width.text) {
            w = 0
            endValue.text = "0"
            return;
        }else {
            w = CDouble(width.text!)!
        }
        
        if ("" == bouns.text) {
            b = 0
            endValue.text = "0"
            return;
        }else {
            b = CDouble(bouns.text!)!
        }
        
        let value:Double = sqrt(pow(h, 2) + pow(w, 2))/b
        
        endValue.text = NSString(format: "%.2f", value) as String
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func barBtnClick(sender: AnyObject) {
        let lvc: ListViewController = ListViewController()
        self.navigationController?.pushViewController(lvc, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

