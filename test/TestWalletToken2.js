var WT2 = artifacts.require("./WalletToken2.sol");

contract('WT2', (accounts) => {

    let _creator = accounts[2];
    let buyer = accounts[3];
    let initialSupply = 1000000;
    let _price = 0.1; // ether
    let tokenPrice = web3.toWei(_price, 'ether');

    it("should have preset variables on contract creation", () => {
        var wt2;
        
        return WT2.deployed().then(instance => {
            wt2 = instance;
            return instance.creator.call();
        }).then(creator => {
            assert.equal(creator.valueOf(), _creator, 'address does not match creator address');
            return wt2.price.call();
        }).then(price => {
            assert.equal(price.valueOf(), tokenPrice, 'price is not the same');
            return wt2.totalSupply();
        }).then(supply => {
            assert.equal(supply.valueOf(), initialSupply, 'initialSupply is not the same');
            return;
        }).catch(error => {
            console.log(error);
        });
    });

    it("should sell WT2 tokens for ETH", () => {
        var wt2;

        var amount = 10;
        
        return WT2.deployed().then(instance => {
            wt2 = instance;
            instance.sellTo({
                from: buyer,
                value: web3.toWei(amount, 'ether')
            });
            return wt2.balanceOf(buyer);
        }).then(balance => {
            assert.equal(amount/_price, balance.toString(), 'buyer did not get his tokens');
            return;
        })
        .catch(error => {
            console.log(error);
        });
    });
});












