@secure()
param randomSeed string  // Input seed to ensure uniqueness for randomness

// Generate Random Suffix
var randomStringCentralIndia = uniqueString(format('{0}-CI', randomSeed))
var randomStringSoutheastAsia = uniqueString(format('{0}-SEA', randomSeed))

// Replace underscores with hyphens in generated names
var webAppNameCentralIndia = format('VidSpot-CI-{0}', randomStringCentralIndia)
var webAppNameSoutheastAsia = format('VidSpot-SEA-{0}', randomStringSoutheastAsia)

// Define App Service Plan for Central India
resource appServicePlanCentralIndia 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'TechSolutionsPlanCentralIndia'
  location: 'centralindia'
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
}

// Define App Service Plan for Southeast Asia
resource appServicePlanSoutheastAsia 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'TechSolutionsPlanSoutheastAsia'
  location: 'southeastasia'
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
}

// Define Web App for Central India
resource webAppCentralIndia 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppNameCentralIndia
  location: 'centralindia'
  properties: {
    serverFarmId: appServicePlanCentralIndia.id
  }
}

// Define Web App for Southeast Asia
resource webAppSoutheastAsia 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppNameSoutheastAsia
  location: 'southeastasia'
  properties: {
    serverFarmId: appServicePlanSoutheastAsia.id
  }
}

output webAppNameCentralIndia string = webAppCentralIndia.name
output webAppNameSoutheastAsia string = webAppSoutheastAsia.name

