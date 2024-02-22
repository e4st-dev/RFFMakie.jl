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

"""
    rff_color(s::Symbol, v=1)

Returns the RFF color associated with `s`, where `s` can be `black`, `blue`, `coral`, `green`, `brown`, `purple`, `orange`, or `yellow`.
"""
rff_color(s::Symbol) = rff_color(Val(s))
rff_color(s::Symbol, v) = rff_color(Val(s), v)
rff_color(s::Val, v) = weighted_color_mean(v, colorant"#ffffff", rff_color(s))
export rff_color

rff_color(::Val{:black}) = colorant"#04273C"
rff_color(::Val{:blue}) = colorant"#88c4f4"
rff_color(::Val{:coral}) = colorant"#ff6663"
rff_color(::Val{:green}) = colorant"#50b161"
rff_color(::Val{:brown}) = colorant"#74645e"
rff_color(::Val{:purple}) = colorant"#765ea5"
rff_color(::Val{:orange}) = colorant"#f4a25f"
rff_color(::Val{:yellow}) = colorant"#ebd367"

rff_black() = rff_color(:black); export rff_black
rff_blue() = rff_color(:blue); export rff_blue
rff_coral() = rff_color(:coral); export rff_coral
rff_green() = rff_color(:green); export rff_green
rff_brown() = rff_color(:brown); export rff_brown
rff_purple() = rff_color(:purple); export rff_purple
rff_orange() = rff_color(:orange); export rff_orange
rff_yellow() = rff_color(:yellow); export rff_yellow
rff_black50() = rff_color(:black, 0.5); export rff_black50
rff_blue50() = rff_color(:blue, 0.5); export rff_blue50
rff_purple50() = rff_color(:purple, 0.5); export rff_purple50


"""
    in2px(in) -> px

    in2px(in...) -> (px...,)

    in2px(v_in) -> v_px

Converts inches to pixels, so that, when a figure is sized to the provided inches (i.e. in word or powerpoint), the fonts will be the stated font sizes.  To be used with `Makie.Figure`, i.e. `f = Figure(size=in2px(6.5,4.5))`
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
        size = in2px(6.5, 4.5),
        textsize=15,
        fontsize = 15,
        textcolor = rff_black(),
        linecolor = rff_black(),
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
            leftspinecolor = rff_black(),
            rightspinecolor = rff_black(),
            bottomspinecolor = rff_black(),
            topspinecolor = rff_black(),
            xminorticksvisible = false,
            yminorticksvisible = false,
            xticksvisible = false,
            yticksvisible = false,
            xtickscolor = rff_black(),
            ytickscolor = rff_black(),
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
            framecolor = rff_black(),
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

"""
    example_plot() -> fig::Figure
"""
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

"""
    example_colors() -> fig::Figure

Plots all the colors in [`rff_colors()`](@ref) color palettte.
"""
function example_colors()
    f = Figure()
    colors = rff_colors()
    labels = map(i->"(#$(hex(colors[i]))) $i", 1:length(colors))
    elements = [PolyElement(polycolor=c) for c in colors]
    Legend(f[1,1], elements, labels, "RFF Color Palette", orientation=:horizontal, labelfont="Consolas", nbanks=Int(ceil(length(colors)/2)), framevisible=false)
    colsize!(f.layout, 1, Aspect(1, 1.3))
    resize_to_layout!(f)
    f
end
export example_colors

end # module
