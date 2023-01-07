gedcom = open('family_tree.ged', 'r', encoding="utf8")
prolog = open('family_tree.pl', 'w', encoding="utf8")
name = dict()
sex = dict()

for line in gedcom:
    if "INDI" in line:
        ID = line[4:8]
    elif "NAME" in line:
        FIO = line[7:-2]
        FIO = FIO.replace('/', '')
    elif "CHAN" in line:
        name[ID] = FIO
    elif "SEX" in line:
        sex[ID] = line[6]
    elif "WIFE" in line:
        mother = line[9:13]
    elif "HUSB" in line:
        father = line[9:13]
    elif "CHIL" in line:
        child = line[9:13]
        prolog.write("child('"+name[child]+"', '"+name[father]+"').\n")
        prolog.write("child('"+name[child]+"', '"+name[mother]+"').\n")

for key in name:
    if sex[key] == 'F':
        prolog.write("female('"+name[key]+"').\n")
    else:
        prolog.write("male('"+name[key]+"').\n")

gedcom.close()
prolog.close()
