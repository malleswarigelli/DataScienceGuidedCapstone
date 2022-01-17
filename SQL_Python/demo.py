import csv
import sys
import launch

CROP = 'soy'

with open(sys.argv[1]) as infile:
    reader = csv.reader(infile)
    next(reader)
    geids = [int(row[8]) for row in reader]

geids = geids[:10]
loc_arch = launch.LocusArchive(CROP)

loci = []
for m in loc_arch:
    if 5 == m.chromosome and 0 <= m.gen_start_pos <= 0.1 and launch.LOCUS_TYPE_SNP_LOCUS == m.locus_type:
        loci.append((m.name,m.chromosome,m.gen_start_pos))
loci.sort(key=lambda x: (x[2],x[0]))
names = [x[0] for x in loci]

sc_arch = launch.ReferenceScoreArchive(CROP)
sc_arch.set_markers(names)
print(*(['']+names),sep=',')
print(*(['geid']+[round(x[2],2) for x in loci]),sep=',')
for ge in geids:
    sc = sc_arch.get_scores(ge)
    print(*([ge]+sc),sep=',')

