//
//  TstVC.swift
//  ZaimBot
//
//  Created by Artyom Schiopu on 25.12.2019.
//  Copyright © 2019 Artyom Schiopu. All rights reserved.
//

import UIKit

class ConditionController: UIViewController {
    
    
    @IBOutlet var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(action(sender:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
      
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textView.contentOffset = .zero
    }
    
    
    @objc func action(sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
