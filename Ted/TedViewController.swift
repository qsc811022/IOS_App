//
//  TedViewController.swift
//  Ted
//
//  Created by tedliu on 2017/6/20.
//  Copyright © 2017年 Tedliu. All rights reserved.
// seccondControll  根據參考書本樣式 會撰寫 向左向右滑的動作

import UIKit
import AVFoundation

class TedViewController: UIViewController {
    
    @IBOutlet weak var Chinese: UILabel!
    
    @IBOutlet weak var Chinese1: UILabel!
    
    @IBOutlet weak var English: UILabel! 
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    var topic:String!
    var topicc:String!
    var dataArray:[[String:String]]!
    var index = 0
    
    //向右滑的function
    @IBAction func next(_ sender: UIGestureRecognizer) {
        if index < dataArray.count-1{
        index = index + 1
        let dic = dataArray[index]
        English.text = dic["3"]
        Chinese1.text = dic["2"]
        Chinese.text = dic["1"]
        imageView.sd_setImage(with: URL(string: dic["image"]!))
        
        
        }
    }
    //向左滑的function
    @IBAction func pre(_ sender: Any) {
        if index > 0 {
            index = index - 1
            let dic = dataArray[index]
            English.text = dic["3"]
            Chinese1.text = dic["2"]
            Chinese.text = dic["1"]
            imageView.sd_setImage(with: URL(string: dic["image"]!))
            
        
        
    }
    
    }
    
    
 
    
    
    
    // apple voice function need to import AVFoundation
    // chinese & English 發音功能
    @IBAction func Chinese(_ sender: Any) {
        let uttrence = AVSpeechUtterance(string: Chinese.text!)
        uttrence.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let synth = AVSpeechSynthesizer()
        synth.speak(uttrence)
    }
    
   
    @IBAction func English(_ sender: Any) {
        let uttrence = AVSpeechUtterance(string: English.text!)
        let synth = AVSpeechSynthesizer()
        synth.speak(uttrence)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dic = dataArray[0]
        English.text = dic["3"] // for database english 位置
        Chinese1.text = dic["2"]// for database 漢語拼音 位置
        Chinese.text = dic["1"] // for database 中文 位置
        
        imageView.sd_setImage(with: URL(string: dic["image"]!)) // url 抓圖片
        
        
        
        if topicc == nil {
            title = topic 
        }
        else {
            title = "\(topic!) \(topicc!)"

        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
