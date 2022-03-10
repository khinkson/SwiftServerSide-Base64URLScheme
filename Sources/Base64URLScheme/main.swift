import Foundation

// Encode
let stringValue: String = "Hello my pretties!"              // Start with a string
if let dataValue: Data = stringValue.data(using: .utf8) {   // String to data using utf8 string encoding returns an Optional, so check if it worked
    let encodedStringValue: String = dataValue.base64EncodedString()
    print("encodedStringValue: \(encodedStringValue)")      // Should print out "SGVsbG8gbXkgcHJldHRpZXMh"
}

// or if you are certain the string will always convert
// to a Data type then
//
// let dataValue: Data = stringValue.data(using: .utf8)!


// Decode
let encodedStringValue: String = "SGVsbG8gbXkgcHJldHRpZXMh"
if let dataValue: Data = .init(base64Encoded: encodedStringValue) {
    if let decodedStringValue: String = .init(data: dataValue, encoding: .utf8) {
        print("decodedStringValue: \(decodedStringValue)")
    }
}

print("encodedStringValue: \(stringValue.base64EncodedString()!)")
print("decodedStringValue: \(String(base64Encoded: "SGVsbG8gbXkgcHJldHRpZXMh")!)")

// url encoded comparison
print("encodedStringValue: \("Hello my pretties!!".base64EncodedString()!)")
print("urlEncodedStringValue: \("Hello my pretties!!".base64URLEncodedString()!)")
print("decodedURLStringValue: \(String(base64URLEncoded: "SGVsbG8gbXkgcHJldHRpZXMhIQ")!)")
