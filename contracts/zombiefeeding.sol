// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./zombiefactory.sol";

contract ZombieFeeding is ZombieFactory {
    function feedAndMultiply(uint _zombiId, uint _targetDna) public {
        require(msg.sender == zombieToOwner[_zombiId]);
        Zombie storage myZombie = zombies[_zombiId];
        _targetDna %= dnaModulus;
        uint newDna = (myZombie.dna + _targetDna) / 2;
        _createZombie("NoName", newDna);
    }
}
