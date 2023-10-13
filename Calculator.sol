pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Calculator is Ownable {
    using SafeMath for uint256;

    uint256 public additionResult;
    uint256 public subtractionResult;
    uint256 public multiplicationResult;
    uint256 public divisionResult;

    function add(uint256 a, uint256 b) public onlyOwner returns (uint256) {
        additionResult = a.add(b);
        return additionResult;
    }

    function subtract(uint256 a, uint256 b) public onlyOwner returns (uint256) {
        subtractionResult = a.sub(b);
        return subtractionResult;
    }

    function multiply(uint256 a, uint256 b) public onlyOwner returns (uint256) {
        multiplicationResult = a.mul(b);
        return multiplicationResult;
    }

    function divide(uint256 a, uint256 b) public onlyOwner returns (uint256) {
        require(b > 0, "Divisor cannot be zero");
        divisionResult = a.div(b);
        return divisionResult;
    }

    function getResult(string memory operation) public view returns (uint256) {
        if (keccak256(abi.encodePacked(operation)) == keccak256(abi.encodePacked("add"))) {
            return additionResult;
        } else if (keccak256(abi.encodePacked(operation)) == keccak256(abi.encodePacked("sub"))) {
            return subtractionResult;
        } else if (keccak256(abi.encodePacked(operation)) == keccak256(abi.encodePacked("mul"))) {
            return multiplicationResult;
        } else if (keccak256(abi.encodePacked(operation)) == keccak256(abi.encodePacked("div"))) {
            return divisionResult;
        } else {
            revert("Invalid operation");
        }
    }
}
