module [
    Sprite,
    imagePath,
    load,
    rect,
    blockBrown,
    blockBrownBroken,
    blockGreen,
    blockGreenKey,
    blockGreenLock,
    blockGreenPuzzle,
    blockGrey,
    blockGreyBroken,
    blockRed,
    blockRedKey,
    blockRedLock,
    blockRedPuzzle,
    blueCrystal,
    blueGem,
    blueJewel,
    buttonFloor,
    buttonFloorPressed,
    buttonGreen,
    buttonGreenPressed,
    buttonRed,
    buttonRedPressed,
    discGreen,
    discRed,
    doorGreen,
    doorGreenLock,
    doorGreenTop,
    doorOpen,
    doorOpenTop,
    doorRed,
    doorRedLock,
    doorRedTop,
    enemyFloating1,
    enemyFloating2,
    enemyFloating3,
    enemyFloating4,
    enemyFlyingAlt1,
    enemyFlyingAlt2,
    enemyFlyingAlt3,
    enemyFlyingAlt4,
    enemyFlying1,
    enemyFlying2,
    enemyFlying3,
    enemyFlying4,
    enemySpikey1,
    enemySpikey2,
    enemySpikey3,
    enemySpikey4,
    enemySwimming1,
    enemySwimming2,
    enemySwimming3,
    enemySwimming4,
    enemyWalking1,
    enemyWalking2,
    enemyWalking3,
    enemyWalking4,
    fence,
    fenceBroken,
    fenceLeft,
    fenceMid,
    fenceOpen,
    fenceRight,
    flagGreenDown,
    flagGreenUp,
    flagRedDown,
    flagRedUp,
    fluidBlue,
    fluidBlueTop,
    fluidBrown,
    fluidBrownTop,
    fluidGreen,
    fluidGreenTop,
    fluidRed,
    fluidRedTop,
    greenCrystal,
    greenGem,
    greenJewel,
    keyGreen,
    keyRed,
    ladderNarrowMid,
    ladderNarrowTop,
    ladderWideMid,
    ladderWideTop,
    lockGreen,
    lockGreenBottom,
    lockGreenLeft,
    lockGreenLock,
    lockGreenMid,
    lockGreenRight,
    lockGreenTop,
    lockRed,
    lockRedBottom,
    lockRedLeft,
    lockRedLock,
    lockRedMid,
    lockRedRight,
    lockRedTop,
    outlineCrystal,
    outlineDisc,
    outlineDiscAlt,
    outlineGem,
    outlineJewel,
    outlineKey,
    outlinePuzzle,
    plantBlue1,
    plantBlue2,
    plantBlue3,
    plantBlue4,
    plantBlue5,
    plantBlue6,
    plantBottom1,
    plantBottom2,
    plantDark1,
    plantDark2,
    plantDark3,
    plantDark4,
    plantDark5,
    plantDark6,
    plantGreen1,
    plantGreen2,
    plantGreen3,
    plantGreen4,
    plantGreen5,
    plantGreen6,
    plantLeaves1,
    plantLeaves3,
    plantRed1,
    plantRed2,
    plantRed3,
    plantRed4,
    plantRed5,
    plantRed6,
    plantStemTleft,
    plantStemTright,
    plantStemCornerLeft,
    plantStemCornerRight,
    plantStemCross,
    plantStemHorizontal,
    plantStemVertical,
    plantThornsHorizontal,
    plantThornsVertical,
    plantTopBlue,
    plantTopLeaves,
    plantTopRed,
    plantTopYellow,
    playerBlueDead,
    playerBlueDuck,
    playerBlueFall,
    playerBlueHit,
    playerBlueRoll,
    playerBlueStand,
    playerBlueSwim1,
    playerBlueSwim2,
    playerBlueSwitch1,
    playerBlueSwitch2,
    playerBlueUp1,
    playerBlueUp2,
    playerBlueUp3,
    playerBlueWalk1,
    playerBlueWalk2,
    playerBlueWalk3,
    playerBlueWalk4,
    playerBlueWalk5,
    playerGreenDead,
    playerGreenDuck,
    playerGreenFall,
    playerGreenHit,
    playerGreenRoll,
    playerGreenStand,
    playerGreenSwim1,
    playerGreenSwim2,
    playerGreenSwitch1,
    playerGreenSwitch2,
    playerGreenUp1,
    playerGreenUp2,
    playerGreenUp3,
    playerGreenWalk1,
    playerGreenWalk2,
    playerGreenWalk3,
    playerGreenWalk4,
    playerGreenWalk5,
    playerGreyDead,
    playerGreyDuck,
    playerGreyFall,
    playerGreyHit,
    playerGreyRoll,
    playerGreyStand,
    playerGreySwim1,
    playerGreySwim2,
    playerGreySwitch1,
    playerGreySwitch2,
    playerGreyUp1,
    playerGreyUp2,
    playerGreyUp3,
    playerGreyWalk1,
    playerGreyWalk2,
    playerGreyWalk3,
    playerGreyWalk4,
    playerGreyWalk5,
    playerRedDead,
    playerRedDuck,
    playerRedFall,
    playerRedHit,
    playerRedRoll,
    playerRedStand,
    playerRedSwim1,
    playerRedSwim2,
    playerRedSwitch1,
    playerRedSwitch2,
    playerRedUp1,
    playerRedUp2,
    playerRedUp3,
    playerRedWalk1,
    playerRedWalk2,
    playerRedWalk3,
    playerRedWalk4,
    playerRedWalk5,
    puzzleGreen,
    puzzleRed,
    redCrystal,
    redGem,
    redJewel,
    signArrow,
    signArrowBL,
    signArrowBR,
    signArrowTL,
    signArrowTR,
    signArrowDown,
    signArrowLeft,
    signArrowRight,
    signArrowUp,
    signLarge,
    signSmall,
    signpost,
    spikesHigh,
    spikesLow,
    switchGreenLeft,
    switchGreenMid,
    switchGreenOff,
    switchGreenOn,
    switchGreenRight,
    switchRedLeft,
    switchRedMid,
    switchRedOff,
    switchRedOn,
    switchRedRight,
    tileBlue01,
    tileBlue02,
    tileBlue03,
    tileBlue04,
    tileBlue05,
    tileBlue06,
    tileBlue07,
    tileBlue08,
    tileBlue09,
    tileBlue10,
    tileBlue11,
    tileBlue12,
    tileBlue13,
    tileBlue14,
    tileBlue15,
    tileBlue16,
    tileBlue17,
    tileBlue18,
    tileBlue19,
    tileBlue20,
    tileBlue21,
    tileBlue22,
    tileBlue23,
    tileBlue24,
    tileBlue25,
    tileBlue26,
    tileBlue27,
    tileBrown01,
    tileBrown02,
    tileBrown03,
    tileBrown04,
    tileBrown05,
    tileBrown06,
    tileBrown07,
    tileBrown08,
    tileBrown09,
    tileBrown10,
    tileBrown11,
    tileBrown12,
    tileBrown13,
    tileBrown14,
    tileBrown15,
    tileBrown16,
    tileBrown17,
    tileBrown18,
    tileBrown19,
    tileBrown20,
    tileBrown21,
    tileBrown22,
    tileBrown23,
    tileBrown24,
    tileBrown25,
    tileBrown26,
    tileBrown27,
    tileGreen01,
    tileGreen02,
    tileGreen03,
    tileGreen04,
    tileGreen05,
    tileGreen06,
    tileGreen07,
    tileGreen08,
    tileGreen09,
    tileGreen10,
    tileGreen11,
    tileGreen12,
    tileGreen13,
    tileGreen14,
    tileGreen15,
    tileGreen16,
    tileGreen17,
    tileGreen18,
    tileGreen19,
    tileGreen20,
    tileGreen21,
    tileGreen22,
    tileGreen23,
    tileGreen24,
    tileGreen25,
    tileGreen26,
    tileGreen27,
    tileYellow01,
    tileYellow02,
    tileYellow03,
    tileYellow04,
    tileYellow05,
    tileYellow06,
    tileYellow07,
    tileYellow08,
    tileYellow09,
    tileYellow10,
    tileYellow11,
    tileYellow12,
    tileYellow13,
    tileYellow14,
    tileYellow15,
    tileYellow16,
    tileYellow17,
    tileYellow18,
    tileYellow19,
    tileYellow20,
    tileYellow21,
    tileYellow22,
    tileYellow23,
    tileYellow24,
    tileYellow25,
    tileYellow26,
    tileYellow27,
    vine,
    vineBottom,
    vineBottomAlt,
    yellowCrystal,
    yellowGem,
    yellowJewel,
]

import ray.RocRay exposing [Texture, Rectangle]

## the relative asset path to the sprite sheet image file
imagePath : Str
imagePath =
    "examples/assets/kenney_abstract-platformer/Spritesheet/spritesheet_complete.png"

