/// Тип полезной нагрузки в сообщении полученном из потока.
public enum StreamPayloadType {
    /// Проверка активности потока.
    case ping
    
    /// Данные.
    case data
}
