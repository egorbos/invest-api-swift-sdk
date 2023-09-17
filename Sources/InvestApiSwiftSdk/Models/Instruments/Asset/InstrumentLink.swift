/// Связь с другим инструментом.
public struct InstrumentLink: Codable {
    /// Тип связи.
    let type: String
    
    /// Uid идентификатор связанного инструмента.
    let instrumentUid: String
}

internal extension InstrumentLink {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_InstrumentLink) {
        self.type = grpcModel.type
        self.instrumentUid = grpcModel.instrumentUid
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_InstrumentLink {
    func toModel() -> InstrumentLink {
        InstrumentLink(grpcModel: self)
    }
}