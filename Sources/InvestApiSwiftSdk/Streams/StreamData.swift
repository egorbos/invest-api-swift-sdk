import Foundation

public protocol StreamData {
    associatedtype StreamDataType
    
    var time: Date { get }
    var data: StreamDataType { get }
    var type: StreamPayloadType { get }
}
