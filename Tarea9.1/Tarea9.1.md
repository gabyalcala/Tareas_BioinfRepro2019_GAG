# Tarea 9.1 Optimización de Parámetros en Stacks

##Introducción
El programa *Stacks* está diseñado para funcionar con datos provenientes de librerías preparadas con enzimas de restricción y ensamblar secuencias de lecturas cortas de múltples muestras. Los ensamblados pueden ser *de novo* o con un genoma de referencia. 
En *Stacks* los parámetros más sensibles son los que controlan el nivel de disimilitud de las secuencas dentro de un locus. Estos parámetros determinan cómo se definen los loci y qué lecturas forman parte de ellos. Este programa se ejecuta mediante módulos. En el módulo **ustacks** se ensamblan los loci de cada muestra de forma independiente y los parámetros que se pueden variar son *m* que controla el número de lecturas idénticas requeridas para formar un alelo y *M* que controla el número de desajustes permitidos entre los dos alelos de una muestra. El siguiente módulo es **cstacks** que fusiona los loci de todas las muestras en un grupo en común (catálogo), el parámetro que se puede variar es *n* que controla el número de desajustes permitidos entre cualquiera de los dos alelos de la población. 


##Discusión
Los parámetros para correr *Stacks* deben optimizarse para culquier set de datos, ya que los valores óptimos dependen de la diversidad genética presente y de la calidad de los datos de secuenciación. Teniendo un set de datos que no tiene replicas, el mejor enfoque para optimizar los parámetros es *r80* propuesto por Paris *et al* (2017). El enfoque *r80* de optimización de parámetros consiste en hacer el análisis *de novo* con diferentes valores de parámetros y monitorear el número de loci RAD polimórficos encontrados en el 80 % de las muestras o más, hasta que se establezca un conjunto estable de valores para *m*, *M* y *n*.

####Ejemplos de scrips
El siguiente ejemplo muestra los scripts tomados de la documentación de *Stacks* para variar los diferentes parámetros.

```
#!/bin/bash
#Leer las muestras
echo -n "\
cs_1335.01	cs
cs_1335.13	cs
cs_1335.15	cs
pcr_1193.10	pcr
pcr_1193.11	pcr
pcr_1211.04	pcr
sj_1483.06	sj
sj_1484.07	sj
sj_1819.36	sj
wc_1218.04	wc
wc_1221.01	wc
wc_1222.02	wc
" > $top/info/popmap.test_samples.tsv

# Definir la variable
M_values="1 2 3 4 5 6 7 8 9"

# Cambiar de directorio y crear subdirectorios para cada corrida
cd $top/tests.denovo
for M in $M_values ;do
	mkdir stacks.M$M
done

# Correr *denovo_map* que incluye los módulos **ustacks** **cstacks** **sstacks** y aquí se varian los parámetros *m*, *M* y *n*
popmap=../info/popmap.test_samples.tsv
for M in $M_values ;do
	n=$M
	m=3
	echo "Running Stacks for M=$M, n=$n..."
	reads_dir=../cleaned
	out_dir=stacks.M$M
	log_file=$out_dir/denovo_map.oe
	denovo_map.pl --samples $reads_dir -O $popmap -o $out_dir -b 1 -S -M $M -n $n -m $m &> $log_file
done

# Correr el módulo **populations** con -r = 0.80
for M in $M_values ;do
	stacks_dir=stacks.M$M
	out_dir=$stacks_dir/populations.r80
	mkdir $out_dir
	log_file=$out_dir/populations.oe
	populations -P $stacks_dir -O $out_dir -r 0.80 &> $log_file
done```






