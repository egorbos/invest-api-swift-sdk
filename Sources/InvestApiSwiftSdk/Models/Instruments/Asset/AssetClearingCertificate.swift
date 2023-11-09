/// Клиринговый сертификат участия.
public protocol AssetClearingCertificate {
    /// Номинал.
    var nominal: Quotation { get }
    
    /// Валюта номинала.
    var nominalCurrency: String { get }
}

internal struct AssetClearingCertificateModel: AssetClearingCertificate {
    let nominal: Quotation
    
    let nominalCurrency: String
}

internal extension AssetClearingCertificateModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetClearingCertificate) {
        self.nominal = grpcModel.nominal.toModel()
        self.nominalCurrency = grpcModel.nominalCurrency
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetClearingCertificate {
    func toModel() -> AssetClearingCertificateModel {
        AssetClearingCertificateModel(grpcModel: self)
    }
}
