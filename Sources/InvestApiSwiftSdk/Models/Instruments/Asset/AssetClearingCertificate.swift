/// Клиринговый сертификат участия.
public struct AssetClearingCertificate: Codable {
    /// Номинал.
    public let nominal: Quotation
    
    /// Валюта номинала.
    public let nominalCurrency: String
}

internal extension AssetClearingCertificate {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetClearingCertificate) {
        self.nominal = grpcModel.nominal.toModel()
        self.nominalCurrency = grpcModel.nominalCurrency
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetClearingCertificate {
    func toModel() -> AssetClearingCertificate {
        AssetClearingCertificate(grpcModel: self)
    }
}
