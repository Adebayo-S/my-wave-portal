// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address[] persons;
    struct Count{
        uint timesWaved;
    }

    mapping (address => Count) counts;

    constructor() {
        console.log("Yo yo, I am a contract and I am smart");
    }

    function wave() public {
        totalWaves += 1;
        persons.push(msg.sender);
        for (uint i=0; i < persons.length; i++) {
            if (counts[persons[i]].timesWaved > 0) { 
                counts[persons[i]].timesWaved += 1;
            } else counts[persons[i]].timesWaved = 1;  
        }
        console.log("%s has waved %s times", msg.sender, counts[msg.sender].timesWaved);
        for (uint i=0; i < persons.length; i++) {
            counts[persons[i]].timesWaved = 0; 
        }              
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

}
