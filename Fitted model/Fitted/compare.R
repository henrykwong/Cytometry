score1 = c()
score2 = c()
score3 = c()
score4 = c()

score1a = c()
score2a = c()
score3a = c()
score4a = c()



ids = c('001','002','003','004','005','006','007','008','009','010','011','012','013','014','015','016','017','018','019','020','021','022','023','024','025','026','027','028','029','030')
true_label = list()
ad_label = list()

for (id in ids){
  true_label[[id]] = read.csv(paste('Label/',id,'.csv',sep=''))$V1
  ad_label[[id]] = read.csv(paste('CH1/ADICyt/Lymph/',id,'.csv',sep=''),header = TRUE)[[1]]
}

for (id in ids){
  outliers = which(true_label[[id]]==0)
  score1 = c(score1,FMeasure(true_label[[id]],ad_label[[id]]))
  score2 = c(score2,FMeasure(true_label[[id]][-outliers],ad_label[[id]][-outliers]))
  score3 = c(score3,mclust::adjustedRandIndex(true_label[[id]],ad_label[[id]]))
  score4 = c(score4,mclust::adjustedRandIndex(true_label[[id]][-outliers],ad_label[[id]][-outliers]))
}

for (id in ids){
  load(paste('Fitted/',id,'.RData',sep=''))
  ad_label = res$res$clust
  outliers = which(true_label[[id]]==0)
  score1a = c(score1a,FMeasure(true_label[[id]],ad_label))
  score2a = c(score2a,FMeasure(true_label[[id]][-outliers],ad_label[-outliers]))
  score3a = c(score3a,mclust::adjustedRandIndex(true_label[[id]],ad_label))
  score4a = c(score4a,mclust::adjustedRandIndex(true_label[[id]][-outliers],ad_label[-outliers]))
  
}







# id = '004'
# d1_label = read.csv(paste('label/', id, '.csv', sep=''))$V1
# names = c('ADICyt', 
#          'bretschneiderRoth',
#          'Duke',
#          'Duke-original',
#          'FEK',
#          'FLOCK',
#          'flowMeans',
#          'flowMerge',
#          'KuiWang',
#          'MistyMountain1',
#          'MistyMountain2',
#          'SamSPECTRAL',
#          'SWIFT')
# 
# for (name in names){
#   cat('\n',name)
#   label_guess = read.csv(paste('CH1/',name, '/', 'Lymph/', id, '.csv',sep=''), header = TRUE)
#   label_guess = as.matrix(label_guess)
#   if (nrow(label_guess) != length(d1_label)){
#     label_guess = read.csv(paste('CH1/',name, '/', 'Lymph/', id, '.csv',sep=''), header = FALSE)
#     label_guess = as.matrix(label_guess)
#   } 
#   
#   if (ncol(label_guess) == 1) label_guess = label_guess[,1]
#   else label_guess = apply(label_guess, 1, which.max)
#   print(name)
#   print(mclust::adjustedRandIndex(label_guess, d1_label))
# }
