//
//  Item.swift
//  iOS_kadai03_ToDo2
//
//  Created by 篠原未花 on 2019/05/30.
//  Copyright © 2019 mika shinohara. All rights reserved.
//

import Foundation

//class型の変数を作る
class Item {
    var title : String
    var done : Bool = false
    init(title:String) {
        self.title = title
    }
}