## load the sprite sheet as a raylib texture
load : Task Texture _
load =
    RocRay.loadTexture imagePath

## remove non-rectangle attribute(s)
rect : Sprite -> Rectangle
rect = \{ x, y, width, height } ->
    { x, y, width, height }

## an offset to an image in the sprite sheet
Sprite : {
    name : Str,
    x : F32,
    y : F32,
    width : F32,
    height : F32,
}

blockBrown : Sprite
blockBrown = {
    name: "blockBrown.png",
    x: 455,
    y: 849,
    width: 64,
    height: 64,
}

blockBrownBroken : Sprite
blockBrownBroken = {
    name: "blockBrown_broken.png",
    x: 455,
    y: 914,
    width: 64,
    height: 64,
}

blockGreen : Sprite
blockGreen = {
    name: "blockGreen.png",
    x: 520,
    y: 0,
    width: 64,
    height: 64,
}

blockGreenKey : Sprite
blockGreenKey = {
    name: "blockGreen_key.png",
    x: 520,
    y: 65,
    width: 64,
    height: 64,
}

blockGreenLock : Sprite
blockGreenLock = {
    name: "blockGreen_lock.png",
    x: 520,
    y: 179,
    width: 64,
    height: 64,
}

blockGreenPuzzle : Sprite
blockGreenPuzzle = {
    name: "blockGreen_puzzle.png",
    x: 520,
    y: 244,
    width: 64,
    height: 64,
}

blockGrey : Sprite
blockGrey = {
    name: "blockGrey.png",
    x: 520,
    y: 309,
    width: 64,
    height: 64,
}

blockGreyBroken : Sprite
blockGreyBroken = {
    name: "blockGrey_broken.png",
    x: 520,
    y: 374,
    width: 64,
    height: 64,
}

blockRed : Sprite
blockRed = {
    name: "blockRed.png",
    x: 520,
    y: 504,
    width: 64,
    height: 64,
}

blockRedKey : Sprite
blockRedKey = {
    name: "blockRed_key.png",
    x: 520,
    y: 634,
    width: 64,
    height: 64,
}

blockRedLock : Sprite
blockRedLock = {
    name: "blockRed_lock.png",
    x: 520,
    y: 795,
    width: 64,
    height: 64,
}

blockRedPuzzle : Sprite
blockRedPuzzle = {
    name: "blockRed_puzzle.png",
    x: 520,
    y: 860,
    width: 64,
    height: 64,
}

blueCrystal : Sprite
blueCrystal = {
    name: "blueCrystal.png",
    x: 929,
    y: 317,
    width: 32,
    height: 30,
}

blueGem : Sprite
blueGem = {
    name: "blueGem.png",
    x: 964,
    y: 797,
    width: 22,
    height: 22,
}

blueJewel : Sprite
blueJewel = {
    name: "blueJewel.png",
    x: 964,
    y: 705,
    width: 24,
    height: 22,
}

buttonFloor : Sprite
buttonFloor = {
    name: "buttonFloor.png",
    x: 65,
    y: 1001,
    width: 54,
    height: 12,
}

buttonFloorPressed : Sprite
buttonFloorPressed = {
    name: "buttonFloor_pressed.png",
    x: 65,
    y: 1014,
    width: 54,
    height: 8,
}

buttonGreen : Sprite
buttonGreen = {
    name: "buttonGreen.png",
    x: 707,
    y: 781,
    width: 50,
    height: 29,
}

buttonGreenPressed : Sprite
buttonGreenPressed = {
    name: "buttonGreen_pressed.png",
    x: 696,
    y: 1005,
    width: 50,
    height: 17,
}

buttonRed : Sprite
buttonRed = {
    name: "buttonRed.png",
    x: 707,
    y: 751,
    width: 50,
    height: 29,
}

buttonRedPressed : Sprite
buttonRedPressed = {
    name: "buttonRed_pressed.png",
    x: 645,
    y: 1005,
    width: 50,
    height: 17,
}

discGreen : Sprite
discGreen = {
    name: "discGreen.png",
    x: 928,
    y: 216,
    width: 34,
    height: 35,
}

discRed : Sprite
discRed = {
    name: "discRed.png",
    x: 927,
    y: 102,
    width: 34,
    height: 35,
}

doorGreen : Sprite
doorGreen = {
    name: "doorGreen.png",
    x: 585,
    y: 446,
    width: 64,
    height: 64,
}

doorGreenLock : Sprite
doorGreenLock = {
    name: "doorGreen_lock.png",
    x: 650,
    y: 92,
    width: 64,
    height: 64,
}

doorGreenTop : Sprite
doorGreenTop = {
    name: "doorGreen_top.png",
    x: 520,
    y: 699,
    width: 64,
    height: 64,
}

doorOpen : Sprite
doorOpen = {
    name: "doorOpen.png",
    x: 585,
    y: 714,
    width: 64,
    height: 64,
}

doorOpenTop : Sprite
doorOpenTop = {
    name: "doorOpen_top.png",
    x: 585,
    y: 65,
    width: 64,
    height: 64,
}

doorRed : Sprite
doorRed = {
    name: "doorRed.png",
    x: 585,
    y: 0,
    width: 64,
    height: 64,
}

doorRedLock : Sprite
doorRedLock = {
    name: "doorRed_lock.png",
    x: 325,
    y: 427,
    width: 64,
    height: 64,
}

doorRedTop : Sprite
doorRedTop = {
    name: "doorRed_top.png",
    x: 520,
    y: 925,
    width: 64,
    height: 64,
}

enemyFloating1 : Sprite
enemyFloating1 = {
    name: "enemyFloating_1.png",
    x: 807,
    y: 306,
    width: 42,
    height: 40,
}

enemyFloating2 : Sprite
enemyFloating2 = {
    name: "enemyFloating_2.png",
    x: 650,
    y: 839,
    width: 55,
    height: 55,
}

enemyFloating3 : Sprite
enemyFloating3 = {
    name: "enemyFloating_3.png",
    x: 809,
    y: 51,
    width: 40,
    height: 40,
}

enemyFloating4 : Sprite
enemyFloating4 = {
    name: "enemyFloating_4.png",
    x: 805,
    y: 924,
    width: 42,
    height: 40,
}

enemyFlyingAlt1 : Sprite
enemyFlyingAlt1 = {
    name: "enemyFlyingAlt_1.png",
    x: 706,
    y: 839,
    width: 52,
    height: 36,
}

enemyFlyingAlt2 : Sprite
enemyFlyingAlt2 = {
    name: "enemyFlyingAlt_2.png",
    x: 520,
    y: 996,
    width: 63,
    height: 24,
}

enemyFlyingAlt3 : Sprite
enemyFlyingAlt3 = {
    name: "enemyFlyingAlt_3.png",
    x: 705,
    y: 895,
    width: 52,
    height: 29,
}

enemyFlyingAlt4 : Sprite
enemyFlyingAlt4 = {
    name: "enemyFlyingAlt_4.png",
    x: 650,
    y: 354,
    width: 60,
    height: 29,
}

enemyFlying1 : Sprite
enemyFlying1 = {
    name: "enemyFlying_1.png",
    x: 455,
    y: 390,
    width: 64,
    height: 38,
}

enemyFlying2 : Sprite
enemyFlying2 = {
    name: "enemyFlying_2.png",
    x: 455,
    y: 429,
    width: 64,
    height: 38,
}

enemyFlying3 : Sprite
enemyFlying3 = {
    name: "enemyFlying_3.png",
    x: 455,
    y: 533,
    width: 64,
    height: 43,
}

enemyFlying4 : Sprite
enemyFlying4 = {
    name: "enemyFlying_4.png",
    x: 584,
    y: 996,
    width: 60,
    height: 25,
}

enemySpikey1 : Sprite
enemySpikey1 = {
    name: "enemySpikey_1.png",
    x: 929,
    y: 0,
    width: 32,
    height: 40,
}

enemySpikey2 : Sprite
enemySpikey2 = {
    name: "enemySpikey_2.png",
    x: 928,
    y: 994,
    width: 32,
    height: 28,
}

enemySpikey3 : Sprite
enemySpikey3 = {
    name: "enemySpikey_3.png",
    x: 929,
    y: 252,
    width: 32,
    height: 64,
}

enemySpikey4 : Sprite
enemySpikey4 = {
    name: "enemySpikey_4.png",
    x: 928,
    y: 522,
    width: 32,
    height: 40,
}

enemySwimming1 : Sprite
enemySwimming1 = {
    name: "enemySwimming_1.png",
    x: 805,
    y: 790,
    width: 44,
    height: 32,
}

enemySwimming2 : Sprite
enemySwimming2 = {
    name: "enemySwimming_2.png",
    x: 763,
    y: 153,
    width: 44,
    height: 32,
}

