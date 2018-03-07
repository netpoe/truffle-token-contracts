var WT1 = artifacts.require("./WalletToken1.sol");

contract('WT1', (accounts) => {

    let _creator = accounts[0];
    let buyer = accounts[1];
    let initialSupply = 1000000;
    let _price = 0.05; // ether
    let tokenPrice = web3.toWei(_price, 'ether');

    it("should have preset variables on contract creation", () => {
        var wt1;
        
        return WT1.deployed().then(instance => {
            wt1 = instance;
            return instance.creator.call();
        }).then(creator => {
            assert.equal(creator.valueOf(), _creator, 'address does not match creator address');
            return wt1.price.call();
        }).then(price => {
            assert.equal(price.valueOf(), tokenPrice, 'price is not the same');
            return wt1.totalSupply();
        }).then(supply => {
            assert.equal(supply.valueOf(), initialSupply, 'initialSupply is not the same');
            return;
        }).catch(error => {
            console.log(error);
        });
    });

    it("should sell WT1 tokens for ETH", () => {
        var wt1;

        var amount = 10;
        
        return WT1.deployed().then(instance => {
            wt1 = instance;
            instance.sellTo({
                from: buyer,
                value: web3.toWei(amount, 'ether')
            });
            return wt1.balanceOf(buyer);
        }).then(balance => {
            assert.equal(amount/_price, balance.toString(), 'buyer did not get his tokens');
            return;
        })
        .catch(error => {
            console.log(error);
        });
    });
});












