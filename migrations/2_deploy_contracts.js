var Voting = artifacts.require("./Voting.sol");

module.exports = function(deployer) {
  deployer.deploy(Voting, 2, ["0xf3956Cf4D3C6848fEF69b927581727cEfaC03225", "0x97df07f0a27543fe121529967be7341762286e61"]);
};
