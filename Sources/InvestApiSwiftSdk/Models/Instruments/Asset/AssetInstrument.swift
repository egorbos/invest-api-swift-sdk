/// Идентификаторы инструмента.
public struct AssetInstrument: Codable {
    /// Uid идентификатор инструмента.
    let uid: String
    
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Тип инструмента.
    let type: String // MARK: CHANGE TO INSTRUMENT TYPE ??
    
    /// Вид инструмента.
    let kind: InstrumentKind
    
    /// Тикер инструмента.
    let ticker: String
    
    /// Класс-код (секция торгов).
    let classCode: String
    
    /// Связанные инструменты.
    let links: [InstrumentLink]
    
    /// Uid позиции.
    let positionUid: String
}

internal extension AssetInstrument {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetInstrument) throws {
        self.uid = grpcModel.uid
        self.figi = grpcModel.figi
        self.type = grpcModel.instrumentType
        self.ticker = grpcModel.ticker
        self.classCode = grpcModel.classCode
        self.links = grpcModel.links.map { $0.toModel() }
        self.kind = try .new(rawValue: grpcModel.instrumentKind.rawValue)
        self.positionUid = grpcModel.positionUid
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetInstrument {
    func toModel() throws -> AssetInstrument {
        try AssetInstrument(grpcModel: self)
    }
}
