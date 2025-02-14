//
//  AuctionHouseClient.swift
//  
//
//  Created by Michael J. Huber Jr. on 9/14/22.
//

import AuctionHouse
import Foundation
import Solana

public class AuctionHouseClient {
    let metaplex: Metaplex

    public init(metaplex: Metaplex) {
        self.metaplex = metaplex
    }

    func findByAddress(_ address: PublicKey, onComplete: @escaping (Result<Auctionhouse, OperationError>) -> Void) {
        let operation = FindAuctionHouseByAddressOperationHandler(metaplex: self.metaplex)
        operation.handle(operation: FindAuctionHouseByAddressOperation.pure(.success(address))).run { onComplete($0) }
    }

    func findByCreatorAndMint(_ creator: PublicKey, and treasuryMint: PublicKey, onComplete: @escaping (Result<Auctionhouse, OperationError>) -> Void) {
        let operation = FindAuctionHouseByCreatorAndMintOperationHandler(metaplex: self.metaplex)
        operation.handle(operation: FindAuctionHouseByCreatorAndMintOperation.pure(.success(
            FindAuctionHouseByCreatorAndMintInput(creator: creator, treasuryMint: treasuryMint)
        ))).run { onComplete($0) }
    }
}
