/// Баланс позиции.
public protocol PositionElement {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Тип инструмента.
    var instrumentType: InstrumentType { get }
    
    ///Уникальный идентификатор  инструмента.
    var instrumentUid: String { get }
    
    ///Уникальный идентификатор позиции.
    var positionUid: String { get }
    
    /// Текущий незаблокированный баланс.
    var balance: Int64 { get }
    
    /// Количество бумаг заблокированных выставленными заявками.
    var blocked: Int64 { get }
    
    /// Заблокировано на бирже.
    var exchangeBlocked: Bool { get }
}

internal struct PositionElementModel: PositionElement {
    let figi: String
    
    let instrumentType: InstrumentType
    
    let instrumentUid: String
    
    let positionUid: String
    
    let balance: Int64
    
    let blocked: Int64
    
    let exchangeBlocked: Bool
}

internal extension PositionElementModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PositionsSecurities) {
        self.init(
            figi: grpcModel.figi,
            instrumentType: InstrumentType(rawValue: grpcModel.instrumentType) ?? .unspecified,
            instrumentUid: grpcModel.instrumentUid,
            positionUid: grpcModel.positionUid,
            balance: grpcModel.balance,
            blocked: grpcModel.blocked,
            exchangeBlocked: grpcModel.exchangeBlocked
        )
    }
    
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PositionsFutures) {
        self.init(
            figi: grpcModel.figi,
            instrumentType: InstrumentType.future,
            instrumentUid: grpcModel.instrumentUid,
            positionUid: grpcModel.positionUid,
            balance: grpcModel.balance,
            blocked: grpcModel.blocked,
            exchangeBlocked: false
        )
    }
    
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PositionsOptions) {
        self.init(
            figi: "",
            instrumentType: InstrumentType.option,
            instrumentUid: grpcModel.instrumentUid,
            positionUid: grpcModel.positionUid,
            balance: grpcModel.balance,
            blocked: grpcModel.blocked,
            exchangeBlocked: false
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsSecurities {
    func toModel() -> PositionElementModel {
        PositionElementModel(grpcModel: self)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsFutures {
    func toModel() -> PositionElementModel {
        PositionElementModel(grpcModel: self)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsOptions {
    func toModel() -> PositionElementModel {
        PositionElementModel(grpcModel: self)
    }
}
