//
//  Video.swift
//  Youtube
//
//  Created by 倉田　隆成 on 2018/06/23.
//  Copyright © 2018年 倉田　隆成. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
