// Define App Service Plan for Central India (Free Tier)
resource appServicePlanCentralIndia 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'TechSolutionsPlanCentralIndia'
  location: 'centralindia' // Explicit location
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
}

// Define App Service Plan for Southeast Asia (Free Tier)
resource appServicePlanSoutheastAsia 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'TechSolutionsPlanSoutheastAsia'
  location: 'southeastasia' // Explicit location
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
}

// Define Web App for Central India
resource webAppCentralIndia 'Microsoft.Web/sites@2022-03-01' = {
  name: 'TechSolutionsWebAppCentralIndia'
  location: 'centralindia' // Explicit location
  properties: {
    serverFarmId: appServicePlanCentralIndia.id
  }
}

// Define Web App for Southeast Asia
resource webAppSoutheastAsia 'Microsoft.Web/sites@2022-03-01' = {
  name: 'TechSolutionsWebAppSoutheastAsia'
  location: 'southeastasia' // Explicit location
  properties: {
    serverFarmId: appServicePlanSoutheastAsia.id
  }
}
