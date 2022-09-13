import XCTest
@testable import InvestApiSwiftSdk

final class ApiClientTests: XCTestCase {
    func testCreateSandboxClientWithWrongParametersWillThrowError() throws {
        XCTAssertThrowsError(
            try InvestApiClient.sandbox("")
        )
        XCTAssertThrowsError(
            try InvestApiClient.sandbox("any", host: "")
        )
        XCTAssertThrowsError(
            try InvestApiClient.sandbox("any", port: 0)
        )
    }
    
    func testCreateCommonClientWithWrongParametersWillThrowError() throws {
        XCTAssertThrowsError(
            try InvestApiClient.common("")
        )
        XCTAssertThrowsError(
            try InvestApiClient.common("any", host: "")
        )
        XCTAssertThrowsError(
            try InvestApiClient.common("any", port: 0)
        )
    }
    
    func testCreateSandboxClient() throws {
        XCTAssertNotNil(
            try InvestApiClient.sandbox("any")
        )
    }
    
    func testCreateCommonClient() throws {
        XCTAssertNotNil(
            try InvestApiClient.common("any")
        )
    }
}
