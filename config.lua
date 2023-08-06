Config = Config or {}

Config.MoneyReward = math.random(18, 26)

--33% on each to get money/an item or nothing
Config.RewardTypes = {
    [1] = {
        type = "item"
    },
    [2] = {
        type = "money",
    },
    [3] = {
        type = "nothing",
    }
}

--You can configer items you wanet for each object
Config.Rewardes = {
    ['dumpstares'] = {
        [1] = {item = "recyclablematerial", minAmount = 5, maxAmount = 8},
        [2] = {item = "lockpick", minAmount = 1, maxAmount = 1},
        [3] = {item = "plastic", minAmount = 1, maxAmount = 1},
    },
    ['aircon'] = {
        [1] = {item = "sandwich", minAmount = 5, maxAmount = 8},
        [2] = {item = "lockpick", minAmount = 1, maxAmount = 1},
        [3] = {item = "plastic", minAmount = 1, maxAmount = 1},
    },
}

-- Add More Object For Searching
Config.Objects = {
    [`prop_dumpster_01a`] = 'dumpstares',
    [`prop_dumpster_02a`] = 'dumpstares',
    [`prop_dumpster_02b`] = 'dumpstares',
    [`prop_dumpster_3a`] = 'dumpstares',
    [`prop_dumpster_4a`] = 'dumpstares',
    [`prop_dumpster_4b`] = 'dumpstares',
    [`prop_bin_01a`] = 'dumpstares',
    [`prop_bin_14b`] = 'dumpstares',
    [`prop_bin_14a`] = 'dumpstares',
    [`prop_bin_08a`] = 'dumpstares',
    [`prop_bin_05a`] = 'dumpstares',
    [`prop_bin_07c`] = 'dumpstares',
    [`prop_rub_binbag_03`] = 'dumpstares',
    [`prop_rub_binbag_01b`] = 'dumpstares',
    [`prop_rub_binbag_06`] = 'dumpstares',
    [`prop_aircon_m_04`] = 'aircon',
    [`prop_aircon_m_06`] = 'aircon',
    [`prop_aircon_m_07`] = 'aircon',
    [`prop_aircon_m_02`] = 'aircon',
}