enemySwimming3 : Sprite
enemySwimming3 = {
    name: "enemySwimming_3.png",
    x: 758,
    y: 656,
    width: 46,
    height: 32,
}

enemySwimming4 : Sprite
enemySwimming4 = {
    name: "enemySwimming_4.png",
    x: 762,
    y: 306,
    width: 44,
    height: 32,
}

enemyWalking1 : Sprite
enemyWalking1 = {
    name: "enemyWalking_1.png",
    x: 928,
    y: 949,
    width: 32,
    height: 44,
}

enemyWalking2 : Sprite
enemyWalking2 = {
    name: "enemyWalking_2.png",
    x: 928,
    y: 417,
    width: 32,
    height: 42,
}

enemyWalking3 : Sprite
enemyWalking3 = {
    name: "enemyWalking_3.png",
    x: 710,
    y: 464,
    width: 49,
    height: 38,
}

enemyWalking4 : Sprite
enemyWalking4 = {
    name: "enemyWalking_4.png",
    x: 928,
    y: 837,
    width: 35,
    height: 41,
}

fence : Sprite
fence = {
    name: "fence.png",
    x: 585,
    y: 622,
    width: 64,
    height: 45,
}

fenceBroken : Sprite
fenceBroken = {
    name: "fenceBroken.png",
    x: 585,
    y: 668,
    width: 64,
    height: 45,
}

fenceLeft : Sprite
fenceLeft = {
    name: "fenceLeft.png",
    x: 585,
    y: 511,
    width: 64,
    height: 45,
}

fenceMid : Sprite
fenceMid = {
    name: "fenceMid.png",
    x: 650,
    y: 46,
    width: 64,
    height: 45,
}

fenceOpen : Sprite
fenceOpen = {
    name: "fenceOpen.png",
    x: 650,
    y: 0,
    width: 64,
    height: 45,
}

fenceRight : Sprite
fenceRight = {
    name: "fenceRight.png",
    x: 585,
    y: 950,
    width: 64,
    height: 45,
}

flagGreenDown : Sprite
flagGreenDown = {
    name: "flagGreen_down.png",
    x: 987,
    y: 813,
    width: 15,
    height: 61,
}

flagGreenUp : Sprite
flagGreenUp = {
    name: "flagGreen_up.png",
    x: 650,
    y: 446,
    width: 59,
    height: 61,
}

flagRedDown : Sprite
flagRedDown = {
    name: "flagRed_down.png",
    x: 987,
    y: 751,
    width: 15,
    height: 61,
}

flagRedUp : Sprite
flagRedUp = {
    name: "flagRed_up.png",
    x: 650,
    y: 384,
    width: 59,
    height: 61,
}

fluidBlue : Sprite
fluidBlue = {
    name: "fluidBlue.png",
    x: 585,
    y: 885,
    width: 64,
    height: 64,
}

fluidBlueTop : Sprite
fluidBlueTop = {
    name: "fluidBlue_top.png",
    x: 585,
    y: 820,
    width: 64,
    height: 64,
}

fluidBrown : Sprite
fluidBrown = {
    name: "fluidBrown.png",
    x: 585,
    y: 557,
    width: 64,
    height: 64,
}

fluidBrownTop : Sprite
fluidBrownTop = {
    name: "fluidBrown_top.png",
    x: 585,
    y: 381,
    width: 64,
    height: 64,
}

fluidGreen : Sprite
fluidGreen = {
    name: "fluidGreen.png",
    x: 585,
    y: 260,
    width: 64,
    height: 64,
}

fluidGreenTop : Sprite
fluidGreenTop = {
    name: "fluidGreen_top.png",
    x: 585,
    y: 195,
    width: 64,
    height: 64,
}

fluidRed : Sprite
fluidRed = {
    name: "fluidRed.png",
    x: 585,
    y: 130,
    width: 64,
    height: 64,
}

fluidRedTop : Sprite
fluidRedTop = {
    name: "fluidRed_top.png",
    x: 520,
    y: 569,
    width: 64,
    height: 64,
}

greenCrystal : Sprite
greenCrystal = {
    name: "greenCrystal.png",
    x: 928,
    y: 460,
    width: 32,
    height: 30,
}

greenGem : Sprite
greenGem = {
    name: "greenGem.png",
    x: 964,
    y: 774,
    width: 22,
    height: 22,
}

greenJewel : Sprite
greenJewel = {
    name: "greenJewel.png",
    x: 807,
    y: 347,
    width: 24,
    height: 22,
}

keyGreen : Sprite
keyGreen = {
    name: "keyGreen.png",
    x: 961,
    y: 495,
    width: 29,
    height: 30,
}

keyRed : Sprite
keyRed = {
    name: "keyRed.png",
    x: 962,
    y: 252,
    width: 29,
    height: 30,
}

ladderNarrowMid : Sprite
ladderNarrowMid = {
    name: "ladderNarrow_mid.png",
    x: 650,
    y: 508,
    width: 56,
    height: 64,
}

ladderNarrowTop : Sprite
ladderNarrowTop = {
    name: "ladderNarrow_top.png",
    x: 650,
    y: 724,
    width: 56,
    height: 48,
}

ladderWideMid : Sprite
ladderWideMid = {
    name: "ladderWide_mid.png",
    x: 520,
    y: 439,
    width: 64,
    height: 64,
}

ladderWideTop : Sprite
ladderWideTop = {
    name: "ladderWide_top.png",
    x: 520,
    y: 130,
    width: 64,
    height: 48,
}

lockGreen : Sprite
lockGreen = {
    name: "lockGreen.png",
    x: 455,
    y: 784,
    width: 64,
    height: 64,
}

lockGreenBottom : Sprite
lockGreenBottom = {
    name: "lockGreenBottom.png",
    x: 455,
    y: 577,
    width: 64,
    height: 64,
}

lockGreenLeft : Sprite
lockGreenLeft = {
    name: "lockGreenLeft.png",
    x: 455,
    y: 468,
    width: 64,
    height: 64,
}

lockGreenLock : Sprite
lockGreenLock = {
    name: "lockGreenLock.png",
    x: 455,
    y: 325,
    width: 64,
    height: 64,
}

lockGreenMid : Sprite
lockGreenMid = {
    name: "lockGreenMid.png",
    x: 455,
    y: 260,
    width: 64,
    height: 64,
}

lockGreenRight : Sprite
lockGreenRight = {
    name: "lockGreenRight.png",
    x: 455,
    y: 195,
    width: 64,
    height: 64,
}

lockGreenTop : Sprite
lockGreenTop = {
    name: "lockGreenTop.png",
    x: 455,
    y: 130,
    width: 64,
    height: 64,
}

lockRed : Sprite
lockRed = {
    name: "lockRed.png",
    x: 455,
    y: 0,
    width: 64,
    height: 64,
}

lockRedBottom : Sprite
lockRedBottom = {
    name: "lockRedBottom.png",
    x: 390,
    y: 947,
    width: 64,
    height: 64,
}

lockRedLeft : Sprite
lockRedLeft = {
    name: "lockRedLeft.png",
    x: 390,
    y: 817,
    width: 64,
    height: 64,
}

lockRedLock : Sprite
lockRedLock = {
    name: "lockRedLock.png",
    x: 390,
    y: 752,
    width: 64,
    height: 64,
}

lockRedMid : Sprite
lockRedMid = {
    name: "lockRedMid.png",
    x: 585,
    y: 130,
    width: 64,
    height: 64,
}

lockRedRight : Sprite
lockRedRight = {
    name: "lockRedRight.png",
    x: 390,
    y: 687,
    width: 64,
    height: 64,
}

lockRedTop : Sprite
lockRedTop = {
    name: "lockRedTop.png",
    x: 455,
    y: 65,
    width: 64,
    height: 64,
}

outlineCrystal : Sprite
outlineCrystal = {
    name: "outlineCrystal.png",
    x: 889,
    y: 926,
    width: 38,
    height: 36,
}

outlineDisc : Sprite
outlineDisc = {
    name: "outlineDisc.png",
    x: 848,
    y: 963,
    width: 40,
    height: 41,
}

outlineDiscAlt : Sprite
outlineDiscAlt = {
    name: "outlineDisc_alt.png",
    x: 848,
    y: 921,
    width: 40,
    height: 41,
}

outlineGem : Sprite
outlineGem = {
    name: "outlineGem.png",
    x: 962,
    y: 283,
    width: 28,
    height: 28,
}

outlineJewel : Sprite
outlineJewel = {
    name: "outlineJewel.png",
    x: 929,
    y: 379,
    width: 30,
    height: 28,
}

outlineKey : Sprite
outlineKey = {
    name: "outlineKey.png",
    x: 927,
    y: 624,
    width: 36,
    height: 36,
}

