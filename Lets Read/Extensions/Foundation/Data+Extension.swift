//
//  Data+Extension.swift
//  Jillion
//
//  Created by Emad Abd on 07/05/2022.
//

import Foundation

extension Data {
    static func convertToData(_ obj: Any) -> Data? {
        var data: Data?
        if let jsonString = obj as? String {
            let result = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false)
            data = result
        } else if let jsonArrayOfDic = obj as? [[String: AnyObject]] {
            do {
                let result = try JSONSerialization.data(withJSONObject: jsonArrayOfDic, options: .prettyPrinted)
                data = result
            } catch {
                data = nil
            }
        } else if let jsonDic = obj as? [String: AnyObject] {
            do {
                let result = try JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
                data = result
            } catch {
                data = nil
            }
        }
        return data
    }
}
