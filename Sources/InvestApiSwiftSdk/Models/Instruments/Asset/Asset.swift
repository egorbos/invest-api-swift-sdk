/// Информация об активе.
public struct Asset: Codable {
    /// Уникальный идентификатор актива.
    public let uid: String
    
    /// Тип актива.
    public let type: AssetType
    
    /// Наименование актива.
    public let name: String
    
    /// Идентификаторы инструментов.
    public let instruments: [AssetInstrument]
}

internal extension Asset {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Asset) throws {
        self.uid = grpcModel.uid
        self.type = try .new(rawValue: grpcModel.type.rawValue)
        self.name = grpcModel.name
        self.instruments = try grpcModel.instruments.map { try $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Asset {
    func toModel() throws -> Asset {
        try Asset(grpcModel: self)
    }
}
