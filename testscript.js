// Import necessary Hardhat and testing libraries
const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("Calculator Contract", function () {
  let owner;
  let calculator;

  before(async function () {
    // Deploy the Calculator contract before running tests
    [owner] = await ethers.getSigners();

    const Calculator = await ethers.getContractFactory("Calculator");
    calculator = await Calculator.deploy();
    await calculator.deployed();
  });

  it("should perform addition correctly", async function () {
    const num1 = 10;
    const num2 = 5;
    await calculator.add(num1, num2);
    const result = await calculator.resultAdd();

    expect(result).to.equal(num1 + num2);
  });

  it("should perform subtraction correctly", async function () {
    const num1 = 20;
    const num2 = 7;
    await calculator.subtract(num1, num2);
    const result = await calculator.resultSub();

    expect(result).to.equal(num1 - num2);
  });

  it("should perform multiplication correctly", async function () {
    const num1 = 6;
    const num2 = 8;
    await calculator.multiply(num1, num2);
    const result = await calculator.resultMul();

    expect(result).to.equal(num1 * num2);
  });

  it("should perform division correctly", async function () {
    const num1 = 50;
    const num2 = 10;
    await calculator.divide(num1, num2);
    const result = await calculator.resultDiv();

    expect(result).to.equal(num1 / num2);
  });

  it("should not allow division by zero", async function () {
    const num1 = 10;
    const num2 = 0;

    // Attempt to divide by zero, expect it to revert
    await expect(calculator.divide(num1, num2)).to.be.revertedWith("Division by zero");
  });

  it("should restrict access to owner for arithmetic functions", async function () {
    const num1 = 5;
    const num2 = 2;

    // Create a new signer that is not the owner
    const [, nonOwner] = await ethers.getSigners();

    // Attempt to perform addition as non-owner, expect it to revert
    await expect(calculator.connect(nonOwner).add(num1, num2)).to.be.revertedWith("Ownable: caller is not the owner");
  });
});
