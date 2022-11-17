# This file contains the python script that allow the removal of any sparse withe space in the dataset
# It MUST be run with `python3 path/to/02_Remove_spaces.py` command

import csv

with open('results/db/db_02_cleanedCsv.csv', 'w', encoding='utf-8', newline='') as csv_da_scrivere:
    scrittore = csv.writer(csv_da_scrivere, delimiter=',')

    # Nota come questo 'with' sia dentro quello esterno
    # ATTENZIONE: l'handle *interno* l'abbiamo chiamato csv_da_leggere
    with open('results/db/db_01_whitespaceCsv.csv', encoding='utf-8', newline='') as csv_da_leggere:
        lettore = csv.reader(csv_da_leggere, delimiter=',')

        for riga in lettore:
            rigaFinale = []
            for elem in riga:
                rigaFinale.append(elem.strip())

            riga = rigaFinale
            scrittore.writerow(riga)
