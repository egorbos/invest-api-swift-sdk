import Foundation

/// Краткая информация об инструменте.
public struct InstrumentShort: Codable {
    /// Figi-идентификатор инструмента.
    let figi: String
    
    /// Уникальный идентификатор инструмента.
    let uid: String
    
    /// Isin-идентификатор инструмента.
    let isin: String

    /// Тикер инструмента.
    let ticker: String

    /// Класс-код (секция торгов).
    let classCode: String
    
    /// Название инструмента.
    let name: String

    /// Тип инструмента.
    let type: String // MARK: CHANGE TO INSTRUMENT TYPE ??
    
    /// Вид инструмента.
    let kind: InstrumentKind
    
    /// Уникальный идентификатор позиции инструмента.
    let positionUid: String
    
    /// Признак доступности для ИИС.
    let forIisFlag: Bool
    
    /// Параметр указывает на возможность торговать инструментом через API.
    let apiTradeAvailableFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    let forQualInvestorFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом по выходным.
    let weekendFlag: Bool
    
    /// Флаг заблокированного ТКС.
    let blockedTcaFlag: Bool
    
    /// Дата первой минутной свечи.
    let firstOneMinCandleDate: Date
    
    /// Дата первой дневной свечи.
    let firstOneDayCandleDate: Date
}

internal extension InstrumentShort {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_InstrumentShort) throws {
        self.figi = grpcModel.figi
        self.uid = grpcModel.uid
        self.isin = grpcModel.isin
        self.ticker = grpcModel.ticker
        self.classCode = grpcModel.classCode
        self.name = grpcModel.name
        self.type = grpcModel.instrumentType
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
