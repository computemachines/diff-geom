module Geometric
import Base: getindex, +, -
export Up, Down

Up(x, y) = Up2((x, y))
Up(x, y, z) = Up3((x, y, z))

immutable Up2{A, B}
    elems :: Tuple{A, B}
end
getindex(up::Up2, key) = up.elems[key]


immutable Up3{A, B, C}
    elems :: Tuple{A, B, C}
end
getindex(up::Up3, key) = up.elems[key]


Down(x, y) = Down2((x, y))
Down(x, y, z) = Down3((x, y, z))

immutable Down2{A, B}
    elems :: Tuple{A, B}
end
getindex(down::Down2, key) = down.elems[key]


immutable Down3{A, B, C}
    elems :: Tuple{A, B, C}
end
getindex(down::Down3, key) = down.elems[key]

+(a::Up2, b::Up2) = Up(a[1]+b[1], a[2]+b[2])
+(a::Up3, b::Up3) = Up(a[1]+b[1], a[2]+b[2], a[3]+b[3])
-(a::Up2, b::Up2) = Up(a[1]-b[1], a[2]-b[2])
-(a::Up3, b::Up3) = Up(a[1]-b[1], a[2]-b[2], a[3]-b[3])

+(a::Down2, b::Down2) = Down(a[1]+b[1], a[2]+b[2])
+(a::Down3, b::Down3) = Down(a[1]+b[1], a[2]+b[2], a[3]+b[3])
-(a::Down2, b::Down2) = Down(a[1]-b[1], a[2]-b[2])
-(a::Down3, b::Down3) = Down(a[1]-b[1], a[2]-b[2], a[3]-b[3])

end
