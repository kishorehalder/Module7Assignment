// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract Calculator is Ownable {
    using SafeMath for uint256;

    uint256 public resultAdd;
    uint256 public resultSub;
    uint256 public resultMul;
    uint256 public resultDiv;

    function add(uint256 a, uint256 b) public onlyOwner {
        resultAdd = a.add(b);
    }

    function subtract(uint256 a, uint256 b) public onlyOwner {
        resultSub = a.sub(b);
    }

    function multiply(uint256 a, uint256 b) public onlyOwner {
        resultMul = a.mul(b);
    }

    function divide(uint256 a, uint256 b) public onlyOwner {
        require(b != 0, "Division by zero");
        resultDiv = a.div(b);
    }
}
