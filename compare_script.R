ids = c('001','002','003','004','005','006',
        '007','008','009','010','011','012',
        '013','014','015','016','017','018',
        '019','020','021','022','023','024',
        '025','026','027','028','029','030')
# 
# ids = '028'
for (id in ids){
  print(id)
  d1 = read.csv(paste('Data/',id, '.csv', sep = ''), header = TRUE)
  d1_label = read.csv(paste('Label/', id, '.csv', sep=''), header=TRUE)$V1
  ad_label = read.csv(paste('CH1/ADICyt/Lymph/',id,'.csv',sep=''))$x
  print(length(unique(d1_label)))
  outliers <- which(d1_label == 0)
  # print('-------------------')
  # print(length(unique(ad_label)))
  # print(ClusterR::external_validation(d1_label[-outliers],ad_label[-outliers]))
  print(FMeasure(d1_label,ad_label))
  # print('-------------------')
  load(paste('Fitted/', id, '.RData', sep=''))
    # print(length(unique(res$res$clust)))
  # print(ClusterR::external_validation(d1_label[-outliers],res$res$clust[-outliers]))
  print(FMeasure(d1_label,res$res$clust))
  # print('-------------------')
  load(paste('Fitted_parallel/', id, 'maxit_20.RData', sep=''))
  # print(length(unique(res$res$clust)))
  # print(ClusterR::external_validation(d1_label[-outliers],res$res$clust[-outliers]))
  print(FMeasure(d1_label,res$res$clust))
  load(paste('Fitted_parallel_divisive/', id, 'maxit_20.RData', sep=''))
  # print(length(unique(res$res$clust)))
  # print(ClusterR::external_validation(d1_label[-outliers],res$res$clust[-outliers]))
  print(FMeasure(d1_label,res$res$clust))
  print('-------------------')
  print('-------------------')
  print('-------------------')
}