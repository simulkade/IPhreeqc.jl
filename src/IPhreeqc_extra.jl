# Helper functions for IPhreeqc c wrapper

"""
function GetSelectedOutput(id::Int, s_id::Int)
id is the IPhreeqc id returned from CreateIPhreeqc() function
s_id is the selected output number in the phreeqc input file or string
returns heading of the tabular data as an string of array
and the content of the table as Float64 matrix
"""
function GetSelectedOutput(id::Int, s_id::Int)
    SetCurrentSelectedOutputUserNumber(id, s_id)
    n_row = GetSelectedOutputRowCount(id)
    n_col = GetSelectedOutputColumnCount(id)
    val = zeros(n_row-1, n_col)
    heading = Array{String}(undef, n_col)
    n = Ref{Int32}(0)
    c = Ref(0.0)
    for i in 2:n_row
        for j in 1:n_col
            heading[1] = string(zeros(10))
            GetSelectedOutputValue2(id, i-1, j-1, n, c, heading[1], UInt32(length(heading[1])))
            val[i-1,j]=c[]
        end
    end
    for j in 1:n_col
        heading[j] = string(zeros(10))
        GetSelectedOutputValue2(id, 0, j-1, n, c, heading[j], UInt32(length(heading[j])))
        heading[j] = strip(heading[j], '\0')
    end
    return heading, val
end

"""
function GetSelectedOutput(id::Int, s_id::Int)
id is the IPhreeqc id returned from CreateIPhreeqc() function
s_id is the selected output number in the phreeqc input file or string
returns the selected output as a dictionary
"""
function GetSelectedOutputDict(id::Int, s_id::Int)
    h, v = GetSelectedOutput(id, s_id)
    return Dict(h[i] => v[:,i] for i in 1:length(h))
end