provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.34.0"

  #subscription_id = ""
  #client_id       = ""
  #client_secret   = ""
  #tenant_id       = ""
}
/*
terraform {
  backend "azurerm" {
    storage_account_name = "cpcdocore191895stgact"
    container_name       = "coreservices-tfstate-blob"
    key                  = "network/coresercies/vnet/terraform.tfstate"
    access_key           = "N/We4Gbp2w8J10X3/zWp9fbnQWGeZqLA7hJHoilU4dJ+eQZS/5HnYcPcco0x0kJ6f7556Q48H1d/PIwt4B1loQ=="
  }
}

terraform {
  backend "azurerm" {
    storage_account_name = "cntfstate191897stgact"
    container_name       = "cn-tfstate-blob"
    key                  = "virtualnetwork/workervnet/terraform.tfstate"
    access_key           = "dZM+40I7ZamILGmjhrMaiGBYzj7lRQ5X7D28PkuFoNrjA2x93uiMBD3eT2Ev86BmYkhoPeHUhe7Lg5MnGqoHfg=="
  }
}


terraform {
  backend "azurerm" {
    storage_account_name = "devtfstate191896stgact"
    container_name       = "dev-tfstate-blob"
    key                  = "network/vnet/custimage/terraform.tfstate"
    access_key           = "MMJ8+/sACroMw0lhSLRARpJvXY7GK6imO7K0d0GUr5FpsyV0IU5K6R9JqWf7H/kPwwD10sJZLTDgrKysCQHxxA=="
  }
}






terraform {
  backend "azurerm" {
    storage_account_name = "prodshared191895stgact"
    container_name       = "tfstate-backend"
    key                  = "resource-group/shared/shared/terraform.tfstate"
    access_key           = "jMmvYakSL+niWnSLBnkCRmzuqMJ3buDM1HaaRQVq7ik1HWO0dP1HlZGBxge8YOZIAlIGdFUDCQsvHbnA6uwSWQ=="
  }
}
*/

terraform {
  backend "azurerm" {
    storage_account_name = "cdshared191896stgact"
    container_name       = "tfstate-backend"
    key                  = "resource-group/dicore-ingestion/terraform.tfstate"
    access_key           = "fp2BJu/yRINvWDSRa8gFIlxbG756O62IZT4Ix9Eu+ZF6h2e1GIFTvJ3ne/wnLk1nYswfzrFQekTtomwgqkDj3Q=="
  }
}