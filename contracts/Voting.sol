pragma solidity ^0.4.4;

contract Voting {
    mapping (address => bool) eligibility;
  
    struct Candidate {
        uint256 totalVote;
    }
    
    uint nCandidate;
    Candidate[256] candidates;
    
    function Voting(uint numberOfCandidate, address[] whitelist) public {
        nCandidate = numberOfCandidate;
        for(uint i = 0; i < whitelist.length; i++){
            eligibility[whitelist[i]] = true;
        }
    }
    
    function vote(uint candidate) public {
        assert(eligibility[msg.sender] == true);
        assert(candidate < nCandidate);
        
        uint256 prevote = candidates[candidate].totalVote;
        candidates[candidate].totalVote += 1; 
        eligibility[msg.sender] = false;
        
        if(candidates[candidate].totalVote - prevote != 1) revert();
    }
    
    function checkEligibility() public constant returns (bool) {
        return eligibility[msg.sender];
    }
    
    function totalVote(uint candidate) public constant returns (uint) {
        assert(candidate < nCandidate);
        return candidates[candidate].totalVote;
    }
}