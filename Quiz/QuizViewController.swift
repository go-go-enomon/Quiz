//
//  QuizViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //出題数
    var questionNumber:Int = 5
    
    //現在の問題数
    var sum:Int = 0
    
    //正解数
    var correctAnswer:Int = 0
    
    //乱数
    var random:Int = 0
    
    //クイズを格納する配列
    var quizArray = [NSMutableArray]()
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons: Array<UIButton>!

    @IBOutlet var titleButtons: Array<UIButton>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["松岡修造の身長は？","188cm","178cm","184cm",1])
        quizArray.append(["松岡修造のシングルスでの自己最高ランキングは？？","32位","45位","95位",2])
        quizArray.append(["松岡修造の教え子でもある現役のプロテニスプレイヤーと言えば？","錦織圭","フェデラー","伊藤竜馬",1])
        quizArray.append(["松岡修造の出身地は？","兵庫県","神奈川県","東京都",3])
        quizArray.append(["松岡修造の妻の名前は？","辻敏子","田口恵美子","千波静",2])
        quizArray.append(["松岡修造の名言「この一球は○○○○の一球なり」○○○○に入る言葉は？","絶対無二","人生最高","松岡修造",1])

        //------------------------ここから下にクイズを書く------------------------//
        choiceQuiz()
    }
    
    func choiceQuiz() {
        println(quizArray.count)
        //クイズの問題文をシャッフルしてTextViewにセット
        random = Int(arc4random_uniform(UInt32(quizArray.count)))
        quizTextView.text = quizArray[random][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        for var i = 0; i < choiceButtons.count; i++ {
            titleButtons[i].setTitle(quizArray[random][i+1] as? String, forState: .Normal)
            
            //どのボタンが押されたか判別するためのtagをセット
            choiceButtons[i].tag = i + 1;
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        sum++
        println("random \(random)")
        if quizArray[random][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
        }
        
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if sum == questionNumber {
            performSegueToResult()
            
            
        }
        
        //if correctAnswer >= 0  && correctAnswer <= 1 {
            //println("熱さが足りないぞ")
        //} else if correctAnswer > 1 && correctAnswer <= 3{
            //println("もっと熱くなれるぞ！！")
        //} else if correctAnswer == 4 {
            //println("なかなかのいい熱さだ！！")
        //} else if correctAnswer == 5 {
            //println("君は最高だ！！")
        //}

        
        quizArray.removeAtIndex(random)
        choiceQuiz()
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            var ResultView : ResultViewController = segue.destinationViewController as! ResultViewController

            ResultView.correctAnswer = self.correctAnswer
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


