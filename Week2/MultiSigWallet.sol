pragma solidity ^0.8.1;

contract MultiSigWallet {
    address payable[] owners;
    address payable burnAddr = payable(0x0);
    mapping (address => uint256) ownervotes;

    constructor() payable {
        owners.push(payable(msg.sender));
        ownervotes[msg.sender] = 0;
    }

    function resetVotes() internal {
        for(uint256 i=0; i<owners.length; i++) {
             ownervotes[owners[i]] = 0;
         }
    }

    function checkApproval() internal view returns(bool) {
        for(uint256 i=0; i<owners.length; i++) {
             if(ownervotes[owners[i]] == 0) {
                return false;
             }
         }
         return true;
    }

    function sendVote() public {
         for(uint256 i=0; i<owners.length; i++) {
             if(owners[i] == msg.sender) {
                 ownervotes[msg.sender] = 1;
                 break;
             }
         }
    }

    function revokeVote() public {
         for(uint256 i=0; i<owners.length; i++) {
             if(owners[i] == msg.sender) {
                 ownervotes[msg.sender] = 0;
                 break;
             }
         }
    }

    function addKeyHolder(address _address) public returns(bool) {
        if(checkApproval()) {
            owners.push(payable(_address));
            ownervotes[_address] = 0;
            resetVotes();
            return true;
        }
        return false;
    }

    function removeKeyHolder(address _address) public returns(bool) {
        if(checkApproval()) {
            for(uint256 i=0; i<owners.length; i++) {
                if(owners[i] == _address) {
                    owners[i] = owners[owners.length - 1];
                    delete owners[owners.length - 1];
                    break;
                }
            }
            delete ownervotes[_address];
            resetVotes();
            return true;
        }
        return false;
    }

    function burn() public returns(bool) {
        if(checkApproval()) {
            burnAddr.transfer(0.05 ether);
            resetVotes();
            return true;
        }
        return false;
    }

    receive() external payable { }
}
