var GangsterToken = artifacts.require("./GangsterToken.sol");
var GangsterTokensale = artifacts.require("./GangsterTokensale.sol");

module.exports = function(deployer) {

  deployer.deploy(GangsterToken, 1000000).then(function() {
    var tokenPrice = 1000000000000000; // in wei
    return deployer.deploy(GangsterTokensale, GangsterToken.address, tokenPrice);
  });
};
