//
//  UInt8Sequences.swift
//

import Foundation

public extension Sequence where Element == UInt8 {
    
    func hexString() -> String {
        return map { String(format:"0x%02x ", $0) }.joined()
    }
    
    func readInteger<T : FixedWidthInteger>() -> T {
        let map = self.map{T($0)}
        let bytes = T.bitWidth / 8
        var integer: T = 0
        for i in 0 ..< bytes {
            integer |= map[i] << (i * 8)
        }
        return integer
    }
    
    func readFloat() -> Float {
        var value: Float = 0
        let bytes = Array(self)
        precondition(bytes.count >= 4)
        withUnsafeMutableBytes(of: &value) { dst in
            bytes.withUnsafeBytes { src in
                dst.copyBytes(from: src.prefix(4))
            }
        }
        return value
    }
    
    func readDouble() -> Double {
        var value: Double = 0
        let bytes = Array(self)
        precondition(bytes.count >= 8)
        withUnsafeMutableBytes(of: &value) { dst in
            bytes.withUnsafeBytes { src in
                dst.copyBytes(from: src.prefix(8))
            }
        }
        return value
    }
    
}
