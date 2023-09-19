/// Ценная бумага.
struct AssetSecurity: Codable {
    /// ISIN-идентификатор ценной бумаги.
    let isin: String
    
    /// Тип ценной бумаги.
    let type: String // MARK: CHANGE TO INSTRUMENT TYPE
    
    /// Вид инструмента.
    let kind: InstrumentKind
    
    /// Акция (значение присваивается только для акций, тип актива asset.type = "ASSET_TYPE_SECURITY" и security.type = share).
    let share: AssetShare?
    
    /// Облигация (значение присваивается только для облигаций, тип актива asset.type = "ASSET_TYPE_SECURITY" и security.type = bond).
    let bond: AssetBond?
    
    /// Структурная нота (значение присваивается только для структурных продуктов, тип актива asset.type = "ASSET_TYPE_SECURITY" и security.type = sp).
    let structuredProduct: AssetStructuredProduct?
    
    /// Фонд (значение присваивается только для фондов, тип актива asset.type = "ASSET_TYPE_SECURITY" и security.type = etf).
    let etf: AssetEtf?
    
    /// Клиринговый сертификат участия (значение присваивается только для клиринговых сертификатов, тип актива asset.type = "ASSET_TYPE_SECURITY" и security.type = clearing_certificate).
    let clearingCertificate: AssetClearingCertificate?
}

internal extension AssetSecurity {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetSecurity) throws {
        self.isin = grpcModel.isin
        self.type = grpcModel.type
        self.kind = try .new(rawValue: grpcModel.instrumentKind.rawValue)
        self.share = try grpcModel.share.toModel()
        self.bond = grpcModel.bond.toModel()
        self.structuredProduct = try grpcModel.sp.toModel()
        self.etf = grpcModel.etf.toModel()
        self.clearingCertificate = grpcModel.clearingCertificate.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetSecurity {
    func toModel() throws -> AssetSecurity {
        try AssetSecurity(grpcModel: self)
    }
}