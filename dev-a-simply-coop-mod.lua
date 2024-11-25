-- name: A Simply Coop Mod
-- description: A Simply Coop Mod v1.3 DEV\nBy \\#ec7731\\ALEGAMeR M\n\n\\#dcdcdc\\Hello guys this is a A Simply Coop Mod! *Only compattible with sm64coopdx.*\n\nThis mod dont have special things ngl.\n\nThis simply coop mod its not a ordinary coop mod please dont confussion!
function bhv_custom_goomba_loop(obj)
    -- make goombas leap instead of just jump
    if obj.oGoombaJumpCooldown >= 9 then
        obj.oGoombaJumpCooldown = 8
        obj.oVelY = obj.oVelY + 20
        obj.oForwardVel = 20
    end
end

-- hook the behavior
id_bhvCustomGoomba = hook_behavior(id_bhvGoomba, OBJ_LIST_PUSHABLE, false, nil, bhv_custom_goomba_loop)

-- run mario
local speedThreshold = 50

local function mario_update(m)
    --Prevent mario from crouching or idling
    if m.action == ACT_IDLE or m.action == ACT_CROUCHING then
        set_mario_action(m, ACT_WALKING, 0)
    end

    -- Ensures that Mario moves at a speed greater than or equal to speedThreshold
    m.forwardVel = math.max(m.forwardVel,speedThreshold)
end

-- hooks --
hook_event(HOOK_MARIO_UPDATE, mario_update)

-- faster swimming 
if (m.action & ACT_FLAG_SWIMMING) ~= 0 then
    hScale = hScale * 2.0
    if m.action ~= ACT_WATER_PLUNGE then
        vScale = vScale * 2.0
    end
end

m.vel.x = m.vel.x * hScale
m.vel.y = m.vel.y * vScale
m.vel.z = m.vel.z * hScale
end

-----------
-- hooks --
-----------

hook_event(HOOK_BEFORE_PHYS_STEP, mario_before_phys_step)

local function mario_update(m)
    if (m.controller.buttonDown & A_BUTTON) ~= 0 then --If the A button is held
        m.vel.y = 25 --Set Y velocity to 25
    end
end

-- hooks --
hook_event(HOOK_MARIO_UPDATE, mario_update)

function mario_update(m)
    if (m.action & ACT_FLAG_AIR) ~= 0 then
        m.vel.y = m.vel.y + 1
    end
end

-----------
-- hooks --
-----------

hook_event(HOOK_MARIO_UPDATE, mario_update)

