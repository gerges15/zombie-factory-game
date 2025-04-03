// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./zombiefactory.sol";

interface KittyInterface {
    function getKitty(
        uint256 _id
    )
        external
        view
        returns (
            bool isGestating,
            bool isReady,
            uint256 cooldownIndex,
            uint256 nextActionAt,
            uint256 siringWithId,
            uint256 birthTime,
            uint256 matronId,
            uint256 sireId,
            uint256 generation,
            uint256 genes
        );
}

contract ZombieFeeding is ZombieFactory {
    function feedAndMultiply(uint _zombiId, uint _targetDna) public {
        require(msg.sender == zombieToOwner[_zombiId]);
        Zombie storage myZombie = zombies[_zombiId];
        _targetDna %= dnaModulus;
        uint newDna = (myZombie.dna + _targetDna) / 2;
        _createZombie("NoName", newDna);
    }
}
