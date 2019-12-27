//
//  ViewController.swift
//  ZaimBot
//
//  Created by Artyom Schiopu on 23.12.2019.
//  Copyright © 2019 Artyom Schiopu. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import ActiveLabel
class ViewController: UIViewController {
    //color 2DA6EB
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    
    @IBOutlet weak var tableViewY: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    
    var phrases: [String] = ["Привет! Я ЗаймБот, помогу быстро получить займ или кредит."]
    var messages:[String] = []
    
    var timer: Timer!
    var typeIndicator: NVActivityIndicatorView!
    
    var iteration = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        hideKeyboardWhenTappedAround()
      
        
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(updateDataSource), userInfo: nil, repeats: true)
        showIndicator()
        
    }
    
 
    
    func showIndicator() {
        
        typeIndicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30), type: .ballPulse, color: .systemBlue, padding: nil)
        typeIndicator.center = view.center
        view.addSubview(typeIndicator)
        typeIndicator.startAnimating()
    }
    
    
    
    
    @objc func updateDataSource() {
        
        switch iteration {
        case 1:
            self.phrases.append("Кстати, первый займ выдается без процентов и переплат, сколько возьмете, столько и нужно будет вернуть")
            self.tableView.reloadData()
        case 2:
            self.phrases.append("Что бы получить деньги напишите мне любое сообщение.")
            sendButton.isHidden = false
            messageTextField.isHidden = false
            self.tableView.reloadData()
            typeIndicator.stopAnimating()
            timer.invalidate()
        case 3:
            self.phrases.append("Кстати, первый займ выдается без процентов и переплат, сколько возьмете, столько и нужно будет вернуть")
            self.tableView.reloadData()
            typeIndicator.stopAnimating()
            timer.invalidate()
        case 4:
            self.phrases.append("Проанализировав ваш профиль предлагаем займ у нашего партнера Е - Капуста. Для моментального, автоматического получения до 30.000 ₽ под 0% (сколько взяли столько и отдаете) до 30 дней оставьте заявку здесь  https://go.leadgid.ru/aff_c?offer_id=1658&aff_id=58757 (нажмите на ссылку)\n Так же Займер готов одобрить до 30 000 уже через 15 минут Вам на карту! https://go.leadgid.ru/aff_c?offer_id=1621&aff_id=58757 (нажмите на ссылку)\nДоЗарплаты - от 2 000 до 100 000 руб до 12 месяцев https://go.leadgid.ru/aff_c?offer_id=2555&aff_id=58757 (нажмите на ссылку)\n Быстроденьги - Для Вас до 15 000 руб под 0% - забирайте! https://go.leadgid.ru/aff_c?offer_id=4464&aff_id=58757 (нажмите на ссылку)\n Или напиши мне любое сообщение, чтобы начать подбор других займов.")
            typeIndicator.stopAnimating()
//            timer.invalidate()
        default:
            break
            
        }
        
        iteration = iteration + 1
        
        
        
        
    }
    
    
    func setNavigationBar() {
        
        let button = UIButton(type: .custom)
        
        button.setImage(UIImage(named: "menu"), for: .normal)
        
        button.addTarget(self, action: #selector(self.action(sender:)), for: .touchUpInside)
        
        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        let barButton = UIBarButtonItem(customView: button)
        barButton.tintColor = .white
        self.navigationItem.rightBarButtonItems = [barButton]
        
        
        
    }
    
    @objc func action(sender: UIBarButtonItem) {
        
        
        let modalViewController = storyboard?.instantiateViewController(withIdentifier: "ConditionController") as! ConditionController
        //    modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
    }
    
    @IBAction func didTapSend(_ sender: UIButton) {
        if messageTextField.text!.isEmpty {
            
        }else{
            
            messages.append(messageTextField.text!)
            messageTextField.text = ""
            
            iteration = iteration + 1
            updateDataSource()
            
            tableView.reloadData()
        }
    }
    
    
}



extension ViewController: UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phrases.count + messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        if indexPath.row == 3 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! AnswerCell
//            cell.answerLabel.text = messages[indexPath.row - 3]
//            return cell
//        }else{
//
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//
//            if indexPath.row > 3{
//
//                cell.msgLabel.text = phrases[indexPath.row - messages.count]
//
//            }else{
//                cell.msgLabel.text = phrases[indexPath.row]
//            }
//
//
//            cell.msgLabel.sizeToFit()
//            cell.msgLabel.handleURLTap { (url) in
//                print(url)
//            }
            
            cell.testLabel.handleURLTap { (url) in
                print(url)
            }
            return cell
//        }
    }
}



extension ViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        
    }
}


