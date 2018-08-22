# Import IPhreeqc before running this function
pqc_input = """
SOLUTION 0
  pH   7   charge
  Na   0.2
SOLUTION 1-10
  pH   7   charge
  Na   0.1
SELECTED_OUTPUT
  -reset false
  -totals Na
END
"""
id = IPhreeqc.CreateIPhreeqc()
res = IPhreeqc.LoadDatabase(id, "phreeqc.dat")
println("load the database $res")
# IPhreeqc.RunFile(id, "ex2")
res = IPhreeqc.RunString(id, pqc_input)
println("Runnin the string $res")
n_comp = IPhreeqc.GetComponentCount(id)
println(" number of components $n_comp")
IPhreeqc.DestroyIPhreeqc(id)
