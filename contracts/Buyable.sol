pragma solidity ^0.4.15;

import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

contract Buyable is StandardToken {

    string public name;
    string public symbol;
    uint8 public decimals;
    uint public price;
    address public creator;

    function Buyable(
        uint _supply, 
        uint8 _decimals, 
        uint _price, 
        string _symbol, 
        string _name) public {
        totalSupply_ = _supply;
        decimals = _decimals;
        symbol = _symbol;
        name = _name;
        price = _price;
        creator = msg.sender;
        balances[msg.sender] = _supply;
    }

    function ()
        public
        payable {
        // Not enough gas for the transaction so prevent users from sending ether
        revert();
    }

    function sellTo() public payable returns (bool) {
        require(msg.value >= price);

        uint amount = msg.value.div(price);

        require(amount <= balances[creator]);

        require(creator.send(msg.value));

        balances[creator] = balances[creator].sub(amount);
        balances[msg.sender] = balances[msg.sender].add(amount);
        Transfer(creator, msg.sender, amount);

        return true;
    }
}




