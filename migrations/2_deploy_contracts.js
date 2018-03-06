var WalletToken1 = artifacts.require("WalletToken1");
var WalletToken2 = artifacts.require("WalletToken2");

module.exports = function(deployer) {
    deployer.deploy(WalletToken1);
    deployer.deploy(WalletToken2);
};