outlinePuzzle : Sprite
outlinePuzzle = {
    name: "outlinePuzzle.png",
    x: 849,
    y: 347,
    width: 40,
    height: 40,
}

plantBlue1 : Sprite
plantBlue1 = {
    name: "plantBlue_1.png",
    x: 963,
    y: 145,
    width: 26,
    height: 48,
}

plantBlue2 : Sprite
plantBlue2 = {
    name: "plantBlue_2.png",
    x: 805,
    y: 755,
    width: 44,
    height: 34,
}

plantBlue3 : Sprite
plantBlue3 = {
    name: "plantBlue_3.png",
    x: 707,
    y: 811,
    width: 42,
    height: 24,
}

plantBlue4 : Sprite
plantBlue4 = {
    name: "plantBlue_4.png",
    x: 961,
    y: 949,
    width: 29,
    height: 55,
}

plantBlue5 : Sprite
plantBlue5 = {
    name: "plantBlue_5.png",
    x: 705,
    y: 925,
    width: 44,
    height: 22,
}

plantBlue6 : Sprite
plantBlue6 = {
    name: "plantBlue_6.png",
    x: 928,
    y: 138,
    width: 34,
    height: 39,
}

plantBottom1 : Sprite
plantBottom1 = {
    name: "plantBottom_1.png",
    x: 962,
    y: 0,
    width: 28,
    height: 64,
}

plantBottom2 : Sprite
plantBottom2 = {
    name: "plantBottom_2.png",
    x: 890,
    y: 662,
    width: 36,
    height: 64,
}

plantDark1 : Sprite
plantDark1 = {
    name: "plantDark_1.png",
    x: 850,
    y: 207,
    width: 38,
    height: 37,
}

plantDark2 : Sprite
plantDark2 = {
    name: "plantDark_2.png",
    x: 850,
    y: 567,
    width: 36,
    height: 31,
}

plantDark3 : Sprite
plantDark3 = {
    name: "plantDark_3.png",
    x: 963,
    y: 194,
    width: 26,
    height: 50,
}

plantDark4 : Sprite
plantDark4 = {
    name: "plantDark_4.png",
    x: 929,
    y: 41,
    width: 32,
    height: 49,
}

plantDark5 : Sprite
plantDark5 = {
    name: "plantDark_5.png",
    x: 962,
    y: 312,
    width: 28,
    height: 32,
}

plantDark6 : Sprite
plantDark6 = {
    name: "plantDark_6.png",
    x: 962,
    y: 65,
    width: 27,
    height: 38,
}

plantGreen1 : Sprite
plantGreen1 = {
    name: "plantGreen_1.png",
    x: 763,
    y: 108,
    width: 44,
    height: 44,
}

plantGreen2 : Sprite
plantGreen2 = {
    name: "plantGreen_2.png",
    x: 762,
    y: 339,
    width: 44,
    height: 32,
}

plantGreen3 : Sprite
plantGreen3 = {
    name: "plantGreen_3.png",
    x: 890,
    y: 727,
    width: 36,
    height: 31,
}

plantGreen4 : Sprite
plantGreen4 = {
    name: "plantGreen_4.png",
    x: 961,
    y: 526,
    width: 29,
    height: 50,
}

plantGreen5 : Sprite
plantGreen5 = {
    name: "plantGreen_5.png",
    x: 808,
    y: 147,
    width: 41,
    height: 47,
}

plantGreen6 : Sprite
plantGreen6 = {
    name: "plantGreen_6.png",
    x: 806,
    y: 599,
    width: 42,
    height: 36,
}

plantLeaves1 : Sprite
plantLeaves1 = {
    name: "plantLeaves_1.png",
    x: 889,
    y: 207,
    width: 38,
    height: 64,
}

plantLeaves3 : Sprite
plantLeaves3 = {
    name: "plantLeaves_3.png",
    x: 850,
    y: 142,
    width: 38,
    height: 64,
}

plantRed1 : Sprite
plantRed1 = {
    name: "plantRed_1.png",
    x: 929,
    y: 348,
    width: 31,
    height: 30,
}

plantRed2 : Sprite
plantRed2 = {
    name: "plantRed_2.png",
    x: 961,
    y: 466,
    width: 30,
    height: 28,
}

plantRed3 : Sprite
plantRed3 = {
    name: "plantRed_3.png",
    x: 806,
    y: 372,
    width: 42,
    height: 23,
}

plantRed4 : Sprite
plantRed4 = {
    name: "plantRed_4.png",
    x: 928,
    y: 178,
    width: 34,
    height: 37,
}

plantRed5 : Sprite
plantRed5 = {
    name: "plantRed_5.png",
    x: 890,
    y: 461,
    width: 37,
    height: 32,
}

plantRed6 : Sprite
plantRed6 = {
    name: "plantRed_6.png",
    x: 809,
    y: 0,
    width: 40,
    height: 50,
}

plantStemTleft : Sprite
plantStemTleft = {
    name: "plantStem_Tleft.png",
    x: 889,
    y: 142,
    width: 38,
    height: 64,
}

plantStemTright : Sprite
plantStemTright = {
    name: "plantStem_Tright.png",
    x: 927,
    y: 661,
    width: 36,
    height: 64,
}

plantStemCornerLeft : Sprite
plantStemCornerLeft = {
    name: "plantStem_cornerLeft.png",
    x: 890,
    y: 578,
    width: 36,
    height: 37,
}

plantStemCornerRight : Sprite
plantStemCornerRight = {
    name: "plantStem_cornerRight.png",
    x: 806,
    y: 452,
    width: 38,
    height: 37,
}

plantStemCross : Sprite
plantStemCross = {
    name: "plantStem_cross.png",
    x: 455,
    y: 719,
    width: 64,
    height: 64,
}

plantStemHorizontal : Sprite
plantStemHorizontal = {
    name: "plantStem_horizontal.png",
    x: 65,
    y: 990,
    width: 64,
    height: 10,
}

plantStemVertical : Sprite
plantStemVertical = {
    name: "plantStem_vertical.png",
    x: 65,
    y: 990,
    width: 64,
    height: 10,
}

plantThornsHorizontal : Sprite
plantThornsHorizontal = {
    name: "plantThorns_horizontal.png",
    x: 455,
    y: 979,
    width: 64,
    height: 36,
}

plantThornsVertical : Sprite
plantThornsVertical = {
    name: "plantThorns_vertical.png",
    x: 927,
    y: 726,
    width: 36,
    height: 64,
}

plantTopBlue : Sprite
plantTopBlue = {
    name: "plantTop_blue.png",
    x: 650,
    y: 157,
    width: 62,
    height: 54,
}

plantTopLeaves : Sprite
plantTopLeaves = {
    name: "plantTop_leaves.png",
    x: 650,
    y: 267,
    width: 62,
    height: 31,
}

plantTopRed : Sprite
plantTopRed = {
    name: "plantTop_red.png",
    x: 650,
    y: 299,
    width: 62,
    height: 54,
}

plantTopYellow : Sprite
plantTopYellow = {
    name: "plantTop_yellow.png",
    x: 650,
    y: 212,
    width: 62,
    height: 54,
}

playerBlueDead : Sprite
playerBlueDead = {
    name: "playerBlue_dead.png",
    x: 762,
    y: 258,
    width: 45,
    height: 47,
}

playerBlueDuck : Sprite
playerBlueDuck = {
    name: "playerBlue_duck.png",
    x: 650,
    y: 605,
    width: 56,
    height: 40,
}

playerBlueFall : Sprite
playerBlueFall = {
    name: "playerBlue_fall.png",
    x: 805,
    y: 490,
    width: 44,
    height: 54,
}

playerBlueHit : Sprite
playerBlueHit = {
    name: "playerBlue_hit.png",
    x: 758,
    y: 730,
    width: 46,
    height: 40,
}

playerBlueRoll : Sprite
playerBlueRoll = {
    name: "playerBlue_roll.png",
    x: 849,
    y: 388,
    width: 40,
    height: 40,
}

playerBlueStand : Sprite
playerBlueStand = {
    name: "playerBlue_stand.png",
    x: 762,
    y: 203,
    width: 45,
    height: 54,
}

playerBlueSwim1 : Sprite
playerBlueSwim1 = {
    name: "playerBlue_swim1.png",
    x: 805,
    y: 545,
    width: 44,
    height: 53,
}

playerBlueSwim2 : Sprite
playerBlueSwim2 = {
    name: "playerBlue_swim2.png",
    x: 764,
    y: 0,
    width: 44,
    height: 54,
}

playerBlueSwitch1 : Sprite
playerBlueSwitch1 = {
    name: "playerBlue_switch1.png",
    x: 650,
    y: 895,
    width: 54,
    height: 54,
}

