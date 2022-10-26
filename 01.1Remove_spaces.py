import csv

with open('space_removed.csv', 'w', encoding='utf-8', newline='') as csv_da_scrivere:
    scrittore = csv.writer(csv_da_scrivere, delimiter=',')

    # Nota come questo 'with' sia dentro quello esterno
    # ATTENZIONE: l'handle *interno* l'abbiamo chiamato csv_da_leggere
    with open('with_funky_spaces.csv', encoding='utf-8', newline='') as csv_da_leggere:
        lettore = csv.reader(csv_da_leggere, delimiter=',')

        for riga in lettore:
            rigaFinale = []
            for elem in riga:
                rigaFinale.append(elem.strip())

            riga = rigaFinale
            scrittore.writerow(riga)
