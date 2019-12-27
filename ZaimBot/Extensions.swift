//
//  Extensions.swift
//  ZaimBot
//
//  Created by Artyom Schiopu on 24.12.2019.
//  Copyright © 2019 Artyom Schiopu. All rights reserved.
//

import UIKit


extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

extension UILabel {
    class func fromXib<T: UILabel>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

