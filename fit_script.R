ids = c('001','002','003','004','005','006','007','008','009','010','011','012','013','014','015','016','017','018','019','020','021','022','023','024','025','026','027','028','029','030')
ids=ids[30]
for (id in (ids)){

  cat('\n', 'dataset : ', id)
  d1 = read.csv(paste('Data/',id, '.csv', sep = ''), header = TRUE)
  d1_label = read.csv(paste('Label/', id, '.csv', sep=''), header=TRUE)$V1
  x = as.matrix(d1)[,3:5]
  x = t((t(x)-colMeans(x)) / sqrt(diag(cov(x))))
  
  set.seed(30)
  res2 = cluster.fmmstil.parallel(x, 8)
}


print(external_validation(d1,res2$res$clust))

