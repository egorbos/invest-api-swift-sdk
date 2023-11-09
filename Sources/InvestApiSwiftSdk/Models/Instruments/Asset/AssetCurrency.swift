/// Валюта.
public protocol AssetCurrency {
    /// ISO-код валюты.
    var baseCurrency: String { get }
}

internal struct AssetCurrencyModel: AssetCurrency {
    let baseCurrency: String
}

internal extension AssetCurrencyModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetCurrency) {
        self.baseCurrency = grpcModel.baseCurrency
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetCurrency {
    func toModel() -> AssetCurrencyModel {
        AssetCurrencyModel(grpcModel: self)
    }
}
