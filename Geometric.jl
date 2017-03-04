module Geometric

export Up, Down

Up(x, y) = Up2(x, y)
Up(x, y, z) = Up3(x, y, z)
Up(x, y, z, t) = Up4(x, y, z, t)

immutable Up2{A, B}
    x :: A
    y :: B
end

immutable Up3{A, B, C}
    x :: A
    y :: B
    z :: C
end

immutable Up4{A, B, C, D}
    x :: A
    y :: B
    z :: C
    t :: D
end

immutable Down2{A, B}
    x :: A
    y :: B
end

Down(x, y) = Down2(x, y)
Down(x, y, z) = Down3(x, y, z)
Down(x, y, z, t) = Down4(x, y, z, t)

immutable Down3{A, B, C}
    x :: A
    y :: B
    z :: C
end

immutable Down4{A, B, C, D}
    x :: A
    y :: B
    z :: C
    t :: D
end



end
