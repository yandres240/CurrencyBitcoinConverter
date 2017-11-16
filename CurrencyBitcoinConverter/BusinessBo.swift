//
//  BusinessBo.swift
//  CurrencyBitcoinConverter
//
//  Created by practica on 15/11/17.
//  Copyright © 2017 practica. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
struct BusinessBo{
    var strPrice = ""
    func FormatNumber(number:Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.groupingSeparator = "."
        let returnValue = numberFormatter.string(from: NSNumber(value:number))
        
        return returnValue!
    }
    
    mutating func updateBitCoinData(json:JSON, symbol: String)-> String{
        strPrice = ""
        strPrice = symbol
        if let bitcoinResult=json["ask"].double {
            
            strPrice = strPrice+FormatNumber(number: Double(bitcoinResult))
        }
        else{
            strPrice="Servicio no Disponible"
        }
        return strPrice
        
    }
}
