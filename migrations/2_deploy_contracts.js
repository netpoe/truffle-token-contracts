var WalletToken1 = artifacts.require("WalletToken1");
var WalletToken2 = artifacts.require("WalletToken2");

module.exports = function(deployer) {
    deployer.deploy(WalletToken1);
    deployer.deploy(WalletToken2, {
        from: '0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef'
    });
};