pragma solidity >=0.8.0;

contract DeadMansSwitch {
    uint256 lastCheckedBlock;
    uint256 balance;
    address owner;
    address payable secretsafe;

    constructor() payable {
        lastCheckedBlock = block.number;
        owner = msg.sender;
        secretsafe = payable(0x76577d204A5bd63b6D006222429c4D5124f4619c);
        balance = msg.value;
    }

    function IAmAlive() public {
        if(msg.sender == owner) {
            if(block.number - lastCheckedBlock <= 10) {
                lastCheckedBlock = block.number;
            } else {
                selfdestruct(secretsafe);
            }
        }
    }

    function checkToDestroy() public {
        if(block.number - lastCheckedBlock > 10) {
            selfdestruct(secretsafe);
        }
    }
}
