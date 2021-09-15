const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TodoContarct", function () {
  it("add a new todo", async function () {
    const TodoContract = await hre.ethers.getContractFactory("TodoContract");
    const todoContract = await TodoContract.deploy();
    await todoContract.deployed();

    await todoContract.createTodo("First todo", "John Doe");

    const getFirstTodo = await todoContract.getTodo(0);

    console.dir(getFirstTodo, { depth: null });

    // expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});
