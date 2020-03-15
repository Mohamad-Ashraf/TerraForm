To run the project :
1. you need to provide terraform.tfvars with your own values to the variables.
2. run "terraform init" //to download and install the modules
3. run "terraform validate" // it should output "Success! The configuration is valid."
4. run "terraform paln" // it should works fine
5. run "terraform apply" //the error appears here after enter yes and here is it

"module.network.azurerm_resource_group.network: Creating...
module.sql-database.azurerm_resource_group.rg: Creating...
module.linuxservers.azurerm_resource_group.vm: Creating...
module.windowsservers.azurerm_resource_group.vm: Creating...

Error: A resource with the ID "/subscriptions/sub-id/resourceGroups/terraform-advancedvms" already exists - to be managed via Terraform this resource needs to be imported into the State. Please see the resource documentation for "azurerm_resource_group" for more information.

on .terraform\modules\linuxservers\Azure-terraform-azurerm-compute-9952198\main.tf line 15, in resource "azurerm_resource_group" "vm":
  15: resource "azurerm_resource_group" "vm" {



Error: A resource with the ID "/subscriptions/sub-id/resourceGroups/terraform-advancedvms" already exists - to be managed via Terraform this resource needs to be imported into the State. Please see the resource documentation for "azurerm_resource_group" for more information.

  on .terraform\modules\network\Azure-terraform-azurerm-network-564155f\main.tf line 2, in resource
"azurerm_resource_group" "network":
   2: resource "azurerm_resource_group" "network" {



Error: A resource with the ID "/subscriptions/sub-id/resourceGroups/terraform-advancedvms" already exists - to be managed via Terraform this resource needs to be imported
 into the State. Please see the resource documentation for "azurerm_resource_group" for more informa
tion.

  on .terraform\modules\sql-database\Azure-terraform-azurerm-database-d00334f\main.tf line 8, in res
ource "azurerm_resource_group" "rg":
   8: resource "azurerm_resource_group" "rg" {



Error: A resource with the ID "/subscriptions/sub-id/resourceGroups/terraform-advancedvms" already exists - to be managed via Terraform this resource needs to be imported
 into the State. Please see the resource documentation for "azurerm_resource_group" for more informa
tion.

  on .terraform\modules\windowsservers\Azure-terraform-azurerm-compute-9952198\main.tf line 15, in r
esource "azurerm_resource_group" "vm":
  15: resource "azurerm_resource_group" "vm" {



C:\Users\Mohamed\Documents\GitHub\TerraForm>
