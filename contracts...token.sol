pragma solidity ^0.5.0;

contract Budgie {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    uint256 public initialSupply;
    address public owner;

    mapping(address => uint256) public balanceOf;

    constructor() public {
        name = "Budgie";
        symbol = "BDG";
        decimals = 8;
        initialSupply = 500000 * 10**uint256(decimals);
        totalSupply = initialSupply;
        owner = msg.sender;
        balanceOf[owner] = totalSupply;
    }

    function _transfer(address _from, address _to, uint256 _value) internal {
        require (balanceOf [_from] >= _value, "You're trying to send more than you own.");
        require (_to != address (0), "Address can't be empty.");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        // emit Transfer(_from, _to, _value);
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        _transfer(msg.sender, _to, _value);
        return true;
    }
}
