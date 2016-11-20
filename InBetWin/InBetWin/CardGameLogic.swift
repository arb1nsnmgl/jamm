//
//  CardGameLogic.swift
//  InBetWin
//
//  Created by Arvin San Miguel on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func returnValue() -> Int {
        
        switch self {
        case "ACE": return 1
        case "KING" : return 13
        case "QUEEN" :  return 12
        case "JACK" : return 11
        default: return Int(self)!
        }
    }
    
}


