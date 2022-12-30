import Foundation

import Foundation

// Encode a string to base 64
let originalString = "Hello, World!"
let data = originalString.data(using: .utf8)!
let base64String = data.base64EncodedString()
print(base64String)  // "SGVsbG8sIFdvcmxkIQ=="

// Decode a base 64 string to the original string
let base64Data = Data(base64Encoded: base64String)!
let convertedString = String(data: base64Data, encoding: .utf8)!
print(convertedString)  // "Hello, World!"


