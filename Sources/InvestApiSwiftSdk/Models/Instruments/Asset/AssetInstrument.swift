/// Идентификаторы инструмента.
public protocol AssetInstrument {
    /// Uid идентификатор инструмента.
    var uid: String { get }
    
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Тип инструмента.
    var type: InstrumentType { get }
    
    /// Вид инструмента.
    var kind: InstrumentKind { get }
    
    /// Тикер инструмента.
    var ticker: String { get }
    
    /// Класс-код (секция торгов).
    var classCode: String { get }
    
    /// Связанные инструменты.
    var links: [InstrumentLink] { get }
    
    /// Uid позиции.
    var positionUid: String { get }
}

internal struct AssetInstrumentModel: AssetInstrument {
    let uid: String
    
    let figi: String
    
    let type: InstrumentType
    
    let kind: InstrumentKind
    
    let ticker: String
    
    let classCode: String
    
    let links: [InstrumentLink]
    
    let positionUid: String
}

internal extension AssetInstrumentModel {
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
    func toModel() throws -> AssetInstrumentModel {
        try AssetInstrumentModel(grpcModel: self)
    }
}
