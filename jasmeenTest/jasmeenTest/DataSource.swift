//
//  DataSource.swift
//  jasmeenTest
//
//  Created by Jasmeen Kular on 2021-08-09.
//

import UIKit
import Alamofire

class DataSource: NSObject {
    
    public enum HTTPMethod: String {
        case get     = "GET"
        case post    = "POST"
    }
    
    //MARK: - Get Request

    
    func getMethod() {

        AF.request("https://aqueous-everglades-71468.herokuapp.com/categories", parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }

                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
    }

}