playerBlueSwitch2 : Sprite
playerBlueSwitch2 = {
    name: "playerBlue_switch2.png",
    x: 650,
    y: 950,
    width: 53,
    height: 54,
}

playerBlueUp1 : Sprite
playerBlueUp1 = {
    name: "playerBlue_up1.png",
    x: 760,
    y: 435,
    width: 45,
    height: 54,
}

playerBlueUp2 : Sprite
playerBlueUp2 = {
    name: "playerBlue_up2.png",
    x: 759,
    y: 556,
    width: 45,
    height: 50,
}

playerBlueUp3 : Sprite
playerBlueUp3 = {
    name: "playerBlue_up3.png",
    x: 758,
    y: 771,
    width: 46,
    height: 40,
}

playerBlueWalk1 : Sprite
playerBlueWalk1 = {
    name: "playerBlue_walk1.png",
    x: 759,
    y: 812,
    width: 45,
    height: 54,
}

playerBlueWalk2 : Sprite
playerBlueWalk2 = {
    name: "playerBlue_walk2.png",
    x: 760,
    y: 380,
    width: 45,
    height: 54,
}

playerBlueWalk3 : Sprite
playerBlueWalk3 = {
    name: "playerBlue_walk3.png",
    x: 759,
    y: 503,
    width: 45,
    height: 52,
}

playerBlueWalk4 : Sprite
playerBlueWalk4 = {
    name: "playerBlue_walk4.png",
    x: 713,
    y: 157,
    width: 49,
    height: 45,
}

playerBlueWalk5 : Sprite
playerBlueWalk5 = {
    name: "playerBlue_walk5.png",
    x: 585,
    y: 779,
    width: 64,
    height: 40,
}

playerGreenDead : Sprite
playerGreenDead = {
    name: "playerGreen_dead.png",
    x: 890,
    y: 272,
    width: 38,
    height: 43,
}

playerGreenDuck : Sprite
playerGreenDuck = {
    name: "playerGreen_duck.png",
    x: 650,
    y: 573,
    width: 56,
    height: 31,
}

playerGreenFall : Sprite
playerGreenFall = {
    name: "playerGreen_fall.png",
    x: 890,
    y: 316,
    width: 38,
    height: 49,
}

playerGreenHit : Sprite
playerGreenHit = {
    name: "playerGreen_hit.png",
    x: 758,
    y: 689,
    width: 46,
    height: 40,
}

playerGreenRoll : Sprite
playerGreenRoll = {
    name: "playerGreen_roll.png",
    x: 849,
    y: 599,
    width: 40,
    height: 40,
}

playerGreenStand : Sprite
playerGreenStand = {
    name: "playerGreen_stand.png",
    x: 890,
    y: 0,
    width: 38,
    height: 50,
}

playerGreenSwim1 : Sprite
playerGreenSwim1 = {
    name: "playerGreen_swim1.png",
    x: 849,
    y: 823,
    width: 40,
    height: 53,
}

playerGreenSwim2 : Sprite
playerGreenSwim2 = {
    name: "playerGreen_swim2.png",
    x: 808,
    y: 92,
    width: 41,
    height: 54,
}

playerGreenSwitch1 : Sprite
playerGreenSwitch1 = {
    name: "playerGreen_switch1.png",
    x: 707,
    y: 508,
    width: 51,
    height: 50,
}

playerGreenSwitch2 : Sprite
playerGreenSwitch2 = {
    name: "playerGreen_switch2.png",
    x: 707,
    y: 654,
    width: 50,
    height: 50,
}

playerGreenUp1 : Sprite
playerGreenUp1 = {
    name: "playerGreen_up1.png",
    x: 890,
    y: 51,
    width: 38,
    height: 50,
}

playerGreenUp2 : Sprite
playerGreenUp2 = {
    name: "playerGreen_up2.png",
    x: 849,
    y: 877,
    width: 38,
    height: 43,
}

playerGreenUp3 : Sprite
playerGreenUp3 = {
    name: "playerGreen_up3.png",
    x: 849,
    y: 429,
    width: 40,
    height: 39,
}

playerGreenWalk1 : Sprite
playerGreenWalk1 = {
    name: "playerGreen_walk1.png",
    x: 890,
    y: 366,
    width: 38,
    height: 50,
}

playerGreenWalk2 : Sprite
playerGreenWalk2 = {
    name: "playerGreen_walk2.png",
    x: 889,
    y: 963,
    width: 38,
    height: 48,
}

playerGreenWalk3 : Sprite
playerGreenWalk3 = {
    name: "playerGreen_walk3.png",
    x: 889,
    y: 877,
    width: 38,
    height: 48,
}

playerGreenWalk4 : Sprite
playerGreenWalk4 = {
    name: "playerGreen_walk4.png",
    x: 713,
    y: 259,
    width: 48,
    height: 43,
}

playerGreenWalk5 : Sprite
playerGreenWalk5 = {
    name: "playerGreen_walk5.png",
    x: 455,
    y: 642,
    width: 64,
    height: 39,
}

playerGreyDead : Sprite
playerGreyDead = {
    name: "playerGrey_dead.png",
    x: 890,
    y: 759,
    width: 36,
    height: 39,
}

playerGreyDuck : Sprite
playerGreyDuck = {
    name: "playerGrey_duck.png",
    x: 650,
    y: 808,
    width: 56,
    height: 30,
}

playerGreyFall : Sprite
playerGreyFall = {
    name: "playerGrey_fall.png",
    x: 890,
    y: 616,
    width: 36,
    height: 45,
}

playerGreyHit : Sprite
playerGreyHit = {
    name: "playerGrey_hit.png",
    x: 710,
    y: 427,
    width: 49,
    height: 36,
}

playerGreyRoll : Sprite
playerGreyRoll = {
    name: "playerGrey_roll.png",
    x: 890,
    y: 102,
    width: 36,
    height: 36,
}

playerGreyStand : Sprite
playerGreyStand = {
    name: "playerGrey_stand.png",
    x: 890,
    y: 799,
    width: 36,
    height: 45,
}

playerGreySwim1 : Sprite
playerGreySwim1 = {
    name: "playerGrey_swim1.png",
    x: 805,
    y: 823,
    width: 43,
    height: 41,
}

playerGreySwim2 : Sprite
playerGreySwim2 = {
    name: "playerGrey_swim2.png",
    x: 805,
    y: 656,
    width: 44,
    height: 42,
}

playerGreySwitch1 : Sprite
playerGreySwitch1 = {
    name: "playerGrey_switch1.png",
    x: 707,
    y: 705,
    width: 50,
    height: 45,
}

playerGreySwitch2 : Sprite
playerGreySwitch2 = {
    name: "playerGrey_switch2.png",
    x: 707,
    y: 608,
    width: 50,
    height: 45,
}

playerGreyUp1 : Sprite
playerGreyUp1 = {
    name: "playerGrey_up1.png",
    x: 927,
    y: 578,
    width: 36,
    height: 45,
}

playerGreyUp2 : Sprite
playerGreyUp2 = {
    name: "playerGrey_up2.png",
    x: 890,
    y: 537,
    width: 37,
    height: 40,
}

playerGreyUp3 : Sprite
playerGreyUp3 = {
    name: "playerGrey_up3.png",
    x: 764,
    y: 55,
    width: 44,
    height: 36,
}

playerGreyWalk1 : Sprite
playerGreyWalk1 = {
    name: "playerGrey_walk1.png",
    x: 927,
    y: 791,
    width: 36,
    height: 45,
}

playerGreyWalk2 : Sprite
playerGreyWalk2 = {
    name: "playerGrey_walk2.png",
    x: 890,
    y: 417,
    width: 37,
    height: 43,
}

playerGreyWalk3 : Sprite
playerGreyWalk3 = {
    name: "playerGrey_walk3.png",
    x: 890,
    y: 494,
    width: 37,
    height: 42,
}

playerGreyWalk4 : Sprite
playerGreyWalk4 = {
    name: "playerGrey_walk4.png",
    x: 713,
    y: 343,
    width: 48,
    height: 36,
}

playerGreyWalk5 : Sprite
playerGreyWalk5 = {
    name: "playerGrey_walk5.png",
    x: 455,
    y: 682,
    width: 64,
    height: 36,
}

playerRedDead : Sprite
playerRedDead = {
    name: "playerRed_dead.png",
    x: 850,
    y: 297,
    width: 39,
    height: 46,
}

playerRedDuck : Sprite
playerRedDuck = {
    name: "playerRed_duck.png",
    x: 650,
    y: 773,
    width: 56,
    height: 34,
}

playerRedFall : Sprite
playerRedFall = {
    name: "playerRed_fall.png",
    x: 850,
    y: 699,
    width: 39,
    height: 50,
}

playerRedHit : Sprite
playerRedHit = {
    name: "playerRed_hit.png",
    x: 650,
    y: 646,
    width: 56,
    height: 38,
}

