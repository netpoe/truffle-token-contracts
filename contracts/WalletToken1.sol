pragma solidity ^0.4.15;

import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

contract WalletToken1 is StandardToken {
    string public name = 'WalletToken1';
    string public symbol = 'WT1';
    uint8 public decimals = 4;
    uint public INITIAL_SUPPLY = 1000000;

    function WalletToken1() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }
}