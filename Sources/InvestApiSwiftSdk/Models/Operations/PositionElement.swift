/// Баланс позиции.
public struct PositionElement: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Тип инструмента.
    let type: InstrumentType
    
    ///Уникальный идентификатор  инструмента.
    let instrumentUid: String
    
    ///Уникальный идентификатор позиции.
    let positionUid: String
    
    /// Текущий незаблокированный баланс.
    let balance: Int64
    
    /// Количество бумаг заблокированных выставленными заявками.
    let blocked: Int64
    
    /// Заблокировано на бирже.
    let exchangeBlocked: Bool
}

internal extension PositionElement {    
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PositionsSecurities) {
        self.init(
            figi: grpcModel.figi,
            type: InstrumentType.share,
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
            type: InstrumentType.futures,
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
            type: InstrumentType.option,
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
