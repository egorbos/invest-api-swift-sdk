import Foundation

/// Информация о счёте.
public struct Account: Codable {
    /// Идентификатор счёта.
    let id: String
    
    /// Тип счёта.
    let type: AccountType
    
    /// Название счёта.
    let name: String
    
    /// Статус счёта.
    let status: AccountStatus
    
    /// Дата открытия счёта в часовом поясе UTC.
    let openedDate: Date
    
    /// Дата закрытия счёта в часовом поясе UTC.
    let closedDate: Date
    
    /// Уровень доступа к текущему счёту (определяется токеном).
    let accessLevel: AccessLevel
}

internal extension Account {
    init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Account) throws {
        self.id = grpcModel.id
        self.type = try AccountType(rawValue: grpcModel.type.rawValue) ?? { throw InvestApiError.valueOutOfRange }()
        self.name =  grpcModel.name
        self.status =  try AccountStatus(rawValue: grpcModel.status.rawValue) ?? { throw InvestApiError.valueOutOfRange }()
        self.openedDate = grpcModel.openedDate.date
        self.closedDate =  grpcModel.closedDate.date
        self.accessLevel = try AccessLevel(rawValue: grpcModel.accessLevel.rawValue) ?? { throw InvestApiError.valueOutOfRange }()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Account {
    func toModel() throws -> Account {
        try Account(grpcModel: self)
    }
}
