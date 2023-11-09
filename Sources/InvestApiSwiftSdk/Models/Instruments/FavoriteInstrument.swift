/// Краткая информация об избранном инструменте.
public protocol FavoriteInstrument {
    /// Figi-идентификатор инструмента.
    var figi: String { get }
    
    /// Тикер инструмента.
    var ticker: String { get }
    
    /// Класс-код (секция торгов).
    var classCode: String { get }
    
    /// Isin-идентификатор инструмента.
    var isin: String { get }
    
    /// Тип инструмента.
    var instrumentType: InstrumentType { get }
    
    /// Вид инструмента.
    var instrumentKind: InstrumentKind { get }
    
    /// Признак внебиржевой ценной бумаги.
    var otcFlag: Bool { get }
    
    /// Параметр указывает на возможность торговать инструментом через API.
    var apiTradeAvailableFlag: Bool { get }
}

internal struct FavoriteInstrumentModel: FavoriteInstrument {
    let figi: String
    
    let ticker: String
    
    let classCode: String
    
    let isin: String
    
    let instrumentType: InstrumentType
    
    let instrumentKind: InstrumentKind
    
    let otcFlag: Bool
    
    let apiTradeAvailableFlag: Bool
}

internal extension FavoriteInstrumentModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_FavoriteInstrument) throws {
        self.figi = grpcModel.figi
        self.ticker = grpcModel.ticker
        self.classCode = grpcModel.classCode
        self.isin = grpcModel.isin
        self.instrumentType = try .new(rawValue: grpcModel.instrumentType)
        self.instrumentKind = try .new(rawValue: grpcModel.instrumentKind.rawValue)
        self.otcFlag = grpcModel.otcFlag
        self.apiTradeAvailableFlag = grpcModel.apiTradeAvailableFlag
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_FavoriteInstrument {
    func toModel() throws -> FavoriteInstrumentModel {
        try FavoriteInstrumentModel(grpcModel: self)
    }
}
