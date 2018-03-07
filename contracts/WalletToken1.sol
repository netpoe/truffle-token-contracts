pragma solidity ^0.4.15;

import './Buyable.sol';

contract WalletToken1 is Buyable(1000000, 4, 0.05 ether, 'WT1', 'WalletToken1') {
    
    function WalletToken1() public {}
    
}




