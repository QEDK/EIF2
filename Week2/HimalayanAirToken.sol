pragma solidity >=0.7.0 <0.8.0;

abstract contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public virtual;
}

contract StandardToken {
    function transfer(address _to, uint256 _value) public returns (bool success) {
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            emit Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            emit Transfer(_from, _to, _value);
            return true;
        } else { return false; }
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
}

contract HimalayanAirToken is StandardToken {
    string public name;
    uint8 public decimals;
    string public symbol;
    uint256 public _totalSupply;

    function totalSupply() public view returns (uint256 supply) { return _totalSupply; }

    constructor() {
        balances[msg.sender] = uint256(100000000000000);
        _totalSupply = uint256(100000000000000);
        name = "Himalayan Air Token";
        decimals = 12;
        symbol = "HAT";
        emit Transfer(address(0), 0x76577d204A5bd63b6D006222429c4D5124f4619c, _totalSupply);
    }

    function approveAndCall(address spender, uint tokens, bytes memory data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, address(this), data);
        return true;
    }
}
