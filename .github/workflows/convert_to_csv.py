import json
import csv
data = json.load(open('website-info.json'))
with open('website-info.csv', 'w', newline='') as f: 
    print(csv.writer(f).writerow(data.values()))