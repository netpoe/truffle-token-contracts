pragma solidity ^0.4.15;

import './Buyable.sol';

contract WalletToken2 is Buyable(1000000, 4, 0.1 ether, 'WT2', 'WalletToken2') {
    
    function WalletToken2() public {}
    
}