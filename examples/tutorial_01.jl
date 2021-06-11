### A Pluto.jl notebook ###
# v0.14.8

using Markdown
using InteractiveUtils

# ╔═╡ 5ef1c0ac-cad0-11eb-21d3-6f549d2bd290
include("../src/IPhreeqc.jl")

# ╔═╡ 3c34391f-b070-46d8-af42-a4ea87a50b9f
iph = IPhreeqc.CreateIPhreeqc()

# ╔═╡ 86d43ba9-c90d-458e-b4a4-ae977ecc6b77
begin
	IPhreeqc.AccumulateLine("SOLUTION 1")
	IPhreeqc.AccumulateLine("Na  0.1")
	IPhreeqc.AccumulateLine("Cl  0.1")
	IPhreeqc.AccumulateLine("pH  9.0  charge")
	IPhreeqc.AccumulateLine("END"
end
	

# ╔═╡ cd3b7a1f-dcc5-421c-9f98-490e3a4be87a
IPhreeqc.SetOutputStringOn(Int32(0), Int32(1))

# ╔═╡ 95e7f875-4670-4b07-8cfd-db7d85ab684c
IPhreeqc.RunAccumulated(Int32(0))

# ╔═╡ a83c0dc8-d7fc-47cf-998f-b9cbc95f5a7b
res = IPhreeqc.GetOutputString(Int32(0))

# ╔═╡ 428cdeaa-2f1c-4500-8263-31da07890995
print(res)

# ╔═╡ Cell order:
# ╠═5ef1c0ac-cad0-11eb-21d3-6f549d2bd290
# ╠═3c34391f-b070-46d8-af42-a4ea87a50b9f
# ╠═86d43ba9-c90d-458e-b4a4-ae977ecc6b77
# ╠═cd3b7a1f-dcc5-421c-9f98-490e3a4be87a
# ╠═95e7f875-4670-4b07-8cfd-db7d85ab684c
# ╠═a83c0dc8-d7fc-47cf-998f-b9cbc95f5a7b
# ╠═428cdeaa-2f1c-4500-8263-31da07890995
