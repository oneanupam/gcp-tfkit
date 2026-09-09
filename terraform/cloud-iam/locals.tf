# locals block to modify and reuse values
locals {
  project_id = data.google_project.current_project.project_id
  labels = {
    project     = "foundations"
    environment = "tst"
  }

  # flatten() function takes a list that contains other nested lists and collapses it into a single, flat list with all elements at the top level
  project_access = {
    for item in flatten([
      for role, members in var.project_access : [
        for member in members :
        {
          role   = role
          member = member
        }
      ]
    ]) :
    "${item.role}-${item.member}" => item
  }
}
