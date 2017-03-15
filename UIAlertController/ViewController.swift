//
//  ViewController.swift
//  UIAlertController
//
//  Created by Kinki Lai on 2017/3/3.
//  Copyright © 2017年 Kinki Lai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum LoginError:Error {
        //無此使用者
        case notUser
        //密碼錯誤
        case falsepassword
    }
    
    @IBOutlet weak var emailTextField: UITextField!
   
    @IBOutlet weak var passowrdTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func enterAction(_ sender: Any) {
        var alertMeassage=""
        var title="提示訊息"
        
        let useremail=emailTextField.text
        let password=passowrdTextField.text
        
        do {
             alertMeassage=try checkLoginData(user: useremail,password: password)
        }
        catch LoginError.notUser {
            alertMeassage="你輸入的用戶名稱似乎不屬於任何帳號。請檢查用戶名稱，然後再試一次"
            title="用戶名稱錯誤"
        }
        catch LoginError.falsepassword {
            title="密碼錯誤"
            alertMeassage="你輸入的密碼不正確。請再試一次"
        }
        catch {
             alertMeassage="帳號密碼錯誤"
        }
        if alertMeassage==""
        {
           
        }
        
        let alertController = UIAlertController(title: title, message: alertMeassage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(
            title: "確認",
            style: .default,
            handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func checkLoginData(user:String?, password:String?) throws -> String {
        guard user != "" else {
            throw LoginError.notUser
            }
        guard password != "" else{
            throw LoginError.falsepassword
            }
        return "登入成功"
    }
}

