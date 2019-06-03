folder("rasta-rocket")
multibranchPipelineJob("rasta-rocket/terraform-inventory") {
  branchSources {
    github {
      repoOwner('rasta-rocket')
      repository('terraform-inventory')
    }
  }
}
