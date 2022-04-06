if Sys.iswindows()
    url = "https://github.com/simulkade/PhreeqcRM/releases/download/3.7.1/IPhreeqc.dll"
    lib_path = joinpath(@__DIR__, "..", "lib", "libiphreeqc.dll")
    if isfile(lib_path)
        println("libiphreeqc.dll exists. Skiping download ...")
    else
        try
            println("Downloading the library files ...")
            download(url, joinpath(@__DIR__, "..", "lib", "libiphreeqc.dll"))
            println("PhreeqcRM.dll downloaded successfully.")
        catch
            @warn "Could not downlaod the library file PhreeqcRM.dll"
            @warn "Download it from: $url"
            @warn "and copy it into the IPhreeqc/lib folder"
        end
    end
elseif Sys.islinux()
    lib_path = joinpath(@__DIR__, "..", "lib", "libphreeqcrm.so")
    url = "https://github.com/simulkade/PhreeqcRM/releases/download/3.7.1/libiphreeqc-3.7.1.so"
    if isfile(lib_path)
        println("PhreeqcRM.dll exists. Skiping download ...")
    else
        try
            println("Downloading the library files ...")
            download(url, joinpath(@__DIR__, "..", "lib", "libiphreeqc.so"))
            println("libphreeqcrm.so downloaded successfully.")
        catch
            @warn "Could not downlaod the library file libiphreeqc.so"
            @warn "Download it from: $url"
            @warn "and copy it into the IPhreeqc/lib folder"
        end
    end
else
    @error "No binary files for your OS. Only Windows and Linux at the moment!"
end
