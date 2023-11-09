import Foundation

/// Информация о счёте.
public protocol Account {
    /// Идентификатор счёта.
    var id: String { get }
    
    /// Тип счёта.
    var type: AccountType { get }
    
    /// Название счёта.
    var name: String { get }
    
    /// Статус счёта.
    var status: AccountStatus { get }
    
    /// Дата открытия счёта в часовом поясе UTC.
    var openedDate: Date { get }
    
    /// Дата закрытия счёта в часовом поясе UTC.
    var closedDate: Date { get }
    
    /// Уровень доступа к текущему счёту (определяется токеном).
    var accessLevel: AccessLevel { get }
}

internal struct AccountModel: Account {
    let id: String
    
    let type: AccountType
    
    let name: String
    
    let status: AccountStatus
    
    let openedDate: Date
    
    let closedDate: Date
    
    let accessLevel: AccessLevel
}

internal extension AccountModel {
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
    func toModel() throws -> AccountModel {
        try AccountModel(grpcModel: self)
    }
}
