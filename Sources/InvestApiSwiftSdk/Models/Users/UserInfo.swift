/// Информация о пользователе.
public struct UserInfo: Codable {
    /// Признак премиум клиента.
    let premStatus: Bool
    
    /// Признак квалифицированного инвестора.
    let qualStatus: Bool
    
    /// Набор требующих тестирования инструментов и возможностей, с которыми может работать пользователь.
    let qualifiedForWorkWith: [String]
    
    /// Наименование тарифа пользователя.
    let tariff: String
}

internal extension UserInfo {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse) {
        self.premStatus = grpcModel.premStatus
        self.qualStatus = grpcModel.qualStatus
        self.qualifiedForWorkWith = grpcModel.qualifiedForWorkWith
        self.tariff = grpcModel.tariff
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse {
    func toModel() -> UserInfo {
        UserInfo(grpcModel: self)
    }
}
