// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.20;

contract Staking {
    uint public total_stakes;
    uint public interest_per_day;

    struct Stake {
        uint amount;
        uint staking_days;
        uint start_time;
        uint last_time;
        bool active;
        uint rewards;
    }


    mapping(address => Stake[]) stakes;

    function stake(uint _days) external payable {
        require(_days == 7 || _days == 30 || _days == 90 || _days == 365, "Invalid number of staking days");

        Stake memory new_stake = Stake({
            amount: msg.value,
            staking_days: _days,
            start_time: block.timestamp,
            last_time: block.timestamp + (_days * 1 days),
            active: true,
            rewards: 0
        });

        stakes[msg.sender].push(new_stake);
        

    }

    function unstake(uint _index) external {
        
    }

    function is_lockin_period_over(uint _index) external view returns (bool) {}
}