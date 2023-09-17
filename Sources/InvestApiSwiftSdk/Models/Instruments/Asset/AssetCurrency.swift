/// Валюта.
public struct AssetCurrency: Codable {
    /// ISO-код валюты.
    let baseCurrency: String
}

internal extension AssetCurrency {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetCurrency) {
        self.baseCurrency = grpcModel.baseCurrency
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetCurrency {
    func toModel() -> AssetCurrency {
        AssetCurrency(grpcModel: self)
    }
}