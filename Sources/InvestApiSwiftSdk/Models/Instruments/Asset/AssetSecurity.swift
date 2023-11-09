/// Ценная бумага.
public protocol AssetSecurity {
    /// ISIN-идентификатор ценной бумаги.
    var isin: String { get }
    
    /// Тип ценной бумаги.
    var type: InstrumentType { get }
    
    /// Вид инструмента.
    var kind: InstrumentKind { get }
    
    /// Акция (значение присваивается только для акций, тип актива asset.type = "ASSET_TYPE_SECURITY" и security.type = share).
    var share: AssetShare? { get }
    
    /// Облигация (значение присваивается только для облигаций, тип актива asset.type = "ASSET_TYPE_SECURITY" и security.type = bond).
    var bond: AssetBond? { get }
    
    /// Структурная нота (значение присваивается только для структурных продуктов, тип актива asset.type = "ASSET_TYPE_SECURITY" и security.type = sp).
    var structuredProduct: AssetStructuredProduct? { get }
    
    /// Фонд (значение присваивается только для фондов, тип актива asset.type = "ASSET_TYPE_SECURITY" и security.type = etf).
    var etf: AssetEtf? { get }
    
    /// Клиринговый сертификат участия (значение присваивается только для клиринговых сертификатов, тип актива asset.type = "ASSET_TYPE_SECURITY" и security.type = clearing_certificate).
    var clearingCertificate: AssetClearingCertificate? { get }
}

internal struct AssetSecurityModel: AssetSecurity {
    let isin: String
    
    let type: InstrumentType
    
    let kind: InstrumentKind
    
    let share: AssetShare?
    
    let bond: AssetBond?
    
    let structuredProduct: AssetStructuredProduct?
    
    let etf: AssetEtf?
    
    let clearingCertificate: AssetClearingCertificate?
}

internal extension AssetSecurityModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetSecurity) throws {
        self.isin = grpcModel.isin
        self.type = try .new(rawValue: grpcModel.type)
        self.kind = try .new(rawValue: grpcModel.instrumentKind.rawValue)
        self.share = try grpcModel.share.toModel()
        self.bond = grpcModel.bond.toModel()
        self.structuredProduct = try grpcModel.sp.toModel()
        self.etf = grpcModel.etf.toModel()
        self.clearingCertificate = grpcModel.clearingCertificate.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetSecurity {
    func toModel() throws -> AssetSecurityModel {
        try AssetSecurityModel(grpcModel: self)
    }
}
