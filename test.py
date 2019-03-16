import os
import csv

csvpath = os.path.join('..',"homework","PyBankHomework.csv")

Months = []
PL = []
Averages= []
StartNumber = 0 
AveChange = []
Ilist = []
prevRevenue = 0 
revchangelist =[]
monthofchange = []
greatestincrease = ["",0]
greatestdecrease = ["",9999999999999999999999]


with open(csvpath, newline="") as csvfile:
	csvreader = csv.reader(csvfile, delimiter=",")

	for row in csvreader:
		'''print(row)'''
		
		for row in csvreader:
			Months.append(row[0])
			PL.append(row[1])
			
			Total_Months = len(Months)	

			StartNumber = StartNumber + int(row[1])

			revenuechange = int(row[1]) - prevRevenue
			prevRevenue = int(row[1])

			revchangelist.append(revenuechange)
			monthofchange.append(row[0]) 

			if revenuechange > greatestincrease[1]:
				greatestincrease[0] = row[0]
				greatestincrease[1] = revenuechange

			if revenuechange < greatestdecrease[1]:
				greatestdecrease[0] = row[0]
				greatestdecrease [1] = revenuechange



AverageRevenue = sum(revchangelist) / len(revchangelist)

print("Total Months:" + str(Total_Months))
print("Total: $" + str(StartNumber))
print("Percent Change: " + str(AverageRevenue))
print("Greatest Increase in Profits: " + str(greatestincrease[0])+ " " + "($"+ str(greatestincrease[1])+")")
print("Greatest Decrease in Profits: " + str(greatestdecrease [0]) + " " + "($"+ str(greatestdecrease[1])+")")

output_path = os.path.join('..',"homework", "PyBank.txt")


file = open(output_path,'w') 
file.write("Total Months:" + str(Total_Months))
file.write("\n")
file.write("Total: $" + str(StartNumber))
file.write("\n")
file.write("Percent Change: " + str(AverageRevenue))
file.write("\n")
file.write("Greatest Increase in Profits: " + str(greatestincrease[0])+ " " + "($"+ str(greatestincrease[1])+")")
file.write("\n")
file.write("Greatest Decrease in Profits: " + str(greatestdecrease [0]) + " " + "($"+ str(greatestdecrease[1])+")")
file.close()

