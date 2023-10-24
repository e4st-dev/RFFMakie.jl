"""
Exports `theme_rff` to be used with Makie using the `set_theme!` function.

Theming and color guidance comes from `https://media.rff.org/documents/RFFDigitalBrand-Guidelines.pdf`
"""
module RFFMakie
using Reexport

@reexport using Makie
@reexport using Colors
@reexport using CairoMakie
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


"""
    in2px(in) -> px

    in2px(in...) -> (px...,)

    in2px(v_in) -> v_px

Converts inches to pixels, so that, when a figure is sized to the provided inches (i.e. in word or powerpoint), the fonts will be the stated font sizes.  To be used with `Makie.Figure`, i.e. `f = Figure(resolution=in2px(6.5,4.5))`
"""
function in2px(args...)
    return in2px(args)
end
function in2px(x)
    return x .* 72
end
export in2px

function theme_rff()
    Theme(
        fonts = Attributes(
            regular = "Calibre",
            bold = "Calibre Semibold",
            italic = "Calibre Italic",
            bold_italic = "Calibre Bold Italic",
        ),
        resolution = in2px(6.5, 4.5),
        textsize=15,
        fontsize = 15,
        textcolor = colorant"#04273C",
        linecolor = colorant"#04273C",
        palette=(
            color=rff_colors(),
        ),
        BarPlot=(
            label_size = 15,
        ),
        Label=(
            fontsize=15,
            label_size=15,
        ),
        Axis = (
            backgroundcolor = :transparent,
            xgridvisible = false,
            ygridvisible = true,
            xgridcolor = colorant"#E1F0FC",
            ygridcolor = colorant"#E1F0FC",
            xminorgridvisible = false,
            yminorgridvisible = false,
            leftspinevisible = false,
            rightspinevisible = false,
            bottomspinevisible = true,
            topspinevisible = false,
            leftspinecolor = colorant"#04273C",
            rightspinecolor = colorant"#04273C",
            bottomspinecolor = colorant"#04273C",
            topspinecolor = colorant"#04273C",
            xminorticksvisible = false,
            yminorticksvisible = false,
            xticksvisible = false,
            yticksvisible = false,
            xtickscolor = colorant"#04273C",
            ytickscolor = colorant"#04273C",
            xlabelpadding = 3,
            ylabelpadding = 3,

            # Font Sizes
            titlesize = 21,
            subtitlesize=19,
            xticklabelsize=15,
            yticklabelsize=15,
            xlabelsize=15,
            ylabelsize=15,

            # Fonts
            xlabelfont=:bold,
            ylabelfont=:bold,

        ),
        Legend = (
            framevisible = false,
            framecolor = colorant"#04273C",
            padding = (0,0,0,0),
            titlesize = 15,
            labelsize = 15,

        ),
        CairoMakie = Attributes(
            px_per_unit = 5.0,
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
    set_theme!(theme_rff())
    Random.seed!(1)
    f = Figure()
    ax = f[1,1] = Axis(f, title="My Title")
    lines!(ax, 1:50, cumsum(randn(50)), label="My thing 1")
    lines!(ax, 1:50, cumsum(randn(50)), label="My thing 2")
    lines!(ax, 1:50, cumsum(randn(50)), label="My thing 3")
    lines!(ax, 1:50, cumsum(randn(50)), label="My thing 4")
    scatter!(ax, 1:5:50, zeros(length(1:5:50)), label="My other 1")
    scatter!(ax, 1:5:50, 3*ones(length(1:5:50)), label="My other 2")
    f[1,2] = Legend(f, ax, "Legend")
    f
end
export example_plot

end # module
