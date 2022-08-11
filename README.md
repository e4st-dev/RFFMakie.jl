RFFMakie.jl
===========
Theming and color guidance for Resources for the Future comes from [here](https://media.rff.org/documents/RFFDigitalBrand-Guidelines.pdf).  This package exports `theme_rff` to be used with Makie using the `set_theme!` function.

# Installation
```julia
]dev "git@github.com:Ethan-Russell/RFFMakie.jl.git"
```

# Usage
```julia
using RFFMakie
using CairoMakie
set_theme!(theme_rff()) 
example_plot()
```