resource "azurerm_network_security_group" "nsgblock" {
  for_each            = var.nsgs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                       = security_rule.each.value.name
      priority                   = security_rule.each.value.priority
      direction                  = security_rule.each.value.direction
      access                     = security_rule.each.value.access
      protocol                   = security_rule.each.value.protocol
      source_port_range          = security_rule.each.value.source_port_range
      destination_port_range     = security_rule.each.value.destination_port_range
      source_address_prefix      = security_rule.each.value.source_address_prefix
      destination_address_prefix = security_rule.each.value.destination_address_prefix
    }
  }

}
