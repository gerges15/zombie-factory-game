pragma solidity ^0.8.0;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    Zombie[] public zombies;
    Zombie girgis = Zombie("Girgis", 13432);

    struct Zombie {
        string name;
        uint dna;
    }

    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    }
}
