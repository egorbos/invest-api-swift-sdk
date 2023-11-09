/// Информация о пользователе.
public protocol UserInfo {
    /// Признак премиум клиента.
    var premStatus: Bool { get }
    
    /// Признак квалифицированного инвестора.
    var qualStatus: Bool { get }
    
    /// Набор требующих тестирования инструментов и возможностей, с которыми может работать пользователь.
    var qualifiedForWorkWith: [String] { get }
    
    /// Наименование тарифа пользователя.
    var tariff: String { get }
}

internal struct UserInfoModel: UserInfo {
    let premStatus: Bool
    
    let qualStatus: Bool
    
    let qualifiedForWorkWith: [String]
    
    let tariff: String
}

internal extension UserInfoModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse) {
        self.premStatus = grpcModel.premStatus
        self.qualStatus = grpcModel.qualStatus
        self.qualifiedForWorkWith = grpcModel.qualifiedForWorkWith
        self.tariff = grpcModel.tariff
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse {
    func toModel() -> UserInfoModel {
        UserInfoModel(grpcModel: self)
    }
}
