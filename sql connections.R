
# create connection functions for all of the db

# still have some work to do

db.con <- function(sql, db.name = "census", password) {
  
  if (sql %in% c('pg','postgres')) {
      
      library(RPostgreSQL)
      print("well?")
      con = dbConnect(drv= "PostgreSQL", dbname = db.name,
                   host = "localhost", port = 5432,
                   user = "postgres", password = "Radish82")
    
  } else if (sql %in% c('mssql','sql server')) {
    
      library(RODBC)  # This all needs updated
    
      driver.name ="SQL Server Native Client 11.0"
      server.name = "UWCO-BGILLISLT\\TESTING2014"
      port ="51437"
      user.name = "sa"
    
      con.text = paste("DRIVER=",driver.name,
                      ";Database=",db.name,
                      ";Server=",server.name,
                      ";Port=",port,
                      #";PROTOCOL=TCPIP",
                      ";UID=", user.name,
                      ";PWD=",password,
                      other, sep="")
    
      con = odbcDriverConnect(con.text)
    
    } else if (sql %in% c('myssql','my')) {
        print("You need to set this up")
        con = "Whoops, not set up yet"
      
    } else {print('Incorrect SQL type')
        con = "Whoops, not set up yet"
        print('ERROR')
    }
    return(con)
  }
  
  
  
