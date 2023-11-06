/// Баланс позиции.
public struct PositionElement: Codable {
    /// Figi идентификатор инструмента.
    public let figi: String
    
    /// Тип инструмента.
    public let instrumentType: InstrumentType
    
    ///Уникальный идентификатор  инструмента.
    public let instrumentUid: String
    
    ///Уникальный идентификатор позиции.
    public let positionUid: String
    
    /// Текущий незаблокированный баланс.
    public let balance: Int64
    
    /// Количество бумаг заблокированных выставленными заявками.
    public let blocked: Int64
    
    /// Заблокировано на бирже.
    public let exchangeBlocked: Bool
}

internal extension PositionElement {    
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
    func toModel() -> PositionElement {
        PositionElement(grpcModel: self)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsFutures {
    func toModel() -> PositionElement {
        PositionElement(grpcModel: self)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsOptions {
    func toModel() -> PositionElement {
        PositionElement(grpcModel: self)
    }
}
