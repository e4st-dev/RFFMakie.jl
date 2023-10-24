using Test, RFFMakie

@testset "Testing RFFMakie" begin

    f = example_plot()

    for file_name in ["example.png", "example.svg", "example.pdf"]
        save(file_name, f)
        @test isfile(file_name)
        rm(file_name)
    end
end