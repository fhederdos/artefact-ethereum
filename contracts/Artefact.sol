
pragma solidity ^0.5.0;

contract Artefact {
    event EventFired (uint someRandomValue);
    address owner;
    bytes32 name;
    constructor(bytes32 _name) public {
        owner = msg.sender;
        name = _name;
    }

    function closeContract(uint somePublicRandomValue) public returns (uint) {
      require(msg.sender == owner, "only the owner can close the contract");
      emit EventFired(somePublicRandomValue);
      return somePublicRandomValue;
    }
}

