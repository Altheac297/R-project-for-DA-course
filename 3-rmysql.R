install.packages("RMySQL", repos = "https://mirrors.ustc.edu.cn/CRAN/")
library(RMySQL)
con <- dbConnect(MySQL(), user='root', # MySQL数据库用户名
                          password='chenyuquan297', # 对应用户的登录密码
                          dbname='r-test', # 需要连接的数据库名
                          host='localhost', # 访问的数据库所在的IP
                          port=3306) # 访问的数据库所关联的端口号，一般为3306
summary(con)
dbListTables(con)
paper <- dbReadTable(con,"paper")
knitr::kable(head(paper))

dbCreateTable(con,"paper_viruse",paper) 
paper_viruse = dbGetQuery(con, 
                     "select * from paper 
                     where st_title like '%viruse%' or st_abstract like '%viruse%'") # 在双引号内写SQL查询式
print(dim(paper_viruse)) #127行检索结果
knitr::kable(head(paper_viruse)) #打印前6行


dbDisconnect(con)