playerRedRoll : Sprite
playerRedRoll = {
    name: "playerRed_roll.png",
    x: 808,
    y: 251,
    width: 40,
    height: 40,
}

playerRedStand : Sprite
playerRedStand = {
    name: "playerRed_stand.png",
    x: 850,
    y: 518,
    width: 39,
    height: 48,
}

playerRedSwim1 : Sprite
playerRedSwim1 = {
    name: "playerRed_swim1.png",
    x: 757,
    y: 925,
    width: 47,
    height: 50,
}

playerRedSwim2 : Sprite
playerRedSwim2 = {
    name: "playerRed_swim2.png",
    x: 715,
    y: 56,
    width: 48,
    height: 51,
}

playerRedSwitch1 : Sprite
playerRedSwitch1 = {
    name: "playerRed_switch1.png",
    x: 704,
    y: 950,
    width: 52,
    height: 48,
}

playerRedSwitch2 : Sprite
playerRedSwitch2 = {
    name: "playerRed_switch2.png",
    x: 707,
    y: 559,
    width: 51,
    height: 48,
}

playerRedUp1 : Sprite
playerRedUp1 = {
    name: "playerRed_up1.png",
    x: 850,
    y: 469,
    width: 39,
    height: 48,
}

playerRedUp2 : Sprite
playerRedUp2 = {
    name: "playerRed_up2.png",
    x: 850,
    y: 0,
    width: 39,
    height: 46,
}

playerRedUp3 : Sprite
playerRedUp3 = {
    name: "playerRed_up3.png",
    x: 650,
    y: 685,
    width: 56,
    height: 38,
}

playerRedWalk1 : Sprite
playerRedWalk1 = {
    name: "playerRed_walk1.png",
    x: 850,
    y: 47,
    width: 39,
    height: 48,
}

playerRedWalk2 : Sprite
playerRedWalk2 = {
    name: "playerRed_walk2.png",
    x: 850,
    y: 96,
    width: 39,
    height: 45,
}

playerRedWalk3 : Sprite
playerRedWalk3 = {
    name: "playerRed_walk3.png",
    x: 849,
    y: 251,
    width: 39,
    height: 45,
}

playerRedWalk4 : Sprite
playerRedWalk4 = {
    name: "playerRed_walk4.png",
    x: 710,
    y: 384,
    width: 49,
    height: 42,
}

playerRedWalk5 : Sprite
playerRedWalk5 = {
    name: "playerRed_walk5.png",
    x: 130,
    y: 975,
    width: 64,
    height: 38,
}

puzzleGreen : Sprite
puzzleGreen = {
    name: "puzzleGreen.png",
    x: 928,
    y: 914,
    width: 34,
    height: 34,
}

puzzleRed : Sprite
puzzleRed = {
    name: "puzzleRed.png",
    x: 928,
    y: 879,
    width: 34,
    height: 34,
}

redCrystal : Sprite
redCrystal = {
    name: "redCrystal.png",
    x: 890,
    y: 845,
    width: 32,
    height: 30,
}

redGem : Sprite
redGem = {
    name: "redGem.png",
    x: 964,
    y: 820,
    width: 22,
    height: 22,
}

redJewel : Sprite
redJewel = {
    name: "redJewel.png",
    x: 964,
    y: 728,
    width: 24,
    height: 22,
}

signArrow : Sprite
signArrow = {
    name: "signArrow.png",
    x: 713,
    y: 303,
    width: 48,
    height: 39,
}

signArrowBL : Sprite
signArrowBL = {
    name: "signArrow_BL.png",
    x: 806,
    y: 396,
    width: 42,
    height: 55,
}

signArrowBR : Sprite
signArrowBR = {
    name: "signArrow_BR.png",
    x: 808,
    y: 195,
    width: 41,
    height: 55,
}

signArrowTL : Sprite
signArrowTL = {
    name: "signArrow_TL.png",
    x: 806,
    y: 865,
    width: 42,
    height: 55,
}

signArrowTR : Sprite
signArrowTR = {
    name: "signArrow_TR.png",
    x: 805,
    y: 965,
    width: 42,
    height: 55,
}

signArrowDown : Sprite
signArrowDown = {
    name: "signArrow_down.png",
    x: 850,
    y: 750,
    width: 39,
    height: 58,
}

signArrowLeft : Sprite
signArrowLeft = {
    name: "signArrow_left.png",
    x: 715,
    y: 0,
    width: 48,
    height: 55,
}

signArrowRight : Sprite
signArrowRight = {
    name: "signArrow_right.png",
    x: 713,
    y: 203,
    width: 48,
    height: 55,
}

signArrowUp : Sprite
signArrowUp = {
    name: "signArrow_up.png",
    x: 850,
    y: 640,
    width: 39,
    height: 58,
}

signLarge : Sprite
signLarge = {
    name: "signLarge.png",
    x: 585,
    y: 325,
    width: 64,
    height: 55,
}

signSmall : Sprite
signSmall = {
    name: "signSmall.png",
    x: 805,
    y: 699,
    width: 44,
    height: 55,
}

signpost : Sprite
signpost = {
    name: "signpost.png",
    x: 990,
    y: 875,
    width: 12,
    height: 55,
}

spikesHigh : Sprite
spikesHigh = {
    name: "spikesHigh.png",
    x: 520,
    y: 764,
    width: 64,
    height: 30,
}

spikesLow : Sprite
spikesLow = {
    name: "spikesLow.png",
    x: 260,
    y: 996,
    width: 64,
    height: 26,
}

switchGreenLeft : Sprite
switchGreenLeft = {
    name: "switchGreen_left.png",
    x: 757,
    y: 976,
    width: 47,
    height: 47,
}

switchGreenMid : Sprite
switchGreenMid = {
    name: "switchGreen_mid.png",
    x: 961,
    y: 407,
    width: 30,
    height: 58,
}

switchGreenOff : Sprite
switchGreenOff = {
    name: "switchGreen_off.png",
    x: 964,
    y: 577,
    width: 26,
    height: 40,
}

switchGreenOn : Sprite
switchGreenOn = {
    name: "switchGreen_on.png",
    x: 963,
    y: 104,
    width: 26,
    height: 40,
}

switchGreenRight : Sprite
switchGreenRight = {
    name: "switchGreen_right.png",
    x: 758,
    y: 608,
    width: 47,
    height: 47,
}

switchRedLeft : Sprite
switchRedLeft = {
    name: "switchRed_left.png",
    x: 758,
    y: 876,
    width: 47,
    height: 47,
}

switchRedMid : Sprite
switchRedMid = {
    name: "switchRed_mid.png",
    x: 961,
    y: 348,
    width: 30,
    height: 58,
}

switchRedOff : Sprite
switchRedOff = {
    name: "switchRed_off.png",
    x: 963,
    y: 879,
    width: 26,
    height: 40,
}

switchRedOn : Sprite
switchRedOn = {
    name: "switchRed_on.png",
    x: 964,
    y: 618,
    width: 26,
    height: 40,
}

switchRedRight : Sprite
switchRedRight = {
    name: "switchRed_right.png",
    x: 715,
    y: 108,
    width: 47,
    height: 47,
}

tileBlue01 : Sprite
tileBlue01 = {
    name: "tileBlue_01.png",
    x: 390,
    y: 636,
    width: 64,
    height: 50,
}

tileBlue02 : Sprite
tileBlue02 = {
    name: "tileBlue_02.png",
    x: 390,
    y: 585,
    width: 64,
    height: 50,
}

tileBlue03 : Sprite
tileBlue03 = {
    name: "tileBlue_03.png",
    x: 390,
    y: 520,
    width: 64,
    height: 64,
}

tileBlue04 : Sprite
tileBlue04 = {
    name: "tileBlue_04.png",
    x: 390,
    y: 455,
    width: 64,
    height: 64,
}

tileBlue05 : Sprite
tileBlue05 = {
    name: "tileBlue_05.png",
    x: 390,
    y: 390,
    width: 64,
    height: 64,
}

tileBlue06 : Sprite
tileBlue06 = {
    name: "tileBlue_06.png",
    x: 390,
    y: 325,
    width: 64,
    height: 64,
}

tileBlue07 : Sprite
tileBlue07 = {
    name: "tileBlue_07.png",
    x: 390,
    y: 260,
    width: 64,
    height: 64,
}

tileBlue08 : Sprite
tileBlue08 = {
    name: "tileBlue_08.png",
    x: 390,
    y: 195,
    width: 64,
    height: 64,
}

tileBlue09 : Sprite
tileBlue09 = {
    name: "tileBlue_09.png",
    x: 390,
    y: 130,
    width: 64,
    height: 64,
}

tileBlue10 : Sprite
tileBlue10 = {
    name: "tileBlue_10.png",
    x: 390,
    y: 65,
    width: 64,
    height: 64,
}

