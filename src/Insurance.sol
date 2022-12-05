pragma solidity ^0.8.0;

contract Insurance {
    struct Policy {
        address owner;
        uint256 premium;
        uint256 payout;
        bool active;
    }

    // Mapping from policy id to policy
    mapping(uint256 => Policy) public policies;

    // Array of all policy ids
    uint256[] public policyIds;

    // Nonce for generating unique policy ids
    uint256 public policyNonce;

    // Create a new policy with the given premium and payout
    function createPolicy(uint256 premium, uint256 payout) public {
        // Generate a unique id for the policy
        uint256 id = policyNonce;
        policyNonce++;

        // Create the policy
        Policy memory policy = Policy({
            owner: msg.sender,
            premium: premium,
            payout: payout,
            active: true
        });

        // Save the policy in the mapping
        policies[id] = policy;

        // Add the policy id to the array
        policyIds.push(id);
    }

    // Claim the payout for the given policy id
    function claim(uint256 policyId) public {
        // Get the policy
        Policy memory policy = policies[policyId];

        // Check that the policy is active
        require(policy.active, "Policy is not active");

        // Check that the caller is the policy owner
        require(policy.owner == msg.sender, "Only the policy owner can claim the payout");

        // Send the payout to the policy owner
        policy.owner.transfer(policy.payout);

        // Mark the policy as inactive
        policy.active = false;
    }
}
