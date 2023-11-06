/// Идентификаторы инструмента.
public struct AssetInstrument: Codable {
    /// Uid идентификатор инструмента.
    public let uid: String
    
    /// Figi идентификатор инструмента.
    public let figi: String
    
    /// Тип инструмента.
    public let type: InstrumentType
    
    /// Вид инструмента.
    public let kind: InstrumentKind
    
    /// Тикер инструмента.
    public let ticker: String
    
    /// Класс-код (секция торгов).
    public let classCode: String
    
    /// Связанные инструменты.
    public let links: [InstrumentLink]
    
    /// Uid позиции.
    public let positionUid: String
}

internal extension AssetInstrument {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetInstrument) throws {
        self.uid = grpcModel.uid
        self.figi = grpcModel.figi
        self.type = try .new(rawValue: grpcModel.instrumentType)
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
