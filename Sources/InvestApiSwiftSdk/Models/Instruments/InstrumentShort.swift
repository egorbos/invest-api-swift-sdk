import Foundation

/// Краткая информация об инструменте.
public protocol InstrumentShort {
    /// Figi-идентификатор инструмента.
    var figi: String { get }
    
    /// Уникальный идентификатор инструмента.
    var uid: String { get }
    
    /// Isin-идентификатор инструмента.
    var isin: String { get }

    /// Тикер инструмента.
    var ticker: String { get }

    /// Класс-код (секция торгов).
    var classCode: String { get }
    
    /// Название инструмента.
    var name: String { get }

    /// Тип инструмента.
    var type: InstrumentType { get }
    
    /// Вид инструмента.
    var kind: InstrumentKind { get }
    
    /// Уникальный идентификатор позиции инструмента.
    var positionUid: String { get }
    
    /// Признак доступности для ИИС.
    var forIisFlag: Bool { get }
    
    /// Параметр указывает на возможность торговать инструментом через API.
    var apiTradeAvailableFlag: Bool { get }
    
    /// Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    var forQualInvestorFlag: Bool { get }
    
    /// Флаг отображающий доступность торговли инструментом по выходным.
    var weekendFlag: Bool { get }
    
    /// Флаг заблокированного ТКС.
    var blockedTcaFlag: Bool { get }
    
    /// Дата первой минутной свечи.
    var firstOneMinCandleDate: Date { get }
    
    /// Дата первой дневной свечи.
    var firstOneDayCandleDate: Date { get }
}

internal struct InstrumentShortModel: InstrumentShort {
    let figi: String
    
    let uid: String
    
    let isin: String
    
    let ticker: String
    
    let classCode: String
    
    let name: String
    
    let type: InstrumentType
    
    let kind: InstrumentKind
    
    let positionUid: String
    
    let forIisFlag: Bool
    
    let apiTradeAvailableFlag: Bool
    
    let forQualInvestorFlag: Bool
    
    let weekendFlag: Bool
    
    let blockedTcaFlag: Bool
    
    let firstOneMinCandleDate: Date
    
    let firstOneDayCandleDate: Date
}

internal extension InstrumentShortModel {
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
    func toModel() throws -> InstrumentShortModel {
        try InstrumentShortModel(grpcModel: self)
    }
}
