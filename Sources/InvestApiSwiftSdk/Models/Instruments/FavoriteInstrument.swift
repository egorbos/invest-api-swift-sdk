/// Краткая информация об избранном инструменте.
public struct FavoriteInstrument: Codable {
    /// Figi-идентификатор инструмента.
    public let figi: String
    
    /// Тикер инструмента.
    public let ticker: String
    
    /// Класс-код (секция торгов).
    public let classCode: String
    
    /// Isin-идентификатор инструмента.
    public let isin: String
    
    /// Тип инструмента.
    public let instrumentType: InstrumentType
    
    /// Вид инструмента.
    public let instrumentKind: InstrumentKind
    
    /// Признак внебиржевой ценной бумаги.
    public let otcFlag: Bool
    
    /// Параметр указывает на возможность торговать инструментом через API.
    public let apiTradeAvailableFlag: Bool
}

internal extension FavoriteInstrument {
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
    func toModel() throws -> FavoriteInstrument {
        try FavoriteInstrument(grpcModel: self)
    }
}
