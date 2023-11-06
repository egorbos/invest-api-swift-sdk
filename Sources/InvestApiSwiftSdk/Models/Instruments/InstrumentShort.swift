import Foundation

/// Краткая информация об инструменте.
public struct InstrumentShort: Codable {
    /// Figi-идентификатор инструмента.
    public let figi: String
    
    /// Уникальный идентификатор инструмента.
    public let uid: String
    
    /// Isin-идентификатор инструмента.
    public let isin: String

    /// Тикер инструмента.
    public let ticker: String

    /// Класс-код (секция торгов).
    public let classCode: String
    
    /// Название инструмента.
    public let name: String

    /// Тип инструмента.
    public let type: InstrumentType
    
    /// Вид инструмента.
    public let kind: InstrumentKind
    
    /// Уникальный идентификатор позиции инструмента.
    public let positionUid: String
    
    /// Признак доступности для ИИС.
    public let forIisFlag: Bool
    
    /// Параметр указывает на возможность торговать инструментом через API.
    public let apiTradeAvailableFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    public let forQualInvestorFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом по выходным.
    public let weekendFlag: Bool
    
    /// Флаг заблокированного ТКС.
    public let blockedTcaFlag: Bool
    
    /// Дата первой минутной свечи.
    public let firstOneMinCandleDate: Date
    
    /// Дата первой дневной свечи.
    public let firstOneDayCandleDate: Date
}

internal extension InstrumentShort {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_InstrumentShort) throws {
        self.figi = grpcModel.figi
        self.uid = grpcModel.uid
        self.isin = grpcModel.isin
        self.ticker = grpcModel.ticker
        self.classCode = grpcModel.classCode
        self.name = grpcModel.name
        self.type = try .new(rawValue: grpcModel.instrumentType)
        self.kind = try .new(rawValue: grpcModel.instrumentKind.rawValue)
        self.positionUid = grpcModel.positionUid
        self.forIisFlag = grpcModel.forIisFlag
        self.apiTradeAvailableFlag = grpcModel.apiTradeAvailableFlag
        self.forQualInvestorFlag = grpcModel.forQualInvestorFlag
        self.weekendFlag = grpcModel.weekendFlag
        self.blockedTcaFlag = grpcModel.blockedTcaFlag
        self.firstOneMinCandleDate = grpcModel.first1MinCandleDate.date
        self.firstOneDayCandleDate = grpcModel.first1DayCandleDate.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_InstrumentShort {
    func toModel() throws -> InstrumentShort {
        try InstrumentShort(grpcModel: self)
    }
}
