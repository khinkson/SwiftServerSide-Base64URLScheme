//
//  Extension.swift
//  
//
//  Created by Kevin Hinkson on 2022-03-10.
//

import Foundation

extension String {

    /**
     * If you have never seen init? before, it simply means that the init returns an Optional
     * If it is not possible to initialize the object, then expect a nil
     * - returns String?
     */
    public init?(base64Encoded: String) {
        guard let dataValue: Data = .init(base64Encoded: base64Encoded) else {
            return nil
        }
        guard let decodedStringValue: String = .init(data: dataValue, encoding: .utf8) else {
            return nil
        }
        self.init(decodedStringValue)
    }
    
    ///
    /// Converts a base64URL encoded string to a Data object by first reversing the base 64 url rules
    /// - returns String?
    public init?(base64URLEncoded: String) {
        var appendCount: Int = 4 - (base64URLEncoded.count % 4)
        var base64String: String = base64URLEncoded
        /*
         * base64url format can drop the == symbols which are used as spacers
         * They are added as padding to ensure a particular length of string
         * below, I calculate if they are missing and add the appropriate
         * number of "="
         */
        while appendCount > 0 && appendCount < 4 {
            base64String = "\(base64String)="
            appendCount -= 1
        }
        base64String = base64String.replacingOccurrences(of: "-", with: "+")
        base64String = base64String.replacingOccurrences(of: "_", with: "/")
        self.init(base64Encoded: base64String)
    }
    
    public func base64EncodedString() -> String? {
        self.data(using: .utf8)?.base64EncodedString()
    }
    
    public func base64URLEncodedString() -> String? {
        // copy the string locally
        guard var actualString = self.base64EncodedString() else {
            return nil
        }
        // make the adjustments
        actualString = actualString.replacingOccurrences(of: "+", with: "-")
        actualString = actualString.replacingOccurrences(of: "/", with: "_")
        return actualString.replacingOccurrences(of: "=", with: "")
    }
}
