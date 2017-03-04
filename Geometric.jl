module Geometric
import Base: getindex, +, -, *
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

typealias Scalar Union{Number, Symbol, Expr}
typealias Vector2 Union{Up2, Down2}
typealias Vector3 Union{Up3, Down3}

# * assumes contraction. ∘ represents tensor product
*(c::Scalar, v::Up2) = Up(c*v[1], c*v[2])
*(v::Up2, c::Scalar) = c*v
*(c::Scalar, v::Up3) = Up(c*v[1], c*v[2], c*v[3])
*(v::Up3, c::Scalar) = c*v
*(c::Scalar, v::Down2) = Down(c*v[1], c*v[2])
*(v::Down2, c::Scalar) = c*v
*(c::Scalar, v::Down3) = Down(c*v[1], c*v[2], c*v[3])
*(v::Down3, c::Scalar) = c*v

*(up::Up2, down::Down2) = up[1]*down[1] + up[2]*down[2]
*(down::Down2, up::Up2) = up*down
*(up::Up3, down::Down3) = up[1]*down[1] + up[2]*down[2]
*(down::Down3, up::Up3) = up*down



end
