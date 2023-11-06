import Foundation

internal extension Decimal {
  #if swift(<5.1)
    var int32Value: Int32 { return NSDecimalNumber(decimal: self).int32Value }
    var int64Value: Int64 { return NSDecimalNumber(decimal: self).int64Value }
  #else
    var int32Value: Int32 { return (self as NSNumber).int32Value }
    var int64Value: Int64 { return (self as NSNumber).int64Value }
  #endif
    
    var wholePart: Self {
      var result = Decimal()
      var mutableSelf = self
      NSDecimalRound(&result, &mutableSelf, 0, self >= 0 ? .down : .up)
      return result
    }
}
