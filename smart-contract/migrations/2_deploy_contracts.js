const ToRAT = artifacts.require("ZenconToken");

module.exports = async function (deployer) {
    await deployer.deploy(ToRAT);
};
