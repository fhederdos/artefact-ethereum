
pragma solidity ^0.5.0;

contract Artefact {
    
    event EventFired (uint someRandomValue)
    address[16] owner;
    bytes32 name;
    
    constructor(bytes32 _name) public {
        
        owner = msg.sender;

        name = _name;
    }

    function closeContract(uint somePublicRandomValue) pubic returns (uint) {
      reuqire(msg.sender == owner, "only the owner can close the contract");
      EventFired(somePublicRandomValue);
      return somePublicRandomValue;
    }
}

