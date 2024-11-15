module [Sides, count, sides, threePlus]

Sides := U64

sides : U64 -> Result Sides [NotEnoughSides]
sides = \n ->
    if n >= 3 then
        Ok (@Sides n)
    else
        Err NotEnoughSides

threePlus : U64 -> Sides
threePlus = \n -> @Sides (3 + n)

count : Sides -> U64
count = \@Sides n -> n
