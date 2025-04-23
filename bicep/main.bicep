@secure()
param randomSeed string  // Input seed to ensure uniqueness for randomness

// Generate Random Suffix
var randomStringJapanEast = uniqueString(format('{0}-JE', randomSeed))
var randomStringSoutheastAsia = uniqueString(format('{0}-SEA', randomSeed))

// Replace underscores with hyphens in generated names
var webAppNameJapanEast = format('VidSpot-JE-{0}', randomStringJapanEast)
var webAppNameSoutheastAsia = format('VidSpot-SEA-{0}', randomStringSoutheastAsia)

// Define App Service Plan for Central India
resource appServicePlanJapanEast 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'TechSolutionsPlanJapanEast'
  location: 'JapanEast'
  sku: {
    name: 'S1'
    tier: 'Standard'
    capacity: 1
  }
}

// Define App Service Plan for Southeast Asia
resource appServicePlanSoutheastAsia 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'TechSolutionsPlanSoutheastAsia'
  location: 'southeastasia'
  sku: {
    name: 'S1'
    tier: 'Standard'
    capacity: 1
  }
}

// Define Web App for JapanEast
resource webAppJapanEast 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppNameJapanEast
  location: 'JapanEast'
  properties: {
    serverFarmId: appServicePlanJapanEast.id
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

output webAppNameJapanEast string = webAppJapanEast.name
output webAppNameSoutheastAsia string = webAppSoutheastAsia.name

