# extract_genes_ABRicate
dejieji



  -h, --help            show this help message and exit
  -a ABRICATE FILE, --abricatefile ABRICATE FILE
                        ABRicate file to parse genes
  -g GENOMES DIR, --genomedir GENOMES DIR
                        directory containing genomes
  -o OUTPUT DIR, --output OUTPUT DIR
                        directory for output
  -s SUFFIX, --suffix SUFFIX
                        Genome assembly file suffix (default: .fasta)
```

**IMPORTANT ASSUMPTIONS**

The script assumes the genome assemblies are named almost exactly as they are provided in the ABRicate output (`#FILE` column). The only thing that may differ is the suffix (default `.fasta`, unless otherwise provided using `--suffix`). The script is also at this time only able to handle a single suffix for genome assemblies at a time. 

If you have identified genes for all genomes in your `genomes/` directory (in which all genome assembly files end with `.fasta`) and your ABRicate output is present in `ABRicate_out/strainA.tsv`, run:

```
python extract_genes_ABRicate.py --abricatefile ABRicate_out/strainA.tsv --genomedir genomes/ --output extracted_genes/
```

## Extended usage

ABRicate files can also be combined to speed up things. To combine all files in ABRicate_out/, e.g. run:

```
cat <(head -n 1 ABRicate_out/strainA.tsv) <(for i in ABRicate_out/*.tsv; do tail -n +2 $i; done) > ABRicate_all.tsv
```

After which the extract_genes_ABRicate.py script has to be run only once:

```
python extract_genes_ABRicate.py --abricatefile ABRicate_all.tsv --genomedir genomes/ --output extracted_genes/
```
