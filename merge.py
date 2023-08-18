import glob
import json
import os
import codecs

if os.path.exists('full.json'):
    os.remove('full.json')

files = glob.glob("provinces/*.json")

full = []

for (file) in files:
    f = open(file)
    lines = f.readlines()
    dictt = json.loads("".join(lines))
    full.extend(dictt)
    f.close()


out = codecs.open('full.json', 'w', 'utf-8')
out.writelines(u"" + json.dumps(full, indent=2))
out.close()
