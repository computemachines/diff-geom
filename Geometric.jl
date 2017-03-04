module Geometric
import Base: getindex, +, -, *, ×, show
export Up, Down, compatible

Up(x, y) = Up2((x, y))
Up(x, y, z) = Up3((x, y, z))

immutable Up2{A, B}
    elems :: Tuple{A, B}
end
getindex(up::Up2, key) = up.elems[key]
show(io::IO, v::Up2) = print(io, "Up$(v.elems)")

immutable Up3{A, B, C}
    elems :: Tuple{A, B, C}
end
getindex(up::Up3, key) = up.elems[key]
show(io::IO, v::Up3) = print(io, "Up$(v.elems)")

Down(x, y) = Down2((x, y))
Down(x, y, z) = Down3((x, y, z))

immutable Down2{A, B}
    elems :: Tuple{A, B}
end
getindex(down::Down2, key) = down.elems[key]
show(io::IO, v::Down2) = print(io, "Down$(v.elems)")

immutable Down3{A, B, C}
    elems :: Tuple{A, B, C}
end
getindex(down::Down3, key) = down.elems[key]
show(io::IO, v::Down3) = print(io, "Down$(v.elems)")

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

# * assumes contraction. ∘ represents something like the tensor product
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

compatible(a::Vector, b::Vector) = false
compatible(a::Up2, b::Down2) = compatible(a[1], b[1]) && compatible(a[2], b[2])
compatible(b::Down2, a::Up2) = compatible(a, b)
compatible(a::Up3, b::Down3) = compatible(a[1], b[1]) && compatible(a[2], b[2]) && compatible(a[3], b[3])
compatible(b::Down3, a::Up3) = compatible(a, b)
compatible(c::Scalar, v::Union{Vector2, Vector3}) = true
compatible(v::Union{Vector2, Vector3}, c::Scalar) = true

×(a::Vector2, up::Up2) = Up(
    compatible(a, up[1]) ? a*up[1] : a × up[1],
    compatible(a, up[2]) ? a*up[2] : a × up[2]
)

×(a::Vector3, up::Up3) = Up(
    compatible(a, up[1]) ? a*up[1] : a × up[1],
    compatible(a, up[2]) ? a*up[2] : a × up[2],
    compatible(a, up[3]) ? a*up[3] : a × up[3]
)

×(a::Vector2, down::Down2) = Down(
    compatible(a, down[1]) ? a*down[1] : a × down[1],
    compatible(a, down[2]) ? a*down[2] : a × down[2]
)

×(a::Vector3, down::Down3) = Down(
    compatible(a, down[1]) ? a*down[1] : a × down[1],
    compatible(a, down[2]) ? a*down[2] : a × down[2],
    compatible(a, down[3]) ? a*down[3] : a × down[3]
)

end
