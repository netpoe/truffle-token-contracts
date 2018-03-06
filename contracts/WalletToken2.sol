pragma solidity ^0.4.15;

import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

contract WalletToken2 is StandardToken {
    string public name = 'WalletToken2';
    string public symbol = 'WT2';
    uint8 public decimals = 4;
    uint public INITIAL_SUPPLY = 1000000;

    function WalletToken2() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }
}