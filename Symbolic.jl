module Symbolic
import Base: +, -, *, /, ^, sin, cos, exp, log, sqrt
export ∘

+(x::Union{Symbol, Expr}) = x
+(a::Union{Symbol, Expr, Number}, b::Union{Symbol, Expr, Number}) = :($a + $b)
-(x::Union{Symbol, Expr}) = :(-$x)
-(a::Union{Symbol, Expr, Number}, b::Union{Symbol, Expr, Number}) = a + -b

*(a::Union{Symbol, Expr, Number}, b::Union{Symbol, Expr, Number}) = :($a * $b)
/(n::Union{Symbol, Expr, Number}, d::Union{Symbol, Expr, Number}) = :($n / $d)

^(x::Number, p::Union{Symbol, Expr}) = :($x ^ $p)
^(x::Union{Symbol, Expr}, p::AbstractFloat) = :($x ^ $p)
^(x::Union{Symbol, Expr}, p::Union{Symbol, Expr}) = :($x ^ $p)

sin(x::Union{Symbol, Expr, Number}) = :(sin($x))
cos(x::Union{Symbol, Expr, Number}) = :(cos($x))
exp(x::Union{Symbol, Expr, Number}) = :(exp($x))
log(x::Union{Symbol, Expr, Number}) = :(log($x))
sqrt(x::Union{Symbol, Expr, Number}) = :(sqrt($x))

∘(f::Function, g::Function) = x -> f(g(x))

end
