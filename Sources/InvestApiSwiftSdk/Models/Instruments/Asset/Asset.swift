/// Информация об активе.
public protocol Asset {
    /// Уникальный идентификатор актива.
    var uid: String { get }
    
    /// Тип актива.
    var type: AssetType { get }
    
    /// Наименование актива.
    var name: String { get }
    
    /// Идентификаторы инструментов.
    var instruments: [AssetInstrument] { get }
}

internal struct AssetModel: Asset {
    let uid: String
    
    let type: AssetType
    
    let name: String
    
    let instruments: [AssetInstrument]
}

internal extension AssetModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Asset) throws {
        self.uid = grpcModel.uid
        self.type = try .new(rawValue: grpcModel.type.rawValue)
        self.name = grpcModel.name
        self.instruments = try grpcModel.instruments.map { try $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Asset {
    func toModel() throws -> AssetModel {
        try AssetModel(grpcModel: self)
    }
}
