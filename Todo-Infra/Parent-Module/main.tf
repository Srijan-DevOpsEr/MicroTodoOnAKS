module "acr" {
    source = "../Child-Module/ACR"
    acr=var.acr
  }

  module "aks" {
    source = "../Child-Module/AKS- cluster"
    aks= var.aks
      depends_on = [ module.acr ]
  }

  module "sql-database" {
    source = "../Child-Module/SQL-Database"
    servers_dbs = var.servers_dbs
    depends_on = [ module.acr ]
  
    
  }
