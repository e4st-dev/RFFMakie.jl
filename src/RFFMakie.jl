"""
Exports `theme_rff` to be used with Makie using the `set_theme!` function.

Theming and color guidance comes from `https://media.rff.org/documents/RFFDigitalBrand-Guidelines.pdf`
"""
module RFFMakie

using Makie
using Colors
using Random

export theme_rff, rff_colors, example_plot
function rff_colors()
    [
        colorant"#88C4F4",
        colorant"#FF6663",
        colorant"#50B161",
        colorant"#74645E",
        colorant"#755EA6",
        colorant"#EAD367",
        colorant"#F4A25F",
        colorant"#687D8A",
        colorant"#B8DCF8",
        colorant"#FFA3A1",
        colorant"#96D0A0",
        colorant"#ACA29F",
        colorant"#AC9ECA",
        colorant"#F2E5A4",
        colorant"#F8C79F",
        colorant"#04273C",
    ]
end
rff_colors(args...) = rff_colors()[args...]
rff_black() = colorant"#04273C"; export rff_black
rff_blue() = colorant"#88c4f4"; export rff_blue
rff_coral() = colorant"#ff6663"; export rff_coral
rff_green() = colorant"#50b161"; export rff_green
rff_brown() = colorant"#74645e"; export rff_brown
rff_purple() = colorant"#765ea5"; export rff_purple
rff_orange() = colorant"#f4a25f"; export rff_orange
rff_yellow() = colorant"#ebd367"; export rff_yellow
rff_black50() = colorant"#82939e"; export rff_black50
rff_blue50() = colorant"#c3e2fa"; export rff_blue50
rff_purple50() = colorant"#baaed2"; export rff_purple50

function theme_rff()
    Theme(
        font="Calibre",
        textcolor = colorant"#04273C",
        linecolor = colorant"#04273C",
        palette=(
            color=rff_colors(),
        ),
        Axis = (
            backgroundcolor = :transparent,
            xgridvisible = false,
            ygridvisible = true,
            xgridcolor = colorant"#E1F0FC",
            ygridcolor = colorant"#E1F0FC",
            xminorgridvisible = false,
            yminorgridvisible = false,
            leftspinevisible = true,
            rightspinevisible = false,
            bottomspinevisible = true,
            topspinevisible = false,
            leftspinecolor = colorant"#04273C",
            rightspinecolor = colorant"#04273C",
            bottomspinecolor = colorant"#04273C",
            topspinecolor = colorant"#04273C",
            xminorticksvisible = false,
            yminorticksvisible = false,
            xticksvisible = true,
            yticksvisible = true,
            xtickscolor = colorant"#04273C",
            ytickscolor = colorant"#04273C",
            xlabelpadding = 3,
            ylabelpadding = 3
        ),
        Legend = (
            framevisible = false,
            framecolor = colorant"#04273C",
            padding = (0,0,0,0),
        ),
        Axis3 = (
            xgridvisible = false,
            ygridvisible = false,
            zgridvisible = false,
            xspinesvisible = true,
            yspinesvisible = true,
            zspinesvisible = true,
            yzpanelvisible = false,
            xzpanelvisible = false,
            xypanelvisible = false,
            xticksvisible = false,
            yticksvisible = false,
            zticksvisible = false,
            xticklabelpad = 3,
            yticklabelpad = 3,
            zticklabelpad = 6,
            xspinecolor_2 = :transparent,
            xspinecolor_3 = :transparent,
            yspinecolor_2 = :transparent,
            yspinecolor_3 = :transparent,
            zspinecolor_2 = :transparent,
            zspinecolor_3 = :transparent,
        ),
        Colorbar = (
            ticksvisible = false,
            spinewidth = 0,
            ticklabelpad = 5,
        )
    )
end

function example_plot()
    Random.seed!(1)
    f = Figure()
    for i in 1:2, j in 1:2
        Axis(f[i,j], title="My Title ($i, $j)")
        lines!(f[i, j], 1:50, cumsum(randn(50)), label="My thing 1")
        lines!(f[i, j], 1:50, cumsum(randn(50)), label="My thing 2")
        lines!(f[i, j], 1:50, cumsum(randn(50)), label="My thing 3")
        lines!(f[i, j], 1:50, cumsum(randn(50)), label="My thing 4")
        scatter!(f[i,j], 1:5:50, zeros(length(1:5:50)), label="My other 1")
        scatter!(f[i,j], 1:5:50, 3*ones(length(1:5:50)), label="My other 2")
        axislegend(position=:lb)
    end
    f
end

end # module
