//
//  ViewController.swift
//  calculator
//
//  Created by Shunsuke Sogaya on 2017/12/03.
//  Copyright © 2017年 Shunsuke Sogaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //列挙型
    enum Operator{
        case undefined                      //未定義
        case addition                       //加法
        case subtraction                    //減法
        case multiplication                 //乗法
        case divition                       //除法
    }
    
    var firstValue = 0
    var secondValue = 0
    var currentOperator = Operator.undefined   //列挙型の値の取得
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        var value = 0
        switch sender.currentTitle! {        //ボタンに表示されている文字列を取得
            case "0":
                value = 0
            case "1":
                value = 1
            case "2":
                value = 2
            case "3":
                value = 3
            case "4":
                value = 4
            case "5":
                value = 5
            case "6":
                value = 6
            case "7":
                value = 7
            case "8":
                value = 8
            case "9":
                value = 9
            default:
                value = 0
        }
        if currentOperator == Operator.undefined{
            firstValue = firstValue * 10 + value
            label.text = "\(firstValue)"
        }else{
            secondValue = secondValue * 10 + value
            label.text = "\(secondValue)"
        }
    }
    
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "+":
            currentOperator = .addition
        case "-":
            currentOperator = .subtraction
        case "×":
            currentOperator = .multiplication
        case "÷":
            currentOperator = .divition
        default:
            currentOperator = .undefined
        }
    }
    
    
    @IBAction func equelButtonTapped(_ sender: UIButton) {
        var value = 0
        switch currentOperator {
        case .addition:
            value = firstValue + secondValue
        case .subtraction:
            value = firstValue - secondValue
        case .multiplication:
            value = firstValue * secondValue
        case .divition:
            value = firstValue / secondValue
        default:
            value = firstValue
        }
        label.text = "\(value)"
        firstValue = 0
        secondValue = 0
        currentOperator = Operator.undefined
    }
    
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        firstValue = 0
        secondValue = 0
        currentOperator = Operator.undefined
        label.text = "0"
    }
    
}