tileBlue11 : Sprite
tileBlue11 = {
    name: "tileBlue_11.png",
    x: 390,
    y: 0,
    width: 64,
    height: 64,
}

tileBlue12 : Sprite
tileBlue12 = {
    name: "tileBlue_12.png",
    x: 325,
    y: 947,
    width: 64,
    height: 64,
}

tileBlue13 : Sprite
tileBlue13 = {
    name: "tileBlue_13.png",
    x: 325,
    y: 882,
    width: 64,
    height: 64,
}

tileBlue14 : Sprite
tileBlue14 = {
    name: "tileBlue_14.png",
    x: 325,
    y: 817,
    width: 64,
    height: 64,
}

tileBlue15 : Sprite
tileBlue15 = {
    name: "tileBlue_15.png",
    x: 325,
    y: 752,
    width: 64,
    height: 64,
}

tileBlue16 : Sprite
tileBlue16 = {
    name: "tileBlue_16.png",
    x: 325,
    y: 687,
    width: 64,
    height: 64,
}

tileBlue17 : Sprite
tileBlue17 = {
    name: "tileBlue_17.png",
    x: 325,
    y: 622,
    width: 64,
    height: 64,
}

tileBlue18 : Sprite
tileBlue18 = {
    name: "tileBlue_18.png",
    x: 325,
    y: 557,
    width: 64,
    height: 64,
}

tileBlue19 : Sprite
tileBlue19 = {
    name: "tileBlue_19.png",
    x: 325,
    y: 492,
    width: 64,
    height: 64,
}

tileBlue20 : Sprite
tileBlue20 = {
    name: "tileBlue_20.png",
    x: 390,
    y: 882,
    width: 64,
    height: 64,
}

tileBlue21 : Sprite
tileBlue21 = {
    name: "tileBlue_21.png",
    x: 325,
    y: 362,
    width: 64,
    height: 64,
}

tileBlue22 : Sprite
tileBlue22 = {
    name: "tileBlue_22.png",
    x: 325,
    y: 297,
    width: 64,
    height: 64,
}

tileBlue23 : Sprite
tileBlue23 = {
    name: "tileBlue_23.png",
    x: 325,
    y: 232,
    width: 64,
    height: 64,
}

tileBlue24 : Sprite
tileBlue24 = {
    name: "tileBlue_24.png",
    x: 325,
    y: 167,
    width: 64,
    height: 64,
}

tileBlue25 : Sprite
tileBlue25 = {
    name: "tileBlue_25.png",
    x: 325,
    y: 102,
    width: 64,
    height: 64,
}

tileBlue26 : Sprite
tileBlue26 = {
    name: "tileBlue_26.png",
    x: 325,
    y: 51,
    width: 64,
    height: 50,
}

tileBlue27 : Sprite
tileBlue27 = {
    name: "tileBlue_27.png",
    x: 325,
    y: 0,
    width: 64,
    height: 50,
}

tileBrown01 : Sprite
tileBrown01 = {
    name: "tileBrown_01.png",
    x: 260,
    y: 931,
    width: 64,
    height: 64,
}

tileBrown02 : Sprite
tileBrown02 = {
    name: "tileBrown_02.png",
    x: 260,
    y: 866,
    width: 64,
    height: 64,
}

tileBrown03 : Sprite
tileBrown03 = {
    name: "tileBrown_03.png",
    x: 260,
    y: 801,
    width: 64,
    height: 64,
}

tileBrown04 : Sprite
tileBrown04 = {
    name: "tileBrown_04.png",
    x: 260,
    y: 736,
    width: 64,
    height: 64,
}

tileBrown05 : Sprite
tileBrown05 = {
    name: "tileBrown_05.png",
    x: 260,
    y: 682,
    width: 64,
    height: 53,
}

tileBrown06 : Sprite
tileBrown06 = {
    name: "tileBrown_06.png",
    x: 260,
    y: 628,
    width: 64,
    height: 53,
}

tileBrown07 : Sprite
tileBrown07 = {
    name: "tileBrown_07.png",
    x: 260,
    y: 574,
    width: 64,
    height: 53,
}

tileBrown08 : Sprite
tileBrown08 = {
    name: "tileBrown_08.png",
    x: 260,
    y: 520,
    width: 64,
    height: 53,
}

tileBrown09 : Sprite
tileBrown09 = {
    name: "tileBrown_09.png",
    x: 260,
    y: 455,
    width: 64,
    height: 64,
}

tileBrown10 : Sprite
tileBrown10 = {
    name: "tileBrown_10.png",
    x: 260,
    y: 390,
    width: 64,
    height: 64,
}

tileBrown11 : Sprite
tileBrown11 = {
    name: "tileBrown_11.png",
    x: 260,
    y: 325,
    width: 64,
    height: 64,
}

tileBrown12 : Sprite
tileBrown12 = {
    name: "tileBrown_12.png",
    x: 260,
    y: 260,
    width: 64,
    height: 64,
}

tileBrown13 : Sprite
tileBrown13 = {
    name: "tileBrown_13.png",
    x: 260,
    y: 195,
    width: 64,
    height: 64,
}

tileBrown14 : Sprite
tileBrown14 = {
    name: "tileBrown_14.png",
    x: 260,
    y: 130,
    width: 64,
    height: 64,
}

tileBrown15 : Sprite
tileBrown15 = {
    name: "tileBrown_15.png",
    x: 260,
    y: 65,
    width: 64,
    height: 64,
}

tileBrown16 : Sprite
tileBrown16 = {
    name: "tileBrown_16.png",
    x: 260,
    y: 0,
    width: 64,
    height: 64,
}

tileBrown17 : Sprite
tileBrown17 = {
    name: "tileBrown_17.png",
    x: 195,
    y: 947,
    width: 64,
    height: 64,
}

tileBrown18 : Sprite
tileBrown18 = {
    name: "tileBrown_18.png",
    x: 195,
    y: 882,
    width: 64,
    height: 64,
}

tileBrown19 : Sprite
tileBrown19 = {
    name: "tileBrown_19.png",
    x: 195,
    y: 817,
    width: 64,
    height: 64,
}

tileBrown20 : Sprite
tileBrown20 = {
    name: "tileBrown_20.png",
    x: 195,
    y: 752,
    width: 64,
    height: 64,
}

tileBrown21 : Sprite
tileBrown21 = {
    name: "tileBrown_21.png",
    x: 195,
    y: 687,
    width: 64,
    height: 64,
}

tileBrown22 : Sprite
tileBrown22 = {
    name: "tileBrown_22.png",
    x: 195,
    y: 622,
    width: 64,
    height: 64,
}

tileBrown23 : Sprite
tileBrown23 = {
    name: "tileBrown_23.png",
    x: 195,
    y: 557,
    width: 64,
    height: 64,
}

tileBrown24 : Sprite
tileBrown24 = {
    name: "tileBrown_24.png",
    x: 195,
    y: 492,
    width: 64,
    height: 64,
}

tileBrown25 : Sprite
tileBrown25 = {
    name: "tileBrown_25.png",
    x: 195,
    y: 427,
    width: 64,
    height: 64,
}

tileBrown26 : Sprite
tileBrown26 = {
    name: "tileBrown_26.png",
    x: 195,
    y: 362,
    width: 64,
    height: 64,
}

tileBrown27 : Sprite
tileBrown27 = {
    name: "tileBrown_27.png",
    x: 585,
    y: 557,
    width: 64,
    height: 64,
}

tileGreen01 : Sprite
tileGreen01 = {
    name: "tileGreen_01.png",
    x: 195,
    y: 311,
    width: 64,
    height: 50,
}

tileGreen02 : Sprite
tileGreen02 = {
    name: "tileGreen_02.png",
    x: 195,
    y: 260,
    width: 64,
    height: 50,
}

tileGreen03 : Sprite
tileGreen03 = {
    name: "tileGreen_03.png",
    x: 195,
    y: 195,
    width: 64,
    height: 64,
}

tileGreen04 : Sprite
tileGreen04 = {
    name: "tileGreen_04.png",
    x: 195,
    y: 130,
    width: 64,
    height: 64,
}

tileGreen05 : Sprite
tileGreen05 = {
    name: "tileGreen_05.png",
    x: 195,
    y: 65,
    width: 64,
    height: 64,
}

tileGreen06 : Sprite
tileGreen06 = {
    name: "tileGreen_06.png",
    x: 195,
    y: 0,
    width: 64,
    height: 64,
}

tileGreen07 : Sprite
tileGreen07 = {
    name: "tileGreen_07.png",
    x: 130,
    y: 910,
    width: 64,
    height: 64,
}

tileGreen08 : Sprite
tileGreen08 = {
    name: "tileGreen_08.png",
    x: 130,
    y: 845,
    width: 64,
    height: 64,
}

