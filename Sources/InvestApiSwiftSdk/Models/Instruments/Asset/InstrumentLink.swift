/// Связь с другим инструментом.
public protocol InstrumentLink {
    /// Тип связи.
    var type: String { get }
    
    /// Uid идентификатор связанного инструмента.
    var instrumentUid: String { get }
}

internal struct InstrumentLinkModel: InstrumentLink {
    let type: String
    
    let instrumentUid: String
}

internal extension InstrumentLinkModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_InstrumentLink) {
        self.type = grpcModel.type
        self.instrumentUid = grpcModel.instrumentUid
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_InstrumentLink {
    func toModel() -> InstrumentLinkModel {
        InstrumentLinkModel(grpcModel: self)
    }
}
