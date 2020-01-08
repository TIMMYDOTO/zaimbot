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
    
    var phrases = [String]()
    var messages:[String] = []
    
    var timer: Timer!
    var typeIndicator: NVActivityIndicatorView!
    
    var iteration = 1
    
    @IBOutlet var toStartView: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        toStartView.frame = CGRect(x: 0, y: view.frame.height - 60, width: view.frame.width, height: 60)
        setNavigationBar()
        
        beginTimer()
        
        
       
        
        showIndicator()
        
        
        
    }
    
    func beginTimer() {
      
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(updateDataSource), userInfo: nil, repeats: true)
        
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
            print("case 1")
            self.phrases.append("Привет! Я ЗаймБот, помогу быстро получить займ или кредит.")
            
        case 2:
            print("case 2")
            self.phrases.append("Кстати, первый займ выдается без процентов и переплат, сколько возьмете, столько и нужно будет вернуть")
            
        case 3:
            print("case 3")
            
            
            self.phrases.append("Что бы получить деньги напишите мне любое сообщение.")
            sendButton.isHidden = false
            messageTextField.isHidden = false
            
            typeIndicator.stopAnimating()
            print("isvalid \(timer.isValid)")
            timer.invalidate()
            print(typeIndicator.isAnimating)
            print(timer.isValid)
        case 5:
            print("case 5")
            self.phrases.append("Проанализировав ваш профиль предлагаем займ у нашего партнера Е - Капуста. Для моментального, автоматического получения до 30.000 ₽ под 0% (сколько взяли столько и отдаете) до 30 дней оставьте заявку здесь  https://go.leadgid.ru/aff_c?offer_id=1658&aff_id=58757 (нажмите на ссылку).")
            
        case 6:
            self.phrases.append("Так же Займер готов одобрить до 30 000 уже через 15 минут Вам на карту! https://go.leadgid.ru/aff_c?offer_id=1621&aff_id=58757 (нажмите на ссылку)")
            
        case 7:
            self.phrases.append("ДоЗарплаты - от 2 000 до 100 000 руб до 12 месяцев https://go.leadgid.ru/aff_c?offer_id=2555&aff_id=58757 (нажмите на ссылку)")
        case 8:
            self.phrases.append("Быстроденьги - Для Вас до 15 000 руб под 0% - забирайте! https://go.leadgid.ru/aff_c?offer_id=4464&aff_id=58757 (нажмите на ссылку)")
        case 9:
            self.phrases.append("Или напиши мне любое сообщение, чтобы начать подбор других займов.")
            typeIndicator.stopAnimating()
            timer.invalidate()
        case 11:
            self.phrases.append("добро пожаловать в главное меню бота!")
            
        case 12:
            self.phrases.append("У ВАС ЕСТЬ ВОЗМОЖНОСТЬ ПОЛУЧИТЬ ЗАЙМ ПОД 0%:\nЗАБИРАЙТЕ ДЕНЬГИ")
            
        case 13:
            self.phrases.append("Заполните заявки ниже для получения денег:")
        case 14:
            self.phrases.append("Веб-Займ - до 30 000 рублей Под 0% для ВСЕХ! https://go.leadgid.ru/aff_c?offer_id=2973&aff_id=58757 (нажмите на ссылку)")
            
        case 15:
            self.phrases.append("CreditPlus - до 15 000 руб через 10 минут у вас на карте - первый займ под 0%! https://go.leadgid.ru/aff_c?offer_id=1945&aff_id=58757 (нажмите на ссылку)")
            
        case 16:
            self.phrases.append("Vivus - до 80 тысяч за 10 минут у вас на карте, первый займ под 0%! https://go.leadgid.ru/aff_c?offer_id=1782&aff_id=58757 (нажмите на ссылку)")
        case 17:
            self.phrases.append("ДоЗарплаты - от 21 000 до 100 000 руб до 12 месяцев https://go.leadgid.ru/aff_c?offer_id=2555&aff_id=58757 (нажмите на ссылку)")
            
        case 18:
            self.phrases.append("Планета Кэш - одобряет вам - 15к на карту моментом! https://go.leadgid.ru/aff_c?offer_id=4648&aff_id=58757 (нажмите на ссылку)")
            
        case 19:
            self.phrases.append("Совет: Чтобы увеличить вероятность и скорость одобрения займа, оставьте анкеты сразу в нескольких компаниях!")
            typeIndicator.stopAnimating()
            timer.invalidate()
             view.addSubview(toStartView)
            
        default:
            break
            
        }
        
        iteration = iteration + 1
        tableView.reloadData()
        
        tableViewScrollToBottom()
    }
    
    
    func tableViewScrollToBottom() {
        let indexPath = IndexPath(item: phrases.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
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
            
            phrases.append(messageTextField.text!)
            messageTextField.text = ""
            
            tableView.reloadData()
            tableViewScrollToBottom()
            iteration = iteration + 1
            //start timer
            beginTimer()
            typeIndicator.startAnimating()
         
            
            
        }
    }
    
    
    @IBAction func didTapToStart(_ sender: UIButton) {
        tableViewScrollToTop()
    }
    
    func tableViewScrollToTop() {
           let indexPath = IndexPath(item: 0, section: 0)
           tableView.scrollToRow(at: indexPath, at: .top, animated: true)
       }
}



extension ViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phrases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! AnswerCell
            cell.answerLabel.text = phrases[indexPath.row]
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! AnswerCell
            cell.answerLabel.text = phrases[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            cell.msgLabel.text = phrases[indexPath.row]
            
            cell.msgLabel.sizeToFit()
            cell.msgLabel.handleURLTap { (url) in
                print(url)
            }
            return cell
        }
        
        
    }
    
}
