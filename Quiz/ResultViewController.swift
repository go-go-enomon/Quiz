//
//  ResultViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var correctAnswer:Int!

    
    @IBOutlet weak var answerLabel:UILabel!
    @IBOutlet weak var answerImageVIew:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if correctAnswer >= 0  && correctAnswer <= 1 {
            answerLabel.text = "熱さが足りないぞ"
            answerImageVIew.image = UIImage(named: "logo.png")
        } else if correctAnswer > 1 && correctAnswer <= 3{
            answerLabel.text = "もっと熱くなれるぞ！！"
            answerImageVIew.image = UIImage(named: "logo2.png")
        } else if correctAnswer == 4 {
            answerLabel.text = "なかなかのいい熱さだ！！"
            answerImageVIew.image = UIImage(named: "logo3.png")
        } else if correctAnswer == 5 {
            answerLabel.text = "君は最高だ！！"
            answerImageVIew.image = UIImage(named: "logo4.png")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}