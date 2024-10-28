module [
    Sprite,
    imagePath,
    load!,
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

### A sprite atlas for the Kenney Abstract Platformer spritesheet
###
### Generated by a script; do not edit this module manually
###
### See:
### scripts/generate_sprite_atlas.roc
### examples/assets/platformer/spritesheet_complete.png
### examples/assets/platformer/spritesheet_complete.xml
### examples/assets/platformer/License.txt
###
### https://kenney.nl/assets/abstract-platformer
###

import rr.RocRay exposing [Texture, Rectangle]
import rr.Texture

## the relative asset path to the sprite sheet image file
imagePath : Str
imagePath =
    "examples/assets/platformer/spritesheet_complete.png"

## load the sprite sheet as a raylib texture
load! : {} => Texture
load! = \{} ->
    Texture.load! imagePath

## an individual image's offset and size in the sprite sheet
Sprite : Rectangle

## blockBrown.png
blockBrown : Sprite
blockBrown = {
    x: 455,
    y: 849,
    width: 64,
    height: 64,
}

## blockBrown_broken.png
blockBrownBroken : Sprite
blockBrownBroken = {
    x: 455,
    y: 914,
    width: 64,
    height: 64,
}

## blockGreen.png
blockGreen : Sprite
blockGreen = {
    x: 520,
    y: 0,
    width: 64,
    height: 64,
}

## blockGreen_key.png
blockGreenKey : Sprite
blockGreenKey = {
    x: 520,
    y: 65,
    width: 64,
    height: 64,
}

## blockGreen_lock.png
blockGreenLock : Sprite
blockGreenLock = {
    x: 520,
    y: 179,
    width: 64,
    height: 64,
}

## blockGreen_puzzle.png
blockGreenPuzzle : Sprite
blockGreenPuzzle = {
    x: 520,
    y: 244,
    width: 64,
    height: 64,
}

## blockGrey.png
blockGrey : Sprite
blockGrey = {
    x: 520,
    y: 309,
    width: 64,
    height: 64,
}

## blockGrey_broken.png
blockGreyBroken : Sprite
blockGreyBroken = {
    x: 520,
    y: 374,
    width: 64,
    height: 64,
}

## blockRed.png
blockRed : Sprite
blockRed = {
    x: 520,
    y: 504,
    width: 64,
    height: 64,
}

## blockRed_key.png
blockRedKey : Sprite
blockRedKey = {
    x: 520,
    y: 634,
    width: 64,
    height: 64,
}

## blockRed_lock.png
blockRedLock : Sprite
blockRedLock = {
    x: 520,
    y: 795,
    width: 64,
    height: 64,
}

## blockRed_puzzle.png
blockRedPuzzle : Sprite
blockRedPuzzle = {
    x: 520,
    y: 860,
    width: 64,
    height: 64,
}

## blueCrystal.png
blueCrystal : Sprite
blueCrystal = {
    x: 929,
    y: 317,
    width: 32,
    height: 30,
}

## blueGem.png
blueGem : Sprite
blueGem = {
    x: 964,
    y: 797,
    width: 22,
    height: 22,
}

## blueJewel.png
blueJewel : Sprite
blueJewel = {
    x: 964,
    y: 705,
    width: 24,
    height: 22,
}

## buttonFloor.png
buttonFloor : Sprite
buttonFloor = {
    x: 65,
    y: 1001,
    width: 54,
    height: 12,
}

## buttonFloor_pressed.png
buttonFloorPressed : Sprite
buttonFloorPressed = {
    x: 65,
    y: 1014,
    width: 54,
    height: 8,
}

## buttonGreen.png
buttonGreen : Sprite
buttonGreen = {
    x: 707,
    y: 781,
    width: 50,
    height: 29,
}

## buttonGreen_pressed.png
buttonGreenPressed : Sprite
buttonGreenPressed = {
    x: 696,
    y: 1005,
    width: 50,
    height: 17,
}

## buttonRed.png
buttonRed : Sprite
buttonRed = {
    x: 707,
    y: 751,
    width: 50,
    height: 29,
}

## buttonRed_pressed.png
buttonRedPressed : Sprite
buttonRedPressed = {
    x: 645,
    y: 1005,
    width: 50,
    height: 17,
}

## discGreen.png
discGreen : Sprite
discGreen = {
    x: 928,
    y: 216,
    width: 34,
    height: 35,
}

## discRed.png
discRed : Sprite
discRed = {
    x: 927,
    y: 102,
    width: 34,
    height: 35,
}

## doorGreen.png
doorGreen : Sprite
doorGreen = {
    x: 585,
    y: 446,
    width: 64,
    height: 64,
}

## doorGreen_lock.png
doorGreenLock : Sprite
doorGreenLock = {
    x: 650,
    y: 92,
    width: 64,
    height: 64,
}

## doorGreen_top.png
doorGreenTop : Sprite
doorGreenTop = {
    x: 520,
    y: 699,
    width: 64,
    height: 64,
}

## doorOpen.png
doorOpen : Sprite
doorOpen = {
    x: 585,
    y: 714,
    width: 64,
    height: 64,
}

## doorOpen_top.png
doorOpenTop : Sprite
doorOpenTop = {
    x: 585,
    y: 65,
    width: 64,
    height: 64,
}

## doorRed.png
doorRed : Sprite
doorRed = {
    x: 585,
    y: 0,
    width: 64,
    height: 64,
}

## doorRed_lock.png
doorRedLock : Sprite
doorRedLock = {
    x: 325,
    y: 427,
    width: 64,
    height: 64,
}

## doorRed_top.png
doorRedTop : Sprite
doorRedTop = {
    x: 520,
    y: 925,
    width: 64,
    height: 64,
}

## enemyFloating_1.png
enemyFloating1 : Sprite
enemyFloating1 = {
    x: 807,
    y: 306,
    width: 42,
    height: 40,
}

## enemyFloating_2.png
enemyFloating2 : Sprite
enemyFloating2 = {
    x: 650,
    y: 839,
    width: 55,
    height: 55,
}

## enemyFloating_3.png
enemyFloating3 : Sprite
enemyFloating3 = {
    x: 809,
    y: 51,
    width: 40,
    height: 40,
}

## enemyFloating_4.png
enemyFloating4 : Sprite
enemyFloating4 = {
    x: 805,
    y: 924,
    width: 42,
    height: 40,
}

## enemyFlyingAlt_1.png
enemyFlyingAlt1 : Sprite
enemyFlyingAlt1 = {
    x: 706,
    y: 839,
    width: 52,
    height: 36,
}

## enemyFlyingAlt_2.png
enemyFlyingAlt2 : Sprite
enemyFlyingAlt2 = {
    x: 520,
    y: 996,
    width: 63,
    height: 24,
}

## enemyFlyingAlt_3.png
enemyFlyingAlt3 : Sprite
enemyFlyingAlt3 = {
    x: 705,
    y: 895,
    width: 52,
    height: 29,
}

## enemyFlyingAlt_4.png
enemyFlyingAlt4 : Sprite
enemyFlyingAlt4 = {
    x: 650,
    y: 354,
    width: 60,
    height: 29,
}

## enemyFlying_1.png
enemyFlying1 : Sprite
enemyFlying1 = {
    x: 455,
    y: 390,
    width: 64,
    height: 38,
}

## enemyFlying_2.png
enemyFlying2 : Sprite
enemyFlying2 = {
    x: 455,
    y: 429,
    width: 64,
    height: 38,
}

## enemyFlying_3.png
enemyFlying3 : Sprite
enemyFlying3 = {
    x: 455,
    y: 533,
    width: 64,
    height: 43,
}

## enemyFlying_4.png
enemyFlying4 : Sprite
enemyFlying4 = {
    x: 584,
    y: 996,
    width: 60,
    height: 25,
}

## enemySpikey_1.png
enemySpikey1 : Sprite
enemySpikey1 = {
    x: 929,
    y: 0,
    width: 32,
    height: 40,
}

## enemySpikey_2.png
enemySpikey2 : Sprite
enemySpikey2 = {
    x: 928,
    y: 994,
    width: 32,
    height: 28,
}

## enemySpikey_3.png
enemySpikey3 : Sprite
enemySpikey3 = {
    x: 929,
    y: 252,
    width: 32,
    height: 64,
}

## enemySpikey_4.png
enemySpikey4 : Sprite
enemySpikey4 = {
    x: 928,
    y: 522,
    width: 32,
    height: 40,
}

## enemySwimming_1.png
enemySwimming1 : Sprite
enemySwimming1 = {
    x: 805,
    y: 790,
    width: 44,
    height: 32,
}

## enemySwimming_2.png
enemySwimming2 : Sprite
enemySwimming2 = {
    x: 763,
    y: 153,
    width: 44,
    height: 32,
}

## enemySwimming_3.png
enemySwimming3 : Sprite
enemySwimming3 = {
    x: 758,
    y: 656,
    width: 46,
    height: 32,
}

## enemySwimming_4.png
enemySwimming4 : Sprite
enemySwimming4 = {
    x: 762,
    y: 306,
    width: 44,
    height: 32,
}

## enemyWalking_1.png
enemyWalking1 : Sprite
enemyWalking1 = {
    x: 928,
    y: 949,
    width: 32,
    height: 44,
}

## enemyWalking_2.png
enemyWalking2 : Sprite
enemyWalking2 = {
    x: 928,
    y: 417,
    width: 32,
    height: 42,
}

## enemyWalking_3.png
enemyWalking3 : Sprite
enemyWalking3 = {
    x: 710,
    y: 464,
    width: 49,
    height: 38,
}

## enemyWalking_4.png
enemyWalking4 : Sprite
enemyWalking4 = {
    x: 928,
    y: 837,
    width: 35,
    height: 41,
}

## fence.png
fence : Sprite
fence = {
    x: 585,
    y: 622,
    width: 64,
    height: 45,
}

## fenceBroken.png
fenceBroken : Sprite
fenceBroken = {
    x: 585,
    y: 668,
    width: 64,
    height: 45,
}

## fenceLeft.png
fenceLeft : Sprite
fenceLeft = {
    x: 585,
    y: 511,
    width: 64,
    height: 45,
}

## fenceMid.png
fenceMid : Sprite
fenceMid = {
    x: 650,
    y: 46,
    width: 64,
    height: 45,
}

## fenceOpen.png
fenceOpen : Sprite
fenceOpen = {
    x: 650,
    y: 0,
    width: 64,
    height: 45,
}

## fenceRight.png
fenceRight : Sprite
fenceRight = {
    x: 585,
    y: 950,
    width: 64,
    height: 45,
}

## flagGreen_down.png
flagGreenDown : Sprite
flagGreenDown = {
    x: 987,
    y: 813,
    width: 15,
    height: 61,
}

## flagGreen_up.png
flagGreenUp : Sprite
flagGreenUp = {
    x: 650,
    y: 446,
    width: 59,
    height: 61,
}

## flagRed_down.png
flagRedDown : Sprite
flagRedDown = {
    x: 987,
    y: 751,
    width: 15,
    height: 61,
}

## flagRed_up.png
flagRedUp : Sprite
flagRedUp = {
    x: 650,
    y: 384,
    width: 59,
    height: 61,
}

## fluidBlue.png
fluidBlue : Sprite
fluidBlue = {
    x: 585,
    y: 885,
    width: 64,
    height: 64,
}

## fluidBlue_top.png
fluidBlueTop : Sprite
fluidBlueTop = {
    x: 585,
    y: 820,
    width: 64,
    height: 64,
}

## fluidBrown.png
fluidBrown : Sprite
fluidBrown = {
    x: 585,
    y: 557,
    width: 64,
    height: 64,
}

## fluidBrown_top.png
fluidBrownTop : Sprite
fluidBrownTop = {
    x: 585,
    y: 381,
    width: 64,
    height: 64,
}

## fluidGreen.png
fluidGreen : Sprite
fluidGreen = {
    x: 585,
    y: 260,
    width: 64,
    height: 64,
}

## fluidGreen_top.png
fluidGreenTop : Sprite
fluidGreenTop = {
    x: 585,
    y: 195,
    width: 64,
    height: 64,
}

## fluidRed.png
fluidRed : Sprite
fluidRed = {
    x: 585,
    y: 130,
    width: 64,
    height: 64,
}

## fluidRed_top.png
fluidRedTop : Sprite
fluidRedTop = {
    x: 520,
    y: 569,
    width: 64,
    height: 64,
}

## greenCrystal.png
greenCrystal : Sprite
greenCrystal = {
    x: 928,
    y: 460,
    width: 32,
    height: 30,
}

## greenGem.png
greenGem : Sprite
greenGem = {
    x: 964,
    y: 774,
    width: 22,
    height: 22,
}

## greenJewel.png
greenJewel : Sprite
greenJewel = {
    x: 807,
    y: 347,
    width: 24,
    height: 22,
}

## keyGreen.png
keyGreen : Sprite
keyGreen = {
    x: 961,
    y: 495,
    width: 29,
    height: 30,
}

## keyRed.png
keyRed : Sprite
keyRed = {
    x: 962,
    y: 252,
    width: 29,
    height: 30,
}

## ladderNarrow_mid.png
ladderNarrowMid : Sprite
ladderNarrowMid = {
    x: 650,
    y: 508,
    width: 56,
    height: 64,
}

## ladderNarrow_top.png
ladderNarrowTop : Sprite
ladderNarrowTop = {
    x: 650,
    y: 724,
    width: 56,
    height: 48,
}

## ladderWide_mid.png
ladderWideMid : Sprite
ladderWideMid = {
    x: 520,
    y: 439,
    width: 64,
    height: 64,
}

## ladderWide_top.png
ladderWideTop : Sprite
ladderWideTop = {
    x: 520,
    y: 130,
    width: 64,
    height: 48,
}

## lockGreen.png
lockGreen : Sprite
lockGreen = {
    x: 455,
    y: 784,
    width: 64,
    height: 64,
}

## lockGreenBottom.png
lockGreenBottom : Sprite
lockGreenBottom = {
    x: 455,
    y: 577,
    width: 64,
    height: 64,
}

## lockGreenLeft.png
lockGreenLeft : Sprite
lockGreenLeft = {
    x: 455,
    y: 468,
    width: 64,
    height: 64,
}

## lockGreenLock.png
lockGreenLock : Sprite
lockGreenLock = {
    x: 455,
    y: 325,
    width: 64,
    height: 64,
}

## lockGreenMid.png
lockGreenMid : Sprite
lockGreenMid = {
    x: 455,
    y: 260,
    width: 64,
    height: 64,
}

## lockGreenRight.png
lockGreenRight : Sprite
lockGreenRight = {
    x: 455,
    y: 195,
    width: 64,
    height: 64,
}

## lockGreenTop.png
lockGreenTop : Sprite
lockGreenTop = {
    x: 455,
    y: 130,
    width: 64,
    height: 64,
}

## lockRed.png
lockRed : Sprite
lockRed = {
    x: 455,
    y: 0,
    width: 64,
    height: 64,
}

## lockRedBottom.png
lockRedBottom : Sprite
lockRedBottom = {
    x: 390,
    y: 947,
    width: 64,
    height: 64,
}

## lockRedLeft.png
lockRedLeft : Sprite
lockRedLeft = {
    x: 390,
    y: 817,
    width: 64,
    height: 64,
}

## lockRedLock.png
lockRedLock : Sprite
lockRedLock = {
    x: 390,
    y: 752,
    width: 64,
    height: 64,
}

## lockRedMid.png
lockRedMid : Sprite
lockRedMid = {
    x: 585,
    y: 130,
    width: 64,
    height: 64,
}

## lockRedRight.png
lockRedRight : Sprite
lockRedRight = {
    x: 390,
    y: 687,
    width: 64,
    height: 64,
}

## lockRedTop.png
lockRedTop : Sprite
lockRedTop = {
    x: 455,
    y: 65,
    width: 64,
    height: 64,
}

## outlineCrystal.png
outlineCrystal : Sprite
outlineCrystal = {
    x: 889,
    y: 926,
    width: 38,
    height: 36,
}

## outlineDisc.png
outlineDisc : Sprite
outlineDisc = {
    x: 848,
    y: 963,
    width: 40,
    height: 41,
}

## outlineDisc_alt.png
outlineDiscAlt : Sprite
outlineDiscAlt = {
    x: 848,
    y: 921,
    width: 40,
    height: 41,
}

## outlineGem.png
outlineGem : Sprite
outlineGem = {
    x: 962,
    y: 283,
    width: 28,
    height: 28,
}

## outlineJewel.png
outlineJewel : Sprite
outlineJewel = {
    x: 929,
    y: 379,
    width: 30,
    height: 28,
}

## outlineKey.png
outlineKey : Sprite
outlineKey = {
    x: 927,
    y: 624,
    width: 36,
    height: 36,
}

## outlinePuzzle.png
outlinePuzzle : Sprite
outlinePuzzle = {
    x: 849,
    y: 347,
    width: 40,
    height: 40,
}

## plantBlue_1.png
plantBlue1 : Sprite
plantBlue1 = {
    x: 963,
    y: 145,
    width: 26,
    height: 48,
}

## plantBlue_2.png
plantBlue2 : Sprite
plantBlue2 = {
    x: 805,
    y: 755,
    width: 44,
    height: 34,
}

## plantBlue_3.png
plantBlue3 : Sprite
plantBlue3 = {
    x: 707,
    y: 811,
    width: 42,
    height: 24,
}

## plantBlue_4.png
plantBlue4 : Sprite
plantBlue4 = {
    x: 961,
    y: 949,
    width: 29,
    height: 55,
}

## plantBlue_5.png
plantBlue5 : Sprite
plantBlue5 = {
    x: 705,
    y: 925,
    width: 44,
    height: 22,
}

## plantBlue_6.png
plantBlue6 : Sprite
plantBlue6 = {
    x: 928,
    y: 138,
    width: 34,
    height: 39,
}

## plantBottom_1.png
plantBottom1 : Sprite
plantBottom1 = {
    x: 962,
    y: 0,
    width: 28,
    height: 64,
}

## plantBottom_2.png
plantBottom2 : Sprite
plantBottom2 = {
    x: 890,
    y: 662,
    width: 36,
    height: 64,
}

## plantDark_1.png
plantDark1 : Sprite
plantDark1 = {
    x: 850,
    y: 207,
    width: 38,
    height: 37,
}

## plantDark_2.png
plantDark2 : Sprite
plantDark2 = {
    x: 850,
    y: 567,
    width: 36,
    height: 31,
}

## plantDark_3.png
plantDark3 : Sprite
plantDark3 = {
    x: 963,
    y: 194,
    width: 26,
    height: 50,
}

## plantDark_4.png
plantDark4 : Sprite
plantDark4 = {
    x: 929,
    y: 41,
    width: 32,
    height: 49,
}

## plantDark_5.png
plantDark5 : Sprite
plantDark5 = {
    x: 962,
    y: 312,
    width: 28,
    height: 32,
}

## plantDark_6.png
plantDark6 : Sprite
plantDark6 = {
    x: 962,
    y: 65,
    width: 27,
    height: 38,
}

## plantGreen_1.png
plantGreen1 : Sprite
plantGreen1 = {
    x: 763,
    y: 108,
    width: 44,
    height: 44,
}

## plantGreen_2.png
plantGreen2 : Sprite
plantGreen2 = {
    x: 762,
    y: 339,
    width: 44,
    height: 32,
}

## plantGreen_3.png
plantGreen3 : Sprite
plantGreen3 = {
    x: 890,
    y: 727,
    width: 36,
    height: 31,
}

## plantGreen_4.png
plantGreen4 : Sprite
plantGreen4 = {
    x: 961,
    y: 526,
    width: 29,
    height: 50,
}

## plantGreen_5.png
plantGreen5 : Sprite
plantGreen5 = {
    x: 808,
    y: 147,
    width: 41,
    height: 47,
}

## plantGreen_6.png
plantGreen6 : Sprite
plantGreen6 = {
    x: 806,
    y: 599,
    width: 42,
    height: 36,
}

## plantLeaves_1.png
plantLeaves1 : Sprite
plantLeaves1 = {
    x: 889,
    y: 207,
    width: 38,
    height: 64,
}

## plantLeaves_3.png
plantLeaves3 : Sprite
plantLeaves3 = {
    x: 850,
    y: 142,
    width: 38,
    height: 64,
}

## plantRed_1.png
plantRed1 : Sprite
plantRed1 = {
    x: 929,
    y: 348,
    width: 31,
    height: 30,
}

## plantRed_2.png
plantRed2 : Sprite
plantRed2 = {
    x: 961,
    y: 466,
    width: 30,
    height: 28,
}

## plantRed_3.png
plantRed3 : Sprite
plantRed3 = {
    x: 806,
    y: 372,
    width: 42,
    height: 23,
}

## plantRed_4.png
plantRed4 : Sprite
plantRed4 = {
    x: 928,
    y: 178,
    width: 34,
    height: 37,
}

## plantRed_5.png
plantRed5 : Sprite
plantRed5 = {
    x: 890,
    y: 461,
    width: 37,
    height: 32,
}

## plantRed_6.png
plantRed6 : Sprite
plantRed6 = {
    x: 809,
    y: 0,
    width: 40,
    height: 50,
}

## plantStem_Tleft.png
plantStemTleft : Sprite
plantStemTleft = {
    x: 889,
    y: 142,
    width: 38,
    height: 64,
}

## plantStem_Tright.png
plantStemTright : Sprite
plantStemTright = {
    x: 927,
    y: 661,
    width: 36,
    height: 64,
}

## plantStem_cornerLeft.png
plantStemCornerLeft : Sprite
plantStemCornerLeft = {
    x: 890,
    y: 578,
    width: 36,
    height: 37,
}

## plantStem_cornerRight.png
plantStemCornerRight : Sprite
plantStemCornerRight = {
    x: 806,
    y: 452,
    width: 38,
    height: 37,
}

## plantStem_cross.png
plantStemCross : Sprite
plantStemCross = {
    x: 455,
    y: 719,
    width: 64,
    height: 64,
}

## plantStem_horizontal.png
plantStemHorizontal : Sprite
plantStemHorizontal = {
    x: 65,
    y: 990,
    width: 64,
    height: 10,
}

## plantStem_vertical.png
plantStemVertical : Sprite
plantStemVertical = {
    x: 65,
    y: 990,
    width: 64,
    height: 10,
}

## plantThorns_horizontal.png
plantThornsHorizontal : Sprite
plantThornsHorizontal = {
    x: 455,
    y: 979,
    width: 64,
    height: 36,
}

## plantThorns_vertical.png
plantThornsVertical : Sprite
plantThornsVertical = {
    x: 927,
    y: 726,
    width: 36,
    height: 64,
}

## plantTop_blue.png
plantTopBlue : Sprite
plantTopBlue = {
    x: 650,
    y: 157,
    width: 62,
    height: 54,
}

## plantTop_leaves.png
plantTopLeaves : Sprite
plantTopLeaves = {
    x: 650,
    y: 267,
    width: 62,
    height: 31,
}

## plantTop_red.png
plantTopRed : Sprite
plantTopRed = {
    x: 650,
    y: 299,
    width: 62,
    height: 54,
}

## plantTop_yellow.png
plantTopYellow : Sprite
plantTopYellow = {
    x: 650,
    y: 212,
    width: 62,
    height: 54,
}

## playerBlue_dead.png
playerBlueDead : Sprite
playerBlueDead = {
    x: 762,
    y: 258,
    width: 45,
    height: 47,
}

## playerBlue_duck.png
playerBlueDuck : Sprite
playerBlueDuck = {
    x: 650,
    y: 605,
    width: 56,
    height: 40,
}

## playerBlue_fall.png
playerBlueFall : Sprite
playerBlueFall = {
    x: 805,
    y: 490,
    width: 44,
    height: 54,
}

## playerBlue_hit.png
playerBlueHit : Sprite
playerBlueHit = {
    x: 758,
    y: 730,
    width: 46,
    height: 40,
}

## playerBlue_roll.png
playerBlueRoll : Sprite
playerBlueRoll = {
    x: 849,
    y: 388,
    width: 40,
    height: 40,
}

## playerBlue_stand.png
playerBlueStand : Sprite
playerBlueStand = {
    x: 762,
    y: 203,
    width: 45,
    height: 54,
}

## playerBlue_swim1.png
playerBlueSwim1 : Sprite
playerBlueSwim1 = {
    x: 805,
    y: 545,
    width: 44,
    height: 53,
}

## playerBlue_swim2.png
playerBlueSwim2 : Sprite
playerBlueSwim2 = {
    x: 764,
    y: 0,
    width: 44,
    height: 54,
}

## playerBlue_switch1.png
playerBlueSwitch1 : Sprite
playerBlueSwitch1 = {
    x: 650,
    y: 895,
    width: 54,
    height: 54,
}

## playerBlue_switch2.png
playerBlueSwitch2 : Sprite
playerBlueSwitch2 = {
    x: 650,
    y: 950,
    width: 53,
    height: 54,
}

## playerBlue_up1.png
playerBlueUp1 : Sprite
playerBlueUp1 = {
    x: 760,
    y: 435,
    width: 45,
    height: 54,
}

## playerBlue_up2.png
playerBlueUp2 : Sprite
playerBlueUp2 = {
    x: 759,
    y: 556,
    width: 45,
    height: 50,
}

## playerBlue_up3.png
playerBlueUp3 : Sprite
playerBlueUp3 = {
    x: 758,
    y: 771,
    width: 46,
    height: 40,
}

## playerBlue_walk1.png
playerBlueWalk1 : Sprite
playerBlueWalk1 = {
    x: 759,
    y: 812,
    width: 45,
    height: 54,
}

## playerBlue_walk2.png
playerBlueWalk2 : Sprite
playerBlueWalk2 = {
    x: 760,
    y: 380,
    width: 45,
    height: 54,
}

## playerBlue_walk3.png
playerBlueWalk3 : Sprite
playerBlueWalk3 = {
    x: 759,
    y: 503,
    width: 45,
    height: 52,
}

## playerBlue_walk4.png
playerBlueWalk4 : Sprite
playerBlueWalk4 = {
    x: 713,
    y: 157,
    width: 49,
    height: 45,
}

## playerBlue_walk5.png
playerBlueWalk5 : Sprite
playerBlueWalk5 = {
    x: 585,
    y: 779,
    width: 64,
    height: 40,
}

## playerGreen_dead.png
playerGreenDead : Sprite
playerGreenDead = {
    x: 890,
    y: 272,
    width: 38,
    height: 43,
}

## playerGreen_duck.png
playerGreenDuck : Sprite
playerGreenDuck = {
    x: 650,
    y: 573,
    width: 56,
    height: 31,
}

## playerGreen_fall.png
playerGreenFall : Sprite
playerGreenFall = {
    x: 890,
    y: 316,
    width: 38,
    height: 49,
}

## playerGreen_hit.png
playerGreenHit : Sprite
playerGreenHit = {
    x: 758,
    y: 689,
    width: 46,
    height: 40,
}

## playerGreen_roll.png
playerGreenRoll : Sprite
playerGreenRoll = {
    x: 849,
    y: 599,
    width: 40,
    height: 40,
}

## playerGreen_stand.png
playerGreenStand : Sprite
playerGreenStand = {
    x: 890,
    y: 0,
    width: 38,
    height: 50,
}

## playerGreen_swim1.png
playerGreenSwim1 : Sprite
playerGreenSwim1 = {
    x: 849,
    y: 823,
    width: 40,
    height: 53,
}

## playerGreen_swim2.png
playerGreenSwim2 : Sprite
playerGreenSwim2 = {
    x: 808,
    y: 92,
    width: 41,
    height: 54,
}

## playerGreen_switch1.png
playerGreenSwitch1 : Sprite
playerGreenSwitch1 = {
    x: 707,
    y: 508,
    width: 51,
    height: 50,
}

## playerGreen_switch2.png
playerGreenSwitch2 : Sprite
playerGreenSwitch2 = {
    x: 707,
    y: 654,
    width: 50,
    height: 50,
}

## playerGreen_up1.png
playerGreenUp1 : Sprite
playerGreenUp1 = {
    x: 890,
    y: 51,
    width: 38,
    height: 50,
}

## playerGreen_up2.png
playerGreenUp2 : Sprite
playerGreenUp2 = {
    x: 849,
    y: 877,
    width: 38,
    height: 43,
}

## playerGreen_up3.png
playerGreenUp3 : Sprite
playerGreenUp3 = {
    x: 849,
    y: 429,
    width: 40,
    height: 39,
}

## playerGreen_walk1.png
playerGreenWalk1 : Sprite
playerGreenWalk1 = {
    x: 890,
    y: 366,
    width: 38,
    height: 50,
}

## playerGreen_walk2.png
playerGreenWalk2 : Sprite
playerGreenWalk2 = {
    x: 889,
    y: 963,
    width: 38,
    height: 48,
}

## playerGreen_walk3.png
playerGreenWalk3 : Sprite
playerGreenWalk3 = {
    x: 889,
    y: 877,
    width: 38,
    height: 48,
}

## playerGreen_walk4.png
playerGreenWalk4 : Sprite
playerGreenWalk4 = {
    x: 713,
    y: 259,
    width: 48,
    height: 43,
}

## playerGreen_walk5.png
playerGreenWalk5 : Sprite
playerGreenWalk5 = {
    x: 455,
    y: 642,
    width: 64,
    height: 39,
}

## playerGrey_dead.png
playerGreyDead : Sprite
playerGreyDead = {
    x: 890,
    y: 759,
    width: 36,
    height: 39,
}

## playerGrey_duck.png
playerGreyDuck : Sprite
playerGreyDuck = {
    x: 650,
    y: 808,
    width: 56,
    height: 30,
}

## playerGrey_fall.png
playerGreyFall : Sprite
playerGreyFall = {
    x: 890,
    y: 616,
    width: 36,
    height: 45,
}

## playerGrey_hit.png
playerGreyHit : Sprite
playerGreyHit = {
    x: 710,
    y: 427,
    width: 49,
    height: 36,
}

## playerGrey_roll.png
playerGreyRoll : Sprite
playerGreyRoll = {
    x: 890,
    y: 102,
    width: 36,
    height: 36,
}

## playerGrey_stand.png
playerGreyStand : Sprite
playerGreyStand = {
    x: 890,
    y: 799,
    width: 36,
    height: 45,
}

## playerGrey_swim1.png
playerGreySwim1 : Sprite
playerGreySwim1 = {
    x: 805,
    y: 823,
    width: 43,
    height: 41,
}

## playerGrey_swim2.png
playerGreySwim2 : Sprite
playerGreySwim2 = {
    x: 805,
    y: 656,
    width: 44,
    height: 42,
}

## playerGrey_switch1.png
playerGreySwitch1 : Sprite
playerGreySwitch1 = {
    x: 707,
    y: 705,
    width: 50,
    height: 45,
}

## playerGrey_switch2.png
playerGreySwitch2 : Sprite
playerGreySwitch2 = {
    x: 707,
    y: 608,
    width: 50,
    height: 45,
}

## playerGrey_up1.png
playerGreyUp1 : Sprite
playerGreyUp1 = {
    x: 927,
    y: 578,
    width: 36,
    height: 45,
}

## playerGrey_up2.png
playerGreyUp2 : Sprite
playerGreyUp2 = {
    x: 890,
    y: 537,
    width: 37,
    height: 40,
}

## playerGrey_up3.png
playerGreyUp3 : Sprite
playerGreyUp3 = {
    x: 764,
    y: 55,
    width: 44,
    height: 36,
}

## playerGrey_walk1.png
playerGreyWalk1 : Sprite
playerGreyWalk1 = {
    x: 927,
    y: 791,
    width: 36,
    height: 45,
}

## playerGrey_walk2.png
playerGreyWalk2 : Sprite
playerGreyWalk2 = {
    x: 890,
    y: 417,
    width: 37,
    height: 43,
}

## playerGrey_walk3.png
playerGreyWalk3 : Sprite
playerGreyWalk3 = {
    x: 890,
    y: 494,
    width: 37,
    height: 42,
}

## playerGrey_walk4.png
playerGreyWalk4 : Sprite
playerGreyWalk4 = {
    x: 713,
    y: 343,
    width: 48,
    height: 36,
}

## playerGrey_walk5.png
playerGreyWalk5 : Sprite
playerGreyWalk5 = {
    x: 455,
    y: 682,
    width: 64,
    height: 36,
}

## playerRed_dead.png
playerRedDead : Sprite
playerRedDead = {
    x: 850,
    y: 297,
    width: 39,
    height: 46,
}

## playerRed_duck.png
playerRedDuck : Sprite
playerRedDuck = {
    x: 650,
    y: 773,
    width: 56,
    height: 34,
}

## playerRed_fall.png
playerRedFall : Sprite
playerRedFall = {
    x: 850,
    y: 699,
    width: 39,
    height: 50,
}

## playerRed_hit.png
playerRedHit : Sprite
playerRedHit = {
    x: 650,
    y: 646,
    width: 56,
    height: 38,
}

## playerRed_roll.png
playerRedRoll : Sprite
playerRedRoll = {
    x: 808,
    y: 251,
    width: 40,
    height: 40,
}

## playerRed_stand.png
playerRedStand : Sprite
playerRedStand = {
    x: 850,
    y: 518,
    width: 39,
    height: 48,
}

## playerRed_swim1.png
playerRedSwim1 : Sprite
playerRedSwim1 = {
    x: 757,
    y: 925,
    width: 47,
    height: 50,
}

## playerRed_swim2.png
playerRedSwim2 : Sprite
playerRedSwim2 = {
    x: 715,
    y: 56,
    width: 48,
    height: 51,
}

## playerRed_switch1.png
playerRedSwitch1 : Sprite
playerRedSwitch1 = {
    x: 704,
    y: 950,
    width: 52,
    height: 48,
}

## playerRed_switch2.png
playerRedSwitch2 : Sprite
playerRedSwitch2 = {
    x: 707,
    y: 559,
    width: 51,
    height: 48,
}

## playerRed_up1.png
playerRedUp1 : Sprite
playerRedUp1 = {
    x: 850,
    y: 469,
    width: 39,
    height: 48,
}

## playerRed_up2.png
playerRedUp2 : Sprite
playerRedUp2 = {
    x: 850,
    y: 0,
    width: 39,
    height: 46,
}

## playerRed_up3.png
playerRedUp3 : Sprite
playerRedUp3 = {
    x: 650,
    y: 685,
    width: 56,
    height: 38,
}

## playerRed_walk1.png
playerRedWalk1 : Sprite
playerRedWalk1 = {
    x: 850,
    y: 47,
    width: 39,
    height: 48,
}

## playerRed_walk2.png
playerRedWalk2 : Sprite
playerRedWalk2 = {
    x: 850,
    y: 96,
    width: 39,
    height: 45,
}

## playerRed_walk3.png
playerRedWalk3 : Sprite
playerRedWalk3 = {
    x: 849,
    y: 251,
    width: 39,
    height: 45,
}

## playerRed_walk4.png
playerRedWalk4 : Sprite
playerRedWalk4 = {
    x: 710,
    y: 384,
    width: 49,
    height: 42,
}

## playerRed_walk5.png
playerRedWalk5 : Sprite
playerRedWalk5 = {
    x: 130,
    y: 975,
    width: 64,
    height: 38,
}

## puzzleGreen.png
puzzleGreen : Sprite
puzzleGreen = {
    x: 928,
    y: 914,
    width: 34,
    height: 34,
}

## puzzleRed.png
puzzleRed : Sprite
puzzleRed = {
    x: 928,
    y: 879,
    width: 34,
    height: 34,
}

## redCrystal.png
redCrystal : Sprite
redCrystal = {
    x: 890,
    y: 845,
    width: 32,
    height: 30,
}

## redGem.png
redGem : Sprite
redGem = {
    x: 964,
    y: 820,
    width: 22,
    height: 22,
}

## redJewel.png
redJewel : Sprite
redJewel = {
    x: 964,
    y: 728,
    width: 24,
    height: 22,
}

## signArrow.png
signArrow : Sprite
signArrow = {
    x: 713,
    y: 303,
    width: 48,
    height: 39,
}

## signArrow_BL.png
signArrowBL : Sprite
signArrowBL = {
    x: 806,
    y: 396,
    width: 42,
    height: 55,
}

## signArrow_BR.png
signArrowBR : Sprite
signArrowBR = {
    x: 808,
    y: 195,
    width: 41,
    height: 55,
}

## signArrow_TL.png
signArrowTL : Sprite
signArrowTL = {
    x: 806,
    y: 865,
    width: 42,
    height: 55,
}

## signArrow_TR.png
signArrowTR : Sprite
signArrowTR = {
    x: 805,
    y: 965,
    width: 42,
    height: 55,
}

## signArrow_down.png
signArrowDown : Sprite
signArrowDown = {
    x: 850,
    y: 750,
    width: 39,
    height: 58,
}

## signArrow_left.png
signArrowLeft : Sprite
signArrowLeft = {
    x: 715,
    y: 0,
    width: 48,
    height: 55,
}

## signArrow_right.png
signArrowRight : Sprite
signArrowRight = {
    x: 713,
    y: 203,
    width: 48,
    height: 55,
}

## signArrow_up.png
signArrowUp : Sprite
signArrowUp = {
    x: 850,
    y: 640,
    width: 39,
    height: 58,
}

## signLarge.png
signLarge : Sprite
signLarge = {
    x: 585,
    y: 325,
    width: 64,
    height: 55,
}

## signSmall.png
signSmall : Sprite
signSmall = {
    x: 805,
    y: 699,
    width: 44,
    height: 55,
}

## signpost.png
signpost : Sprite
signpost = {
    x: 990,
    y: 875,
    width: 12,
    height: 55,
}

## spikesHigh.png
spikesHigh : Sprite
spikesHigh = {
    x: 520,
    y: 764,
    width: 64,
    height: 30,
}

## spikesLow.png
spikesLow : Sprite
spikesLow = {
    x: 260,
    y: 996,
    width: 64,
    height: 26,
}

## switchGreen_left.png
switchGreenLeft : Sprite
switchGreenLeft = {
    x: 757,
    y: 976,
    width: 47,
    height: 47,
}

## switchGreen_mid.png
switchGreenMid : Sprite
switchGreenMid = {
    x: 961,
    y: 407,
    width: 30,
    height: 58,
}

## switchGreen_off.png
switchGreenOff : Sprite
switchGreenOff = {
    x: 964,
    y: 577,
    width: 26,
    height: 40,
}

## switchGreen_on.png
switchGreenOn : Sprite
switchGreenOn = {
    x: 963,
    y: 104,
    width: 26,
    height: 40,
}

## switchGreen_right.png
switchGreenRight : Sprite
switchGreenRight = {
    x: 758,
    y: 608,
    width: 47,
    height: 47,
}

## switchRed_left.png
switchRedLeft : Sprite
switchRedLeft = {
    x: 758,
    y: 876,
    width: 47,
    height: 47,
}

## switchRed_mid.png
switchRedMid : Sprite
switchRedMid = {
    x: 961,
    y: 348,
    width: 30,
    height: 58,
}

## switchRed_off.png
switchRedOff : Sprite
switchRedOff = {
    x: 963,
    y: 879,
    width: 26,
    height: 40,
}

## switchRed_on.png
switchRedOn : Sprite
switchRedOn = {
    x: 964,
    y: 618,
    width: 26,
    height: 40,
}

## switchRed_right.png
switchRedRight : Sprite
switchRedRight = {
    x: 715,
    y: 108,
    width: 47,
    height: 47,
}

## tileBlue_01.png
tileBlue01 : Sprite
tileBlue01 = {
    x: 390,
    y: 636,
    width: 64,
    height: 50,
}

## tileBlue_02.png
tileBlue02 : Sprite
tileBlue02 = {
    x: 390,
    y: 585,
    width: 64,
    height: 50,
}

## tileBlue_03.png
tileBlue03 : Sprite
tileBlue03 = {
    x: 390,
    y: 520,
    width: 64,
    height: 64,
}

## tileBlue_04.png
tileBlue04 : Sprite
tileBlue04 = {
    x: 390,
    y: 455,
    width: 64,
    height: 64,
}

## tileBlue_05.png
tileBlue05 : Sprite
tileBlue05 = {
    x: 390,
    y: 390,
    width: 64,
    height: 64,
}

## tileBlue_06.png
tileBlue06 : Sprite
tileBlue06 = {
    x: 390,
    y: 325,
    width: 64,
    height: 64,
}

## tileBlue_07.png
tileBlue07 : Sprite
tileBlue07 = {
    x: 390,
    y: 260,
    width: 64,
    height: 64,
}

## tileBlue_08.png
tileBlue08 : Sprite
tileBlue08 = {
    x: 390,
    y: 195,
    width: 64,
    height: 64,
}

## tileBlue_09.png
tileBlue09 : Sprite
tileBlue09 = {
    x: 390,
    y: 130,
    width: 64,
    height: 64,
}

## tileBlue_10.png
tileBlue10 : Sprite
tileBlue10 = {
    x: 390,
    y: 65,
    width: 64,
    height: 64,
}

## tileBlue_11.png
tileBlue11 : Sprite
tileBlue11 = {
    x: 390,
    y: 0,
    width: 64,
    height: 64,
}

## tileBlue_12.png
tileBlue12 : Sprite
tileBlue12 = {
    x: 325,
    y: 947,
    width: 64,
    height: 64,
}

## tileBlue_13.png
tileBlue13 : Sprite
tileBlue13 = {
    x: 325,
    y: 882,
    width: 64,
    height: 64,
}

## tileBlue_14.png
tileBlue14 : Sprite
tileBlue14 = {
    x: 325,
    y: 817,
    width: 64,
    height: 64,
}

## tileBlue_15.png
tileBlue15 : Sprite
tileBlue15 = {
    x: 325,
    y: 752,
    width: 64,
    height: 64,
}

## tileBlue_16.png
tileBlue16 : Sprite
tileBlue16 = {
    x: 325,
    y: 687,
    width: 64,
    height: 64,
}

## tileBlue_17.png
tileBlue17 : Sprite
tileBlue17 = {
    x: 325,
    y: 622,
    width: 64,
    height: 64,
}

## tileBlue_18.png
tileBlue18 : Sprite
tileBlue18 = {
    x: 325,
    y: 557,
    width: 64,
    height: 64,
}

## tileBlue_19.png
tileBlue19 : Sprite
tileBlue19 = {
    x: 325,
    y: 492,
    width: 64,
    height: 64,
}

## tileBlue_20.png
tileBlue20 : Sprite
tileBlue20 = {
    x: 390,
    y: 882,
    width: 64,
    height: 64,
}

## tileBlue_21.png
tileBlue21 : Sprite
tileBlue21 = {
    x: 325,
    y: 362,
    width: 64,
    height: 64,
}

## tileBlue_22.png
tileBlue22 : Sprite
tileBlue22 = {
    x: 325,
    y: 297,
    width: 64,
    height: 64,
}

## tileBlue_23.png
tileBlue23 : Sprite
tileBlue23 = {
    x: 325,
    y: 232,
    width: 64,
    height: 64,
}

## tileBlue_24.png
tileBlue24 : Sprite
tileBlue24 = {
    x: 325,
    y: 167,
    width: 64,
    height: 64,
}

## tileBlue_25.png
tileBlue25 : Sprite
tileBlue25 = {
    x: 325,
    y: 102,
    width: 64,
    height: 64,
}

## tileBlue_26.png
tileBlue26 : Sprite
tileBlue26 = {
    x: 325,
    y: 51,
    width: 64,
    height: 50,
}

## tileBlue_27.png
tileBlue27 : Sprite
tileBlue27 = {
    x: 325,
    y: 0,
    width: 64,
    height: 50,
}

## tileBrown_01.png
tileBrown01 : Sprite
tileBrown01 = {
    x: 260,
    y: 931,
    width: 64,
    height: 64,
}

## tileBrown_02.png
tileBrown02 : Sprite
tileBrown02 = {
    x: 260,
    y: 866,
    width: 64,
    height: 64,
}

## tileBrown_03.png
tileBrown03 : Sprite
tileBrown03 = {
    x: 260,
    y: 801,
    width: 64,
    height: 64,
}

## tileBrown_04.png
tileBrown04 : Sprite
tileBrown04 = {
    x: 260,
    y: 736,
    width: 64,
    height: 64,
}

## tileBrown_05.png
tileBrown05 : Sprite
tileBrown05 = {
    x: 260,
    y: 682,
    width: 64,
    height: 53,
}

## tileBrown_06.png
tileBrown06 : Sprite
tileBrown06 = {
    x: 260,
    y: 628,
    width: 64,
    height: 53,
}

## tileBrown_07.png
tileBrown07 : Sprite
tileBrown07 = {
    x: 260,
    y: 574,
    width: 64,
    height: 53,
}

## tileBrown_08.png
tileBrown08 : Sprite
tileBrown08 = {
    x: 260,
    y: 520,
    width: 64,
    height: 53,
}

## tileBrown_09.png
tileBrown09 : Sprite
tileBrown09 = {
    x: 260,
    y: 455,
    width: 64,
    height: 64,
}

## tileBrown_10.png
tileBrown10 : Sprite
tileBrown10 = {
    x: 260,
    y: 390,
    width: 64,
    height: 64,
}

## tileBrown_11.png
tileBrown11 : Sprite
tileBrown11 = {
    x: 260,
    y: 325,
    width: 64,
    height: 64,
}

## tileBrown_12.png
tileBrown12 : Sprite
tileBrown12 = {
    x: 260,
    y: 260,
    width: 64,
    height: 64,
}

## tileBrown_13.png
tileBrown13 : Sprite
tileBrown13 = {
    x: 260,
    y: 195,
    width: 64,
    height: 64,
}

## tileBrown_14.png
tileBrown14 : Sprite
tileBrown14 = {
    x: 260,
    y: 130,
    width: 64,
    height: 64,
}

## tileBrown_15.png
tileBrown15 : Sprite
tileBrown15 = {
    x: 260,
    y: 65,
    width: 64,
    height: 64,
}

## tileBrown_16.png
tileBrown16 : Sprite
tileBrown16 = {
    x: 260,
    y: 0,
    width: 64,
    height: 64,
}

## tileBrown_17.png
tileBrown17 : Sprite
tileBrown17 = {
    x: 195,
    y: 947,
    width: 64,
    height: 64,
}

## tileBrown_18.png
tileBrown18 : Sprite
tileBrown18 = {
    x: 195,
    y: 882,
    width: 64,
    height: 64,
}

## tileBrown_19.png
tileBrown19 : Sprite
tileBrown19 = {
    x: 195,
    y: 817,
    width: 64,
    height: 64,
}

## tileBrown_20.png
tileBrown20 : Sprite
tileBrown20 = {
    x: 195,
    y: 752,
    width: 64,
    height: 64,
}

## tileBrown_21.png
tileBrown21 : Sprite
tileBrown21 = {
    x: 195,
    y: 687,
    width: 64,
    height: 64,
}

## tileBrown_22.png
tileBrown22 : Sprite
tileBrown22 = {
    x: 195,
    y: 622,
    width: 64,
    height: 64,
}

## tileBrown_23.png
tileBrown23 : Sprite
tileBrown23 = {
    x: 195,
    y: 557,
    width: 64,
    height: 64,
}

## tileBrown_24.png
tileBrown24 : Sprite
tileBrown24 = {
    x: 195,
    y: 492,
    width: 64,
    height: 64,
}

## tileBrown_25.png
tileBrown25 : Sprite
tileBrown25 = {
    x: 195,
    y: 427,
    width: 64,
    height: 64,
}

## tileBrown_26.png
tileBrown26 : Sprite
tileBrown26 = {
    x: 195,
    y: 362,
    width: 64,
    height: 64,
}

## tileBrown_27.png
tileBrown27 : Sprite
tileBrown27 = {
    x: 585,
    y: 557,
    width: 64,
    height: 64,
}

## tileGreen_01.png
tileGreen01 : Sprite
tileGreen01 = {
    x: 195,
    y: 311,
    width: 64,
    height: 50,
}

## tileGreen_02.png
tileGreen02 : Sprite
tileGreen02 = {
    x: 195,
    y: 260,
    width: 64,
    height: 50,
}

## tileGreen_03.png
tileGreen03 : Sprite
tileGreen03 = {
    x: 195,
    y: 195,
    width: 64,
    height: 64,
}

## tileGreen_04.png
tileGreen04 : Sprite
tileGreen04 = {
    x: 195,
    y: 130,
    width: 64,
    height: 64,
}

## tileGreen_05.png
tileGreen05 : Sprite
tileGreen05 = {
    x: 195,
    y: 65,
    width: 64,
    height: 64,
}

## tileGreen_06.png
tileGreen06 : Sprite
tileGreen06 = {
    x: 195,
    y: 0,
    width: 64,
    height: 64,
}

## tileGreen_07.png
tileGreen07 : Sprite
tileGreen07 = {
    x: 130,
    y: 910,
    width: 64,
    height: 64,
}

## tileGreen_08.png
tileGreen08 : Sprite
tileGreen08 = {
    x: 130,
    y: 845,
    width: 64,
    height: 64,
}

## tileGreen_09.png
tileGreen09 : Sprite
tileGreen09 = {
    x: 130,
    y: 780,
    width: 64,
    height: 64,
}

## tileGreen_10.png
tileGreen10 : Sprite
tileGreen10 = {
    x: 130,
    y: 715,
    width: 64,
    height: 64,
}

## tileGreen_11.png
tileGreen11 : Sprite
tileGreen11 = {
    x: 130,
    y: 650,
    width: 64,
    height: 64,
}

## tileGreen_12.png
tileGreen12 : Sprite
tileGreen12 = {
    x: 130,
    y: 585,
    width: 64,
    height: 64,
}

## tileGreen_13.png
tileGreen13 : Sprite
tileGreen13 = {
    x: 130,
    y: 520,
    width: 64,
    height: 64,
}

## tileGreen_14.png
tileGreen14 : Sprite
tileGreen14 = {
    x: 130,
    y: 455,
    width: 64,
    height: 64,
}

## tileGreen_15.png
tileGreen15 : Sprite
tileGreen15 = {
    x: 130,
    y: 390,
    width: 64,
    height: 64,
}

## tileGreen_16.png
tileGreen16 : Sprite
tileGreen16 = {
    x: 130,
    y: 325,
    width: 64,
    height: 64,
}

## tileGreen_17.png
tileGreen17 : Sprite
tileGreen17 = {
    x: 130,
    y: 260,
    width: 64,
    height: 64,
}

## tileGreen_18.png
tileGreen18 : Sprite
tileGreen18 = {
    x: 130,
    y: 195,
    width: 64,
    height: 64,
}

## tileGreen_19.png
tileGreen19 : Sprite
tileGreen19 = {
    x: 130,
    y: 130,
    width: 64,
    height: 64,
}

## tileGreen_20.png
tileGreen20 : Sprite
tileGreen20 = {
    x: 130,
    y: 65,
    width: 64,
    height: 64,
}

## tileGreen_21.png
tileGreen21 : Sprite
tileGreen21 = {
    x: 130,
    y: 0,
    width: 64,
    height: 64,
}

## tileGreen_22.png
tileGreen22 : Sprite
tileGreen22 = {
    x: 65,
    y: 925,
    width: 64,
    height: 64,
}

## tileGreen_23.png
tileGreen23 : Sprite
tileGreen23 = {
    x: 65,
    y: 860,
    width: 64,
    height: 64,
}

## tileGreen_24.png
tileGreen24 : Sprite
tileGreen24 = {
    x: 65,
    y: 795,
    width: 64,
    height: 64,
}

## tileGreen_25.png
tileGreen25 : Sprite
tileGreen25 = {
    x: 65,
    y: 730,
    width: 64,
    height: 64,
}

## tileGreen_26.png
tileGreen26 : Sprite
tileGreen26 = {
    x: 65,
    y: 679,
    width: 64,
    height: 50,
}

## tileGreen_27.png
tileGreen27 : Sprite
tileGreen27 = {
    x: 65,
    y: 628,
    width: 64,
    height: 50,
}

## tileYellow_01.png
tileYellow01 : Sprite
tileYellow01 = {
    x: 65,
    y: 574,
    width: 64,
    height: 53,
}

## tileYellow_02.png
tileYellow02 : Sprite
tileYellow02 = {
    x: 65,
    y: 520,
    width: 64,
    height: 53,
}

## tileYellow_03.png
tileYellow03 : Sprite
tileYellow03 = {
    x: 0,
    y: 964,
    width: 64,
    height: 53,
}

## tileYellow_04.png
tileYellow04 : Sprite
tileYellow04 = {
    x: 585,
    y: 260,
    width: 64,
    height: 64,
}

## tileYellow_05.png
tileYellow05 : Sprite
tileYellow05 = {
    x: 65,
    y: 455,
    width: 64,
    height: 64,
}

## tileYellow_06.png
tileYellow06 : Sprite
tileYellow06 = {
    x: 65,
    y: 390,
    width: 64,
    height: 64,
}

## tileYellow_07.png
tileYellow07 : Sprite
tileYellow07 = {
    x: 65,
    y: 325,
    width: 64,
    height: 64,
}

## tileYellow_08.png
tileYellow08 : Sprite
tileYellow08 = {
    x: 65,
    y: 260,
    width: 64,
    height: 64,
}

## tileYellow_09.png
tileYellow09 : Sprite
tileYellow09 = {
    x: 65,
    y: 195,
    width: 64,
    height: 64,
}

## tileYellow_10.png
tileYellow10 : Sprite
tileYellow10 = {
    x: 65,
    y: 130,
    width: 64,
    height: 64,
}

## tileYellow_11.png
tileYellow11 : Sprite
tileYellow11 = {
    x: 65,
    y: 65,
    width: 64,
    height: 64,
}

## tileYellow_12.png
tileYellow12 : Sprite
tileYellow12 = {
    x: 65,
    y: 0,
    width: 64,
    height: 64,
}

## tileYellow_13.png
tileYellow13 : Sprite
tileYellow13 = {
    x: 0,
    y: 899,
    width: 64,
    height: 64,
}

## tileYellow_14.png
tileYellow14 : Sprite
tileYellow14 = {
    x: 0,
    y: 834,
    width: 64,
    height: 64,
}

## tileYellow_15.png
tileYellow15 : Sprite
tileYellow15 = {
    x: 0,
    y: 769,
    width: 64,
    height: 64,
}

## tileYellow_16.png
tileYellow16 : Sprite
tileYellow16 = {
    x: 0,
    y: 704,
    width: 64,
    height: 64,
}

## tileYellow_17.png
tileYellow17 : Sprite
tileYellow17 = {
    x: 0,
    y: 639,
    width: 64,
    height: 64,
}

## tileYellow_18.png
tileYellow18 : Sprite
tileYellow18 = {
    x: 0,
    y: 574,
    width: 64,
    height: 64,
}

## tileYellow_19.png
tileYellow19 : Sprite
tileYellow19 = {
    x: 0,
    y: 509,
    width: 64,
    height: 64,
}

## tileYellow_20.png
tileYellow20 : Sprite
tileYellow20 = {
    x: 0,
    y: 444,
    width: 64,
    height: 64,
}

## tileYellow_21.png
tileYellow21 : Sprite
tileYellow21 = {
    x: 0,
    y: 379,
    width: 64,
    height: 64,
}

## tileYellow_22.png
tileYellow22 : Sprite
tileYellow22 = {
    x: 0,
    y: 314,
    width: 64,
    height: 64,
}

## tileYellow_23.png
tileYellow23 : Sprite
tileYellow23 = {
    x: 0,
    y: 249,
    width: 64,
    height: 64,
}

## tileYellow_24.png
tileYellow24 : Sprite
tileYellow24 = {
    x: 0,
    y: 184,
    width: 64,
    height: 64,
}

## tileYellow_25.png
tileYellow25 : Sprite
tileYellow25 = {
    x: 0,
    y: 119,
    width: 64,
    height: 64,
}

## tileYellow_26.png
tileYellow26 : Sprite
tileYellow26 = {
    x: 0,
    y: 54,
    width: 64,
    height: 64,
}

## tileYellow_27.png
tileYellow27 : Sprite
tileYellow27 = {
    x: 0,
    y: 0,
    width: 64,
    height: 53,
}

## vine.png
vine : Sprite
vine = {
    x: 990,
    y: 65,
    width: 10,
    height: 64,
}

## vine_bottom.png
vineBottom : Sprite
vineBottom = {
    x: 989,
    y: 705,
    width: 10,
    height: 38,
}

## vine_bottomAlt.png
vineBottomAlt : Sprite
vineBottomAlt = {
    x: 964,
    y: 659,
    width: 25,
    height: 45,
}

## yellowCrystal.png
yellowCrystal : Sprite
yellowCrystal = {
    x: 928,
    y: 491,
    width: 32,
    height: 30,
}

## yellowGem.png
yellowGem : Sprite
yellowGem = {
    x: 964,
    y: 751,
    width: 22,
    height: 22,
}

## yellowJewel.png
yellowJewel : Sprite
yellowJewel = {
    x: 963,
    y: 920,
    width: 24,
    height: 22,
}
