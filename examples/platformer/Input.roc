module [Intent, read]

import rr.RocRay
import rr.Keys

Intent : [Walk Facing, Idle Facing]
Facing : [Left, Right]

read : RocRay.PlatformState, Facing -> Intent
read = \{ keys }, facing ->
    left = if Keys.anyDown keys [KeyLeft, KeyA] then Down else Up
    right = if Keys.anyDown keys [KeyRight, KeyD] then Down else Up

    when (left, right) is
        (Down, Up) -> Walk Left
        (Up, Down) -> Walk Right
        _same -> Idle facing
