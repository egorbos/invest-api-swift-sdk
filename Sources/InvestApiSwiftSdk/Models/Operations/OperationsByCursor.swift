import Foundation

/// Список операций по счёту с пагинацией.
public struct OperationsByCursor: Codable {
    /// Список операций.
    let items: [OperationItem]
    
    /// Следующий курсор.
    let nextCursor: String
    
    /// Признак, есть ли следующий элемент.
    let hasNext: Bool
}

internal extension OperationsByCursor {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetOperationsByCursorResponse) throws {
        self.items = try grpcModel.items.map { try $0.toModel() }
        self.nextCursor = grpcModel.nextCursor
        self.hasNext = grpcModel.hasNext_p
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetOperationsByCursorResponse {
    func toModel() throws -> OperationsByCursor {
        try OperationsByCursor(grpcModel: self)
    }
}