tileGreen09 : Sprite
tileGreen09 = {
    name: "tileGreen_09.png",
    x: 130,
    y: 780,
    width: 64,
    height: 64,
}

tileGreen10 : Sprite
tileGreen10 = {
    name: "tileGreen_10.png",
    x: 130,
    y: 715,
    width: 64,
    height: 64,
}

tileGreen11 : Sprite
tileGreen11 = {
    name: "tileGreen_11.png",
    x: 130,
    y: 650,
    width: 64,
    height: 64,
}

tileGreen12 : Sprite
tileGreen12 = {
    name: "tileGreen_12.png",
    x: 130,
    y: 585,
    width: 64,
    height: 64,
}

tileGreen13 : Sprite
tileGreen13 = {
    name: "tileGreen_13.png",
    x: 130,
    y: 520,
    width: 64,
    height: 64,
}

tileGreen14 : Sprite
tileGreen14 = {
    name: "tileGreen_14.png",
    x: 130,
    y: 455,
    width: 64,
    height: 64,
}

tileGreen15 : Sprite
tileGreen15 = {
    name: "tileGreen_15.png",
    x: 130,
    y: 390,
    width: 64,
    height: 64,
}

tileGreen16 : Sprite
tileGreen16 = {
    name: "tileGreen_16.png",
    x: 130,
    y: 325,
    width: 64,
    height: 64,
}

tileGreen17 : Sprite
tileGreen17 = {
    name: "tileGreen_17.png",
    x: 130,
    y: 260,
    width: 64,
    height: 64,
}

tileGreen18 : Sprite
tileGreen18 = {
    name: "tileGreen_18.png",
    x: 130,
    y: 195,
    width: 64,
    height: 64,
}

tileGreen19 : Sprite
tileGreen19 = {
    name: "tileGreen_19.png",
    x: 130,
    y: 130,
    width: 64,
    height: 64,
}

tileGreen20 : Sprite
tileGreen20 = {
    name: "tileGreen_20.png",
    x: 130,
    y: 65,
    width: 64,
    height: 64,
}

tileGreen21 : Sprite
tileGreen21 = {
    name: "tileGreen_21.png",
    x: 130,
    y: 0,
    width: 64,
    height: 64,
}

tileGreen22 : Sprite
tileGreen22 = {
    name: "tileGreen_22.png",
    x: 65,
    y: 925,
    width: 64,
    height: 64,
}

tileGreen23 : Sprite
tileGreen23 = {
    name: "tileGreen_23.png",
    x: 65,
    y: 860,
    width: 64,
    height: 64,
}

tileGreen24 : Sprite
tileGreen24 = {
    name: "tileGreen_24.png",
    x: 65,
    y: 795,
    width: 64,
    height: 64,
}

tileGreen25 : Sprite
tileGreen25 = {
    name: "tileGreen_25.png",
    x: 65,
    y: 730,
    width: 64,
    height: 64,
}

tileGreen26 : Sprite
tileGreen26 = {
    name: "tileGreen_26.png",
    x: 65,
    y: 679,
    width: 64,
    height: 50,
}

tileGreen27 : Sprite
tileGreen27 = {
    name: "tileGreen_27.png",
    x: 65,
    y: 628,
    width: 64,
    height: 50,
}

tileYellow01 : Sprite
tileYellow01 = {
    name: "tileYellow_01.png",
    x: 65,
    y: 574,
    width: 64,
    height: 53,
}

tileYellow02 : Sprite
tileYellow02 = {
    name: "tileYellow_02.png",
    x: 65,
    y: 520,
    width: 64,
    height: 53,
}

tileYellow03 : Sprite
tileYellow03 = {
    name: "tileYellow_03.png",
    x: 0,
    y: 964,
    width: 64,
    height: 53,
}

tileYellow04 : Sprite
tileYellow04 = {
    name: "tileYellow_04.png",
    x: 585,
    y: 260,
    width: 64,
    height: 64,
}

tileYellow05 : Sprite
tileYellow05 = {
    name: "tileYellow_05.png",
    x: 65,
    y: 455,
    width: 64,
    height: 64,
}

tileYellow06 : Sprite
tileYellow06 = {
    name: "tileYellow_06.png",
    x: 65,
    y: 390,
    width: 64,
    height: 64,
}

tileYellow07 : Sprite
tileYellow07 = {
    name: "tileYellow_07.png",
    x: 65,
    y: 325,
    width: 64,
    height: 64,
}

tileYellow08 : Sprite
tileYellow08 = {
    name: "tileYellow_08.png",
    x: 65,
    y: 260,
    width: 64,
    height: 64,
}

tileYellow09 : Sprite
tileYellow09 = {
    name: "tileYellow_09.png",
    x: 65,
    y: 195,
    width: 64,
    height: 64,
}

tileYellow10 : Sprite
tileYellow10 = {
    name: "tileYellow_10.png",
    x: 65,
    y: 130,
    width: 64,
    height: 64,
}

tileYellow11 : Sprite
tileYellow11 = {
    name: "tileYellow_11.png",
    x: 65,
    y: 65,
    width: 64,
    height: 64,
}

tileYellow12 : Sprite
tileYellow12 = {
    name: "tileYellow_12.png",
    x: 65,
    y: 0,
    width: 64,
    height: 64,
}

tileYellow13 : Sprite
tileYellow13 = {
    name: "tileYellow_13.png",
    x: 0,
    y: 899,
    width: 64,
    height: 64,
}

tileYellow14 : Sprite
tileYellow14 = {
    name: "tileYellow_14.png",
    x: 0,
    y: 834,
    width: 64,
    height: 64,
}

tileYellow15 : Sprite
tileYellow15 = {
    name: "tileYellow_15.png",
    x: 0,
    y: 769,
    width: 64,
    height: 64,
}

tileYellow16 : Sprite
tileYellow16 = {
    name: "tileYellow_16.png",
    x: 0,
    y: 704,
    width: 64,
    height: 64,
}

tileYellow17 : Sprite
tileYellow17 = {
    name: "tileYellow_17.png",
    x: 0,
    y: 639,
    width: 64,
    height: 64,
}

tileYellow18 : Sprite
tileYellow18 = {
    name: "tileYellow_18.png",
    x: 0,
    y: 574,
    width: 64,
    height: 64,
}

tileYellow19 : Sprite
tileYellow19 = {
    name: "tileYellow_19.png",
    x: 0,
    y: 509,
    width: 64,
    height: 64,
}

tileYellow20 : Sprite
tileYellow20 = {
    name: "tileYellow_20.png",
    x: 0,
    y: 444,
    width: 64,
    height: 64,
}

tileYellow21 : Sprite
tileYellow21 = {
    name: "tileYellow_21.png",
    x: 0,
    y: 379,
    width: 64,
    height: 64,
}

tileYellow22 : Sprite
tileYellow22 = {
    name: "tileYellow_22.png",
    x: 0,
    y: 314,
    width: 64,
    height: 64,
}

tileYellow23 : Sprite
tileYellow23 = {
    name: "tileYellow_23.png",
    x: 0,
    y: 249,
    width: 64,
    height: 64,
}

tileYellow24 : Sprite
tileYellow24 = {
    name: "tileYellow_24.png",
    x: 0,
    y: 184,
    width: 64,
    height: 64,
}

tileYellow25 : Sprite
tileYellow25 = {
    name: "tileYellow_25.png",
    x: 0,
    y: 119,
    width: 64,
    height: 64,
}

tileYellow26 : Sprite
tileYellow26 = {
    name: "tileYellow_26.png",
    x: 0,
    y: 54,
    width: 64,
    height: 64,
}

tileYellow27 : Sprite
tileYellow27 = {
    name: "tileYellow_27.png",
    x: 0,
    y: 0,
    width: 64,
    height: 53,
}

vine : Sprite
vine = {
    name: "vine.png",
    x: 990,
    y: 65,
    width: 10,
    height: 64,
}

vineBottom : Sprite
vineBottom = {
    name: "vine_bottom.png",
    x: 989,
    y: 705,
    width: 10,
    height: 38,
}

vineBottomAlt : Sprite
vineBottomAlt = {
    name: "vine_bottomAlt.png",
    x: 964,
    y: 659,
    width: 25,
    height: 45,
}

yellowCrystal : Sprite
yellowCrystal = {
    name: "yellowCrystal.png",
    x: 928,
    y: 491,
    width: 32,
    height: 30,
}

yellowGem : Sprite
yellowGem = {
    name: "yellowGem.png",
    x: 964,
    y: 751,
    width: 22,
    height: 22,
}

yellowJewel : Sprite
yellowJewel = {
    name: "yellowJewel.png",
    x: 963,
    y: 920,
    width: 24,
    height: 22,
}
