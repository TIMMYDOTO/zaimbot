//
//  LableVC.swift
//  ZaimBot
//
//  Created by Artyom Schiopu on 27.12.2019.
//  Copyright © 2019 Artyom Schiopu. All rights reserved.
//

import UIKit
import ActiveLabel
class LableVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        dismissKeyboard()
        
        }
    
    
  
    
    
    
    


}
extension LableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TestCell
        cell.activeLabel.text =  "Проанализировав ваш профиль предлагаем займ у нашего партнера Е - Капуста. Для моментального, автоматического получения до 30.000 ₽ под 0% (сколько взяли столько и отдаете) до 30 дней оставьте заявку здесь  https://go.leadgid.ru/aff_c?offer_id=1658&aff_id=58757 (нажмите на ссылку)\n Так же Займер готов одобрить до 30 000 уже через 15 минут Вам на карту! https://go.leadgid.ru/aff_c?offer_id=1621&aff_id=58757 (нажмите на ссылку)\nДоЗарплаты - от 2 000 до 100 000 руб до 12 месяцев https://go.leadgid.ru/aff_c?offer_id=2555&aff_id=58757 (нажмите на ссылку)\n Быстроденьги - Для Вас до 15 000 руб под 0% - забирайте! https://go.leadgid.ru/aff_c?offer_id=4464&aff_id=58757 (нажмите на ссылку)\n Или напиши мне любое сообщение, чтобы начать подбор других займов."
        cell.activeLabel.handleURLTap { (url) in
            print(url)
        }
        cell.activeLabel.sizeToFit()
        
        
        return cell
    }
}
extension LableVC {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        
    }
}
