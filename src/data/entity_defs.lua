
ENTITY_DEFS = {
    ['player'] = {
        animations = {
            ['idle'] = {
                frames = {1},
                texture = 'mario'
            },
            ['jump'] = {
                frames = {6},
                texture = 'mario'
            },
            ['death'] = {
                frames = {7},
                texture = 'mario'
            },
            ['run'] = {
                frames = {2, 3, 4},
                fps = 6,
                looping = true,
                texture = 'mario'
            },
            ['swim-idle'] = {
                frames = {10},
                texture = 'mario'
            },
            ['swim'] = {
                frames = {10, 11, 12, 13, 14},
                fps = 6,
                looping = true,
                texture = 'mario'
            }
        }
    }
}