import Foundation

/// Список операций по счёту с пагинацией.
public protocol OperationsByCursor {
    /// Список операций.
    var items: [OperationItem] { get }
    
    /// Следующий курсор.
    var nextCursor: String { get }
    
    /// Признак, есть ли следующий элемент.
    var hasNext: Bool { get }
}

internal struct OperationsByCursorModel: OperationsByCursor {
    let items: [OperationItem]
    
    let nextCursor: String
    
    let hasNext: Bool
}

internal extension OperationsByCursorModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetOperationsByCursorResponse) throws {
        self.items = try grpcModel.items.map { try $0.toModel() }
        self.nextCursor = grpcModel.nextCursor
        self.hasNext = grpcModel.hasNext_p
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetOperationsByCursorResponse {
    func toModel() throws -> OperationsByCursorModel {
        try OperationsByCursorModel(grpcModel: self)
    }
}
