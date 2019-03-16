import os
import csv

csvpypoll = os.path.join('..',"homework","election_data.csv")

totalvotes = []
candidates = []
Khan = []
Correy = []
Li = []
OTooley = []
candidateslist =["Khan", "Correy", "Li", "O'Tooley"]
electionwinner = []


with open(csvpypoll, newline="") as csvfile: 
	csvreader = csv.reader(csvfile, delimiter=",")

	for rows in csvreader:
		'''print(rows)'''
		for rows in csvreader:

			totalvotes.append(rows[0])

			if rows[2] == "Khan": 
				Khan.append(rows[2])


			elif rows[2] == "Correy":
				Correy.append(rows[2])

			elif rows[2] == "Li":
				Li.append(rows[2])

			elif rows [2] == "O'Tooley":
				OTooley.append(rows[2])

			PercentKhan = (len(Khan)/len(totalvotes))*100
			PercentCorrey = (len(Correy)/len(totalvotes))*100
			PercentLi = (len(Li)/len(totalvotes))*100
			PercentOTooley = (len(OTooley)/len(totalvotes))*100

# 	for x in range(len(totalvotes)):

# 		if electionwinner < candidateslist[x]:
# 			electionwinner = candidateslist[x]
# electionwinner = totalvotes.index(electionwinner)

print("Khan: " + str(round(PercentKhan,4)) + "% (" + str(len(Khan)) + ")")
print("Correy: " + str(round(PercentCorrey,4)) + "% (" +  str(len(Correy)) + ")")
print("Li: " + str(round(PercentLi,4)) + "% (" + str(len(Li)) + ")") 
print("O'Tooley: " + str(round(PercentOTooley,4)) + "% (" + str(len(OTooley)) + ")")
print("Total votes: " + str(len(totalvotes))) 
# print(electionwinner)

output_path = os.path.join("..","homework", "polltest.txt")

file = open(output_path,"w")
file.write("Khan: " + str(round(PercentKhan,4)) + "% (" + str(len(Khan)) + ")")
file.write("\n")
file.write("Correy: " + str(round(PercentCorrey,4)) + "% (" +  str(len(Correy)) + ")")
file.write("\n")
file.write("Li: " + str(round(PercentLi,4)) + "% (" + str(len(Li)) + ")")
file.write("\n")
file.write("O'Tooley: " + str(round(PercentOTooley,4)) + "% (" + str(len(OTooley)) + ")")
file.write("\n")
file.write("Total votes: " + str(len(totalvotes)))