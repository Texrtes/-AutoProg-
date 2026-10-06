--[[
    PremConfigs.lua
    Node Progression & Tower Definitions for AutoProg
]]--

local Config = {
    -- -----------------------------------------------------------------
    -- Node Progression Configuration
    -- -----------------------------------------------------------------
    Nodes = {
        ["Node 0"] = {
            TowerToBuy = { "Assassin" }, -- Node 0 goal: Buy Assassin before moving to Node 1
            [1] = {
                Level = 0, -- Level required: 0 or above
                TowersCheck = { "Scout", "Sniper" },
                TowersToEquip = { "Scout", "Sniper" },
                TowerToBuy = { "Assassin" },
                StoryMode = { "Boot Camp", "Live Fire", "Breach Protocol", "Brute Force" }, -- Story Missions
                scripts = {
                    ["Boot Camp"] = "https://raw.githubusercontent.com/Atxvy/Main/refs/heads/main/...",
                    ["Live Fire"] = "https://raw.githubusercontent.com/Atxvy/Main/refs/heads/main/...",
                    ["Breach Protocol"] = "https://raw.githubusercontent.com/Atxvy/Main/refs/heads/main/...",
                    ["Brute Force"] = "https://raw.githubusercontent.com/Atxvy/Main/refs/heads/main/...",
                }
            }
        },
        ["Node 1"] = {
            TowerToBuy = { "Soldier" }, -- Node 1 goal
            LevelGoals = 15, -- Level target for Node 1
            [1] = {
                Level = 0, -- Level required: 0 or above
                LevelGoals = 15,
                TowersCheck = { "Scout", "Sniper" },
                TowersToEquip = { "Scout", "Sniper", "Assassin" },
                Modes = "Intermidiete", -- Match difficulty / mode
                TowerToBuy = { "Commander" }, -- Node 1 things to do: Grind coins until Soldier is purchased
                Maps = { "Simplicity", "Four Paths", "Grass Isle" }, -- Available Maps
                scripts = {
                    ["Simplicity"] = "https://raw.githubusercontent.com/Vtzey/AutoProg/main/Strats/Inter/Simplicity.lua",
                }
            }
        },
        ["Node 2"] = {
		LevelGoals = 50,
            [1] = {
                Level = 30, -- Level required: 15 or above
				LevelGoals = 50,
                TowersCheck = { "Scout", "Sniper", "Assassin", "Soldier" },
                TowersToEquip = { "Scout", "Sniper", "Assassin", "Soldier" },
                Maps = { "Simplicity", "Cyber City", "Nether" }, -- Available Maps
                scripts = {
                    ["Simplicity"] = "https://raw.githubusercontent.com/Vtzey/AutoProg/main/Strats/Inter/Simplicity.lua",
                }
            }
        }
    },
	
	 -- -----------------------------------------------------------------
    -- Modifers & Bonus Rewards & Maps Rewards Scaling
    -- -----------------------------------------------------------------
	
	 Modifiers = {
	 -- Modifiers name    --Multiplyer bonus WIN only  STACKS if multiple is choiced 
	 ["Speedy Enemies"] = 0.25,
	 ["Glass"] = 0.05, -- this is % 0.05 > 100% + 5% get it?
	 ["Quarantine"] = 0.20,
	 ["Fog"] = 0.20,
	 ["Limitation"] = 0.10,
	 ["Flying Enemies"] = 0.15,
	 ["Jailed Towers"] = 0.20,
	 ["Exploading Enemies"] = 0.2,
	 ["Inflation"] = 0.30,
	 ["Committed"] = 0.10,
	 ["Hidden Enemies"] = 0.10,
	 ["Broke"] = 0.30,
	 ["Healthy Enemies"] = 0.30,
	 },
	 
	 -- DOES NOT APPLY IN HARDCORE/GEMS remember!
	 MapScaling = {
	 ["Very Easy"] = 0.5,
	 ["Easy"] = 0.85, -- 
	 ["Normal"] = 1, -- Normal Rewards 
	 ["Hard"] = 1.25,
	 ["Insane"] = 1.5, -- rewards is 150% coins stack with mods  example 150% = 0.95% = ? 
	 },
	
    -- -----------------------------------------------------------------
    -- Tower Lists & Costs
    -- -----------------------------------------------------------------
    TowerList = {
        ["Coins"] = {
            { Name = "Scout", Cost = 0 },
            { Name = "Sniper", Cost = 50 },
            { Name = "Paintballer", Cost = 100 },
            { Name = "Demoman", Cost = 200 },
            { Name = "Boomerang", Cost = 300 },
            { Name = "Slime Trooper", Cost = 300 },
            { Name = "Soldier", Cost = 350 },
            { Name = "Freezer", Cost = 650 },
            { Name = "Militant", Cost = 800 },
            { Name = "Assassin", Cost = 800 },
            { Name = "Shotgunner", Cost = 850 },
            { Name = "Hunter", Cost = 1000 },
            { Name = "Pyromancer", Cost = 1250 },
            { Name = "Ace Pilot", Cost = 1500 },
            { Name = "Farm", Cost = 2000 },
            { Name = "Medic", Cost = 2000 },
            { Name = "Rocketeer", Cost = 2500 },
            { Name = "Electroshocker", Cost = 2500 },
            { Name = "Trapper", Cost = 3000 },
            { Name = "Pulse Trooper", Cost = 3250 },
            { Name = "Commander", Cost = 4000 },
            { Name = "Military Base", Cost = 4000 },
            { Name = "DJ Booth", Cost = 5000 },
            { Name = "Tesla", Cost = 6000 },
            { Name = "Minigunner", Cost = 8000 },
            { Name = "Ranger", Cost = 12000 },
            { Name = "Pursuit", Cost = 15000 },
            { Name = "Gatling Gun", Cost = 35000 },
        },
        ["Gems"] = {
            { Name = "Accelerator", Cost = 2500 },
            { Name = "Brawler", Cost = 1250 },
            { Name = "Necromancer", Cost = 2250 },
            { Name = "Engineer", Cost = 4500 },
            { Name = "Hacker", Cost = 5500 },
        },
        ["Evo"] = {
            { Name = "EvolvedOperator", Coins = 15000, Gems = 4500 },
            { Name = "EvolvedEnforcer", Coins = 15000, Gems = 5000 },
            { Name = "EvolvedKingpin", Coins = 15000, Gems = 5500 },  
            { Name = "EvolvedJuggernaut", Coins = 15000, Gems = 6000 },
        },
        ["Golden"] = {
            { Name = "Golden Scout", Cost = 50000 },
            { Name = "Golden Demoman", Cost = 50000 },
            { Name = "Golden Soldier", Cost = 50000 },
            { Name = "Golden Pyromancer", Cost = 50000 },
            { Name = "Golden Crook Boss", Cost = 50000 },
            { Name = "Golden Minigunner", Cost = 50000 },
            { Name = "Golden Cowboy", Cost = 50000 },
        },
    },

    -- -----------------------------------------------------------------
    -- Skill Tree Priority Upgrade (Late Game Progression)
    -- -----------------------------------------------------------------
    SkillTreePrioUpgrad = {
        NodeIds = {
            1, 2, 3, 4, 5, 6, 7, 8, 9,
            10, 11, 12, 13, 14, 15, 16, 17
        },

        Names = {
            [1] = "Enhanced Optics",
            [2] = "Resourcefulness",
            [3] = "Fortify",
            [4] = "Over-Heal",
            [5] = "Fight Dirty",
            [6] = "Extreme Conditioning",
            [7] = "Stonks",
            [8] = "Expanded Barracks",
            [9] = "Improved Gunpowder",
            [10] = "Beefed Up Minions",
            [11] = "Precision",
            [12] = "Scavenger",
            [13] = "Accelerator",
            [14] = "Re-enforcements",
            [15] = "Bigger Budget",
            [16] = "Bandages",
            [17] = "Scholar"
        },

        Priority = {
            {Id = 2, TargetLevel = 10},
            {Id = 15, TargetLevel = 10},
            {Id = 7, TargetLevel = 10},
            {Id = 13, TargetLevel = 10},
            {Id = 1, TargetLevel = 10},
            {Id = 8, TargetLevel = 10},
            {Id = 9, TargetLevel = 10},
            {Id = 5, TargetLevel = 10},
            {Id = 3, TargetLevel = 10},
            {Id = 4, TargetLevel = 10},
            {Id = 16, TargetLevel = 10},
            {Id = 6, TargetLevel = 10},
            {Id = 10, TargetLevel = 10},
            {Id = 15, TargetLevel = 25},
            {Id = 9, TargetLevel = 25},
            {Id = 10, TargetLevel = 25},
            {Id = 7, TargetLevel = 20},
            {Id = 13, TargetLevel = 25},
            {Id = 1, TargetLevel = 20},
            {Id = 8, TargetLevel = 20},
            {Id = 2, TargetLevel = 25},
            {Id = 5, TargetLevel = 25},
            {Id = 4, TargetLevel = 25},
            {Id = 16, TargetLevel = 25},
            {Id = 6, TargetLevel = 25},
            {Id = 3, TargetLevel = 40},
            {Id = 11, TargetLevel = 15},
            {Id = 17, TargetLevel = 20},
            {Id = 12, TargetLevel = 20},
            {Id = 14, TargetLevel = 10}
        }
    },
}

-- Alias for convenience
Config.SkillTreePrioUpgrade = Config.SkillTreePrioUpgrad

-- Support numeric index indexing: Nodes[0] == Nodes["Node 0"], Nodes[1] == Nodes["Node 1"], Nodes[2] == Nodes["Node 2"]
Config.Nodes[0] = Config.Nodes["Node 0"]
Config.Nodes[1] = Config.Nodes["Node 1"]
Config.Nodes[2] = Config.Nodes["Node 2"]

return Config