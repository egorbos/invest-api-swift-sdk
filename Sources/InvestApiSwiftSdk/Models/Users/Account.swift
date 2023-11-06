import Foundation

/// Информация о счёте.
public struct Account: Codable {
    /// Идентификатор счёта.
    public let id: String
    
    /// Тип счёта.
    public let type: AccountType
    
    /// Название счёта.
    public let name: String
    
    /// Статус счёта.
    public let status: AccountStatus
    
    /// Дата открытия счёта в часовом поясе UTC.
    public let openedDate: Date
    
    /// Дата закрытия счёта в часовом поясе UTC.
    public let closedDate: Date
    
    /// Уровень доступа к текущему счёту (определяется токеном).
    public let accessLevel: AccessLevel
}

internal extension Account {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Account) throws {
        self.id = grpcModel.id
        self.type = try .new(rawValue: grpcModel.type.rawValue)
        self.name =  grpcModel.name
        self.status =  try .new(rawValue: grpcModel.status.rawValue)
        self.openedDate = grpcModel.openedDate.date
        self.closedDate =  grpcModel.closedDate.date
        self.accessLevel = try .new(rawValue: grpcModel.accessLevel.rawValue)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Account {
    func toModel() throws -> Account {
        try Account(grpcModel: self)
    }
}
