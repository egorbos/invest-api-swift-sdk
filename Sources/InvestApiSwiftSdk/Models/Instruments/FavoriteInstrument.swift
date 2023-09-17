/// Краткая информация об избранном инструменте.
public struct FavoriteInstrument: Codable {
    /// Figi-идентификатор инструмента.
    let figi: String
    
    /// Тикер инструмента.
    let ticker: String
    
    /// Класс-код (секция торгов).
    let classCode: String
    
    /// Isin-идентификатор инструмента.
    let isin: String
    
    /// Тип инструмента.
    let instrumentType: String
    
    /// Признак внебиржевой ценной бумаги.
    let otcFlag: Bool
    
    /// Параметр указывает на возможность торговать инструментом через API.
    let apiTradeAvailableFlag: Bool
    
    /// Вид инструмента.
    let kind: InstrumentKind
}

internal extension FavoriteInstrument {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_FavoriteInstrument) throws {
        self.figi = grpcModel.figi
        self.ticker = grpcModel.ticker
        self.classCode = grpcModel.classCode
        self.isin = grpcModel.isin
        self.instrumentType = grpcModel.instrumentType
        self.otcFlag = grpcModel.otcFlag
        self.apiTradeAvailableFlag = grpcModel.apiTradeAvailableFlag
        self.kind = try .new(rawValue: grpcModel.instrumentKind.rawValue)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_FavoriteInstrument {
    func toModel() throws -> FavoriteInstrument {
        try FavoriteInstrument(grpcModel: self)
    }
}
