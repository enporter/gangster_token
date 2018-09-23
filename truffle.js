require('dotenv').config();
const HDWalletProvider = require('truffle-hdwallet-provider');

new HDWalletProvider(
  process.env.MNEMONIC,
  `https://rinkeby.infura.io/v3/${process.env.INFURIA_API_KEY}`
)

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: {
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(
          process.env.MNEMONIC,
          `https://rinkeby.infura.io/v3/${process.env.INFURIA_API_KEY}`
        )
      },
      gasPrice: 250000000000,
      network_id: 3
    },
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    }
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  }
};
