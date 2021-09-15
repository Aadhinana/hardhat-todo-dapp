const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TodoContarct", function () {
  let todoContract;

  // Initialize the contract
  before(async function () {
    const TodoContract = await hre.ethers.getContractFactory("TodoContract");
    todoContract = await TodoContract.deploy();
    await todoContract.deployed();
  });

  it("adds and retrieves a new todo", async function () {
    await todoContract.createTodo("First todo", "John Doe");

    const getFirstTodo = await todoContract.getTodo(0);

    // console.dir(getFirstTodo, { depth: null });
    expect(getFirstTodo.content === "First todo");
    expect(getFirstTodo.author === "John Doe");
    // expect(await greeter.greet()).to.equal("Hola, mundo!");
  });

  it("throws error message when id does not exist", async function () {
    await expect(todoContract.getTodo(5)).to.be.revertedWith("Todo with that does not exist");
  })